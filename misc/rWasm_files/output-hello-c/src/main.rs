mod guest_mem_wrapper;

use std::convert::TryInto;

#[derive(Copy, Clone, Debug)]
enum TaggedVal {
    I32(i32),
    I64(i64),
    F32(f32),
    F64(f64),
    Handle(Handle), // <<MSWASMONLY>>
    Undefined,
}

impl Default for TaggedVal {
    fn default() -> Self {
        TaggedVal::Undefined
    }
}

#[derive(Copy, Clone, Debug, PartialEq, Eq)]
enum ValType {
    I32,
    I64,
    F32,
    F64,
    Handle, // <<MSWASMONLY>>
    Undefined,
}

impl From<TaggedVal> for ValType {
    fn from(v: TaggedVal) -> Self {
        match v {
            TaggedVal::I32(_) => ValType::I32,
            TaggedVal::I64(_) => ValType::I64,
            TaggedVal::F32(_) => ValType::F32,
            TaggedVal::F64(_) => ValType::F64,
            TaggedVal::Handle(_) => ValType::Handle, // <<MSWASMONLY>>
            TaggedVal::Undefined => ValType::Undefined,
        }
    }
}

macro_rules! tagged_value_conversion {
    ($ty:ty, $try_as:ident, $e:tt) => {
        impl TaggedVal {
            #[inline]
            #[allow(dead_code)]
            fn $try_as(&self) -> Option<$ty> {
                if let $e(v) = self {
                    Some(*v)
                } else {
                    None
                }
            }
        }

        impl From<$ty> for TaggedVal {
            #[inline]
            #[allow(dead_code)]
            fn from(v: $ty) -> Self {
                $e(v)
            }
        }
    };
}

tagged_value_conversion! {i32, try_as_i32, I32}
tagged_value_conversion! {i64, try_as_i64, I64}
tagged_value_conversion! {f32, try_as_f32, F32}
tagged_value_conversion! {f64, try_as_f64, F64}

impl From<u32> for TaggedVal {
    #[inline]
    #[allow(dead_code)]
    fn from(v: u32) -> Self {
        I32(v as i32)
    }
}

impl From<u64> for TaggedVal {
    #[inline]
    #[allow(dead_code)]
    fn from(v: u64) -> Self {
        I64(v as i64)
    }
}

trait SafeFloatConv<T> {
    fn try_to_int(self) -> Option<T>;
}
macro_rules! safe_float_conv {
    ($from:ty, $to:ty) => {
        impl SafeFloatConv<$to> for $from {
            fn try_to_int(self) -> Option<$to> {
                if self.is_finite() {
                    Some(self as $to)
                } else {
                    None
                }
            }
        }
    };
    ($to: ty) => {
        safe_float_conv! {f32, $to}
        safe_float_conv! {f64, $to}
    };
}
safe_float_conv! {i32}
safe_float_conv! {u32}
safe_float_conv! {i64}
safe_float_conv! {u64}

#[allow(unused_imports)]
use TaggedVal::*;

tagged_value_conversion! {Handle, try_as_handle, Handle}
impl TaggedVal {
    // This alias exists only to make the generator a little easier;
    // could be fixed up on that end with some work to remove this
    // line, but since it doesn't impact performance, it is fine to
    // keep this around
    #[inline(always)]
    #[allow(dead_code, non_snake_case)]
    fn try_as_Handle(&self) -> Option<Handle> {
        self.try_as_handle()
    }
}

#[derive(Copy, Clone, Debug)]
pub enum Handle {
    Valid {
        base_segment_id: u32, // Note: Using segment ID here, rather than a base into memory
        offset: u32,
        // Note: Ignoring `bound: u32` for now, since we don't (yet)
        // have handle.slice/segment_slice/etc.
    },
    Corrupted {
        bytes: [u8; 8],
    },
    Null {
        offset: i32,
    },
}
impl std::fmt::Display for Handle {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            Handle::Valid {
                base_segment_id,
                offset,
            } => write!(f, "<seg={} off={:#x?}>", base_segment_id, offset),
            Handle::Corrupted { bytes } => write!(f, "<corrupted {:?}>", bytes),
            Handle::Null { offset } => write!(f, "<null off={:#x?}>", offset),
        }
    }
}

impl Handle {
    const NULL: Handle = Handle::Null { offset: 0 };

    #[allow(dead_code)]
    fn add(self, amt: i32) -> Option<Self> {
        match self {
            Handle::Null { offset } => Some(Handle::Null {
                offset: offset.checked_add(amt)?,
            }),
            Handle::Corrupted { .. } => None,
            Handle::Valid {
                base_segment_id,
                offset,
            } => {
                let offset: i32 = offset as _;
                let new_offset: i32 = offset.overflowing_add(amt).0;
                Some(Handle::Valid {
                    base_segment_id,
                    offset: new_offset as _,
                })
            }
        }
    }

    #[allow(dead_code)]
    fn sub(self, amt: i32) -> Option<Self> {
        self.add(-amt)
    }

    #[allow(dead_code)]
    #[cfg(any(target_pointer_width = "32", target_pointer_width = "64"))]
    fn segment_index(self) -> Option<usize> {
        match self {
            Handle::Null { .. } | Handle::Corrupted { .. } => None,
            Handle::Valid {
                base_segment_id,
                offset: _,
            } => Some(base_segment_id as _),
        }
    }

    #[allow(dead_code)]
    #[cfg(any(target_pointer_width = "32", target_pointer_width = "64"))]
    fn segment_offset(self) -> Option<usize> {
        match self {
            Handle::Null { offset } => Some(offset as _),
            Handle::Corrupted { .. } => None,
            Handle::Valid {
                base_segment_id: _,
                offset,
            } => Some(offset as _),
        }
    }

    #[allow(dead_code)]
    fn to_bytes(self) -> ([u8; 8], Tag) {
        match self {
            Handle::Null { offset: 0 } => {
                let mut res = [0u8; 8];
                res[..4].copy_from_slice(&u32::MAX.to_ne_bytes());
                res[4..].copy_from_slice(&u32::MAX.to_ne_bytes());
                (res, Tag::Handle)
            }
            Handle::Null { offset } => {
                todo!("Trying to convert null with offset {} to bytes", offset)
            }
            Handle::Valid {
                base_segment_id,
                offset,
            } => {
                let mut res = [0u8; 8];
                res[..4].copy_from_slice(&base_segment_id.to_ne_bytes());
                res[4..].copy_from_slice(&offset.to_ne_bytes());
                (res, Tag::Handle)
            }
            Handle::Corrupted { bytes } => (bytes, Tag::Data),
        }
    }

    #[allow(dead_code)]
    fn from_bytes(bytes: [u8; 8], tag: Tag) -> Self {
        if !tag.can_be_handle() {
            Handle::Corrupted { bytes }
        } else {
            let base_segment_id = u32::from_ne_bytes(bytes[..4].try_into().unwrap());
            let offset = u32::from_ne_bytes(bytes[4..].try_into().unwrap());
            if base_segment_id == u32::MAX {
                assert_eq!(offset, u32::MAX);
                Handle::Null { offset: 0 }
            } else {
                Handle::Valid {
                    base_segment_id,
                    offset,
                }
            }
        }
    }

    #[allow(dead_code)]
    fn is_eq(self, other: Self) -> bool {
        match (self, other) {
            (Handle::Null { offset: o1 }, Handle::Null { offset: o2 }) => o1 == o2,
            (Handle::Corrupted { bytes: b1 }, Handle::Corrupted { bytes: b2 }) => b1 == b2,
            (
                Handle::Valid {
                    base_segment_id: i1,
                    offset: o1,
                },
                Handle::Valid {
                    base_segment_id: i2,
                    offset: o2,
                },
            ) => i1 == i2 && o1 == o2,
            _ => false,
        }
    }

    #[allow(dead_code)]
    fn is_lt(self, other: Self) -> Option<bool> {
        match (self, other) {
            (Handle::Corrupted { .. }, _) | (_, Handle::Corrupted { .. }) => None,
            (Handle::Null { offset: o1 }, Handle::Null { offset: o2 }) => Some(o1 < o2),
            (Handle::Null { .. }, _) => Some(true),
            (_, Handle::Null { .. }) => Some(false),
            (
                Handle::Valid {
                    base_segment_id: i1,
                    offset: o1,
                },
                Handle::Valid {
                    base_segment_id: i2,
                    offset: o2,
                },
            ) => Some(i1 < i2 || (i1 == i2 && o1 < o2)),
        }
    }
}

impl WasmModule {
    #[allow(dead_code)]
    fn new_segment(&mut self, size: u32) -> Option<Handle> {
        if size == 0 {
            panic!("Trying to allocate 0 size segment. \
                    It is easy to \"support\" this, but likely indicates something unexpected is happening, thus the panic.")
        }
        if self.segments.is_empty() {
            // Use up the "0" segment, to prevent it from being used for a real segment
            self.segments.push(Segment::Freed);
        }
        let id: u32 = self.segments.len().try_into().ok()?;
        if id == u32::MAX {
            // Filled up entire segment space, no more segments left
            // to allocate. `u32::MAX` is reserved for the
            // representation of `Handle::Null`.
            return None;
        }
        self.segments.push(Segment::allocate(size));
        Some(Handle::Valid {
            base_segment_id: id,
            offset: 0,
        })
    }

    #[allow(dead_code)]
    fn free_segment(&mut self, h: Handle) -> Option<()> {
        match h {
            Handle::Valid {
                base_segment_id,
                offset,
            } => {
                if offset == 0 {
                    self.segments.get_mut(base_segment_id as usize)?.free();
                    Some(())
                } else {
                    None
                }
            }
            Handle::Corrupted { .. } => None,
            Handle::Null { .. } => None,
        }
    }
}

#[cfg(not(feature = "notags"))]
#[allow(dead_code)]
#[derive(Clone, Copy, PartialEq, Eq)]
enum Tag {
    Data,
    Handle,
}
#[cfg(not(feature = "notags"))]
impl Tag {
    fn can_be_handle(&self) -> bool {
        *self == Tag::Handle
    }
}
#[cfg(feature = "notags")]
#[allow(dead_code)]
#[derive(Clone, Copy, PartialEq, Eq)]
struct Tag {
    // A zero sized type, optimized away
}
#[cfg(feature = "notags")]
impl Tag {
    #[allow(non_upper_case_globals)]
    const Data: Self = Self {};
    #[allow(non_upper_case_globals)]
    const Handle: Self = Self {};
    fn can_be_handle(&self) -> bool {
        true
    }
}

#[cfg(all(not(feature = "packedtags"), not(feature = "notags")))]
struct Tags {
    tags: Vec<Tag>,
}
#[cfg(all(not(feature = "packedtags"), not(feature = "notags")))]
impl Tags {
    fn new(tags_size: usize) -> Self {
        Self {
            tags: vec![Tag::Data; tags_size],
        }
    }
    #[must_use]
    fn update(&mut self, tag_offset: usize, tag: Tag) -> Option<()> {
        *self.tags.get_mut(tag_offset)? = tag;
        Some(())
    }
    fn get(&self, tag_offset: usize) -> Option<Tag> {
        self.tags.get(tag_offset).cloned()
    }
}

#[cfg(feature = "packedtags")]
struct Tags {
    packed_tags: Vec<u64>,
}
#[cfg(feature = "packedtags")]
impl Tags {
    fn new(tags_size: usize) -> Self {
        Self {
            packed_tags: vec![0u64; (tags_size + 63) / 64],
        }
    }
    #[must_use]
    fn update(&mut self, tag_offset: usize, tag: Tag) -> Option<()> {
        if tag.can_be_handle() {
            *self.packed_tags.get_mut(tag_offset / 64)? |= 1 << (tag_offset % 64);
        } else {
            *self.packed_tags.get_mut(tag_offset / 64)? &= !(1 << (tag_offset % 64));
        }
        Some(())
    }
    fn get(&self, tag_offset: usize) -> Option<Tag> {
        if self.packed_tags.get(tag_offset / 64)? & (1 << (tag_offset % 64)) == 0 {
            Some(Tag::Data)
        } else {
            Some(Tag::Handle)
        }
    }
}

#[cfg(feature = "notags")]
struct Tags {
    // A zero sized type, optimized away
}
#[cfg(feature = "notags")]
impl Tags {
    fn new(_tags_size: usize) -> Self {
        Self {}
    }
    fn update(&mut self, _tag_offset: usize, _tag: Tag) -> Option<()> {
        Some(())
    }
    fn get(&self, _tag_offset: usize) -> Option<Tag> {
        Some(Tag {})
    }
}

#[allow(dead_code)]
enum Segment {
    Freed,
    Allocated { data: Vec<u8>, tags: Tags },
}
type Segments = Vec<Segment>;

#[allow(dead_code)]
impl Segment {
    fn free(&mut self) {
        *self = Segment::Freed;
    }

    fn allocate(size: u32) -> Self {
        let size = size as usize;
        let tag_size = size.checked_add(7).unwrap() / 8; // ceiling-divide by 8
        Segment::Allocated {
            data: vec![0u8; size],
            tags: Tags::new(tag_size),
        }
    }

    fn get_data(&self) -> Option<&[u8]> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, .. } => Some(data.as_ref()),
        }
    }

    fn len(&self) -> Option<usize> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, .. } => Some(data.len()),
        }
    }

    // Performs the necessary type conversion at write time as
    // described in the MS-Wasm position paper
    fn get_mut_data(&mut self, update_offset: usize) -> Option<&mut [u8]> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, tags } => {
                tags.update(update_offset / 8, Tag::Data)?;
                Some(data.as_mut())
            }
        }
    }

    fn get_mut_data_slice(&mut self, start: usize, end: usize) -> Option<&mut [u8]> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, tags } => {
                for i in start / 8..end / 8 {
                    tags.update(i, Tag::Data)?;
                }
                Some(data.as_mut())
            }
        }
    }

    fn get_handle(&self, offset: usize) -> Option<Handle> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, tags } => {
                if offset % 8 != 0 {
                    None
                } else {
                    Some(Handle::from_bytes(
                        data.get(offset..offset + 8)?.try_into().ok()?,
                        tags.get(offset / 8)?,
                    ))
                }
            }
        }
    }

    // Performs the necessary type conversion at write time as
    // described in the MS-Wasm position paper
    fn store_handle(&mut self, offset: usize, handle: Handle) -> Option<()> {
        match self {
            Segment::Freed => None,
            Segment::Allocated { data, tags } => {
                let (bytes, tag) = handle.to_bytes();
                data.get_mut(offset..offset + 8)?.copy_from_slice(&bytes);
                tags.update(offset / 8, tag)?;
                Some(())
            }
        }
    }
}

fn with_collected_memory_0<T, U: Into<Option<T>>>(
    _segments: &mut Segments,
    f: impl FnOnce(&guest_mem_wrapper::GuestMemWrapper) -> U,
) -> Option<T> {
    f(&guest_mem_wrapper::GuestMemWrapper::from(&mut [])).into()
}

fn with_collected_memory_1<T, U: Into<Option<T>>>(
    segments: &mut Segments,
    h0: Handle,
    f: impl FnOnce(&guest_mem_wrapper::GuestMemWrapper, i32) -> U,
) -> Option<T> {
    let seg = segments.get_mut(h0.segment_index()?)?;
    let res = f(
        &guest_mem_wrapper::GuestMemWrapper::from(seg.get_mut_data_slice(0, 0)?),
        h0.segment_offset()?.try_into().ok()?,
    )
    .into()?;
    Some(res)
}

macro_rules! write {
    (store_handle, $segments:expr, $handle:expr, $val:expr) => {
        $segments
            .get_mut($handle.segment_index()?)?
            .store_handle($handle.segment_offset()?, $val)?;
    };
    ($writefn:ident, $segments:expr, $handle:expr, $val:expr) => {
        $writefn(
            $segments
                .get_mut($handle.segment_index()?)?
                .get_mut_data($handle.segment_offset()?)?,
            ($handle.segment_offset()?) as usize,
            $val,
        )?;
    };
}

macro_rules! read {
    (get_handle, $segments:expr, $handle:expr) => {
        $segments
            .get($handle.segment_index()?)?
            .get_handle($handle.segment_offset()?)?
    };
    (bytes, $segments:expr, $handle:expr, $len:expr) => {
        &$segments.get($handle.segment_index()?)?.get_data()?[$handle.segment_offset()?..][..$len]
    };
    ($readfn:ident, $segments:expr, $handle:expr) => {
        $readfn(
            $segments.get($handle.segment_index()?)?.get_data()?,
            ($handle.segment_offset()?) as usize,
        )?
    };
}

mod ms_wasm_wasi {

    use super::*;
    use wasi_common::wasi::wasi_snapshot_preview1;

    #[allow(dead_code)]
    // args_get(argv: Pointer<Pointer<u8>>, argv_buf: Pointer<u8>) -> Result<(), errno>
    pub(super) fn args_get(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: Handle,
        arg1: Handle,
    ) -> Option<i32> {
        let (argv_count, argv_buf_len) = {
            let mut memory = [0u8; 4 + 4];
            wasi_snapshot_preview1::args_sizes_get(
                ctx,
                &guest_mem_wrapper::GuestMemWrapper::from(&mut memory),
                0,
                4,
            );
            (read_mem_u32(&memory, 0)?, read_mem_u32(&memory, 4)?)
        };

        let argv_buf_start = (argv_count + 1) * 4;
        let mut memory: Vec<u8> = vec![0u8; (argv_buf_start + (argv_buf_len + 1)) as usize];
        let res = wasi_snapshot_preview1::args_get(
            ctx,
            &guest_mem_wrapper::GuestMemWrapper::from(&mut memory),
            0,
            argv_buf_start as i32,
        );

        for i in 0..argv_count {
            write!(
                store_handle,
                segments,
                arg0.add(i as i32 * 8)?,
                arg1.add(read_mem_i32(&memory, i as usize * 4)? - argv_buf_start as i32)?
            );
        }
        for i in 0..argv_buf_len {
            write!(
                write_mem_u8,
                segments,
                arg1.add(i as i32)?,
                read_mem_u8(&memory, (argv_buf_start + i) as usize)?
            );
        }

        Some(res)
    }

    #[allow(dead_code)]
    // args_sizes_get() -> Result<(size, size), errno>
    pub(super) fn args_sizes_get(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: Handle,
        arg1: Handle,
    ) -> Option<i32> {
        let mut memory = [0u8; 4 + 4];
        let res = wasi_snapshot_preview1::args_sizes_get(
            ctx,
            &guest_mem_wrapper::GuestMemWrapper::from(&mut memory),
            0,
            4,
        );

        let arg0_res = read_mem_u32(&memory, 0)?;
        let arg1_res = read_mem_u32(&memory, 4)?;

        write!(write_mem_u32, segments, arg0, arg0_res);
        write!(write_mem_u32, segments, arg1, arg1_res);

        Some(res)
    }

    #[allow(dead_code)]
    // clock_time_get(id: clockid, precision: timestamp) -> Result<timestamp, errno>
    pub(super) fn clock_time_get(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: i32,
        arg1: i64,
        arg2: Handle,
    ) -> Option<i32> {
        // No internal pointers, just pass through directly
        with_collected_memory_1(segments, arg2, |mem, arg2| {
            wasi_snapshot_preview1::clock_time_get(ctx, mem, arg0, arg1, arg2)
        })
    }

    #[allow(dead_code)]
    // fd_close(fd: fd) -> Result<(), errno>
    pub(super) fn fd_close(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: i32,
    ) -> Option<i32> {
        // No pointers, just pass through directly
        with_collected_memory_0(segments, |mem| {
            wasi_snapshot_preview1::fd_close(ctx, mem, arg0)
        })
    }

    #[allow(dead_code)]
    // fd_fdstat_get(fd: fd) -> Result<fdstat, errno>
    pub(super) fn fd_fdstat_get(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: i32,
        arg1: Handle,
    ) -> Option<i32> {
        // No internal pointers, just pass through directly
        with_collected_memory_1(segments, arg1, |mem, arg1| {
            wasi_snapshot_preview1::fd_fdstat_get(ctx, mem, arg0, arg1)
        })
    }

    #[allow(dead_code)]
    // fd_seek(fd: fd, offset: filedelta, whence: whence) -> Result<filesize, errno>
    pub(super) fn fd_seek(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        arg0: i32,
        arg1: i64,
        arg2: i32,
        arg3: Handle,
    ) -> Option<i32> {
        // No internal pointers, just pass through directly
        with_collected_memory_1(segments, arg3, |mem, arg3| {
            wasi_snapshot_preview1::fd_seek(ctx, mem, arg0, arg1, arg2, arg3)
        })
    }

    #[allow(dead_code)]
    // fd_write(fd: fd, iovs: ciovec_array) -> Result<size, errno>
    pub(super) fn fd_write(
        ctx: &wasi_common::WasiCtx,
        segments: &mut Segments,
        fd: i32,
        iovs_ptr: Handle,
        iovs_len: i32,
        nwritten: Handle,
    ) -> Option<i32> {
        let mut iovs: Vec<&[u8]> = vec![];
        for i in 0..iovs_len {
            let loc = read!(get_handle, segments, iovs_ptr.add(i * (8 + 8) + 0)?);
            let len = read!(read_mem_u32, segments, iovs_ptr.add(i * (8 + 8) + 8)?) as usize;
            if len == 0 {
                iovs.push(&[]);
            } else {
                iovs.push(read!(bytes, segments, loc, len));
            }
        }

        let nwritten_start: usize = 8 * iovs.len();
        let mem_iovs_data_start: usize = nwritten_start + 4;
        let mem_iovs_data_len: usize = iovs.iter().map(|x| x.len()).sum();

        let mut memory = vec![0u8; mem_iovs_data_start + mem_iovs_data_len + 4];
        {
            let mut start = mem_iovs_data_start as u32;
            for (i, iov) in iovs.into_iter().enumerate() {
                write_mem_u32(&mut memory, 8 * i + 0, start)?;
                write_mem_u32(&mut memory, 8 * i + 4, iov.len() as u32)?;
                memory[start as usize..start as usize + iov.len()].copy_from_slice(iov);
                start += iov.len() as u32;
            }
            assert_eq!(start as usize, mem_iovs_data_start + mem_iovs_data_len);
        }

        assert!(nwritten_start % 4 == 0, "nwritten_start must be 4-aligned");

        let res = wasi_snapshot_preview1::fd_write(
            ctx,
            &guest_mem_wrapper::GuestMemWrapper::from(&mut memory),
            fd,
            0,
            iovs_len,
            nwritten_start as i32,
        );

        let nwritten_res = read_mem_u32(&memory, nwritten_start)?;
        write!(write_mem_u32, segments, nwritten, nwritten_res);

        Some(res)
    }
}

#[allow(dead_code)]
pub struct WasmModule {
    segments: Segments,
    globals: Vec<TaggedVal>,
    indirect_call_table: Vec<Option<usize>>,
    context: wasi_common::WasiCtx,
}

macro_rules! memory_accessors {
    ($ty:ty, $read:ident, $write:ident) => {
        #[inline]
        #[allow(dead_code)]
        fn $read(memory: &[u8], addr: usize) -> Option<$ty> {
            Some(<$ty>::from_le_bytes(
                memory
                    .get(addr..addr + std::mem::size_of::<$ty>())?
                    .try_into()
                    .ok()?,
            ))
        }

        #[inline]
        #[allow(dead_code)]
        fn $write(memory: &mut [u8], addr: usize, value: $ty) -> Option<()> {
            memory
                .get_mut(addr..addr + std::mem::size_of::<$ty>())?
                .copy_from_slice(&value.to_le_bytes());
            Some(())
        }
    };
}

memory_accessors! {u8, read_mem_u8, write_mem_u8}
memory_accessors! {u16, read_mem_u16, write_mem_u16}
memory_accessors! {u32, read_mem_u32, write_mem_u32}
memory_accessors! {u64, read_mem_u64, write_mem_u64}

memory_accessors! {i8, read_mem_i8, write_mem_i8}
memory_accessors! {i16, read_mem_i16, write_mem_i16}
memory_accessors! {i32, read_mem_i32, write_mem_i32}
memory_accessors! {i64, read_mem_i64, write_mem_i64}

memory_accessors! {f32, read_mem_f32, write_mem_f32}
memory_accessors! {f64, read_mem_f64, write_mem_f64}

impl WasmModule {
    #[allow(unused_mut)]
    fn try_new() -> Option<Self> {
        let mut m = WasmModule {
            segments: Segments::new(),
            globals: vec![],
            indirect_call_table: vec![],
            context: wasi_common::WasiCtx::new(std::env::args())
                .expect("Unable to initialize WASI context"),
        };
        m.globals.resize_with(2, Default::default);
        m.globals[0] = TaggedVal::from(Handle::NULL);
        m.globals[1] = TaggedVal::from(Handle::NULL);
        if m.indirect_call_table.len() < 5 {
            m.indirect_call_table.resize(5, None)
        }
        m.indirect_call_table[1] = Some(26);
        m.indirect_call_table[2] = Some(24);
        m.indirect_call_table[3] = Some(28);
        m.indirect_call_table[4] = Some(30);
        let init_handle = m.new_segment(131072).unwrap();
        m.globals[1] = TaggedVal::from(init_handle); /* WORKAROUND for mswasm-llvm and data segment initialization */
        m.segments
            .get_mut(init_handle.segment_index().unwrap())
            .unwrap()
            .get_mut_data_slice(1024, 1037)
            .unwrap()[1024..1037]
            .copy_from_slice(&[72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100, 33, 0]);
        m.segments
            .get_mut(init_handle.segment_index().unwrap())
            .unwrap()
            .get_mut_data_slice(1040, 1224)
            .unwrap()[1040..1224]
            .copy_from_slice(&[
                5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 224, 4, 0,
                0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 1, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            ]);
        {
            let newseg = Handle::NULL;
            write!(store_handle, m.segments, init_handle.add(1240)?, newseg);
        }
        {
            let newseg = Handle::NULL;
            write!(store_handle, m.segments, init_handle.add(1248)?, newseg);
        }
        {
            let newseg = Handle::NULL;
            write!(store_handle, m.segments, init_handle.add(1264)?, newseg);
        }
        {
            let newseg = Handle::NULL;
            write!(store_handle, m.segments, init_handle.add(1272)?, newseg);
        }
        {
            let newseg = Handle::NULL;
            write!(store_handle, m.segments, init_handle.add(1280)?, newseg);
        }
        {
            let newseg = { m.new_segment(1025)? };
            write!(store_handle, m.segments, init_handle.add(1312)?, newseg);
        }
        Some(m)
    }
    pub fn new() -> Self {
        Self::try_new().unwrap()
    }
}

impl WasmModule {
    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_0(&mut self, arg_0: i32) -> Option<i32> {
        Some(ms_wasm_wasi::fd_close(
            &self.context,
            &mut self.segments,
            arg_0,
        )?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_1(&mut self, arg_0: i32, arg_1: Handle) -> Option<i32> {
        Some(ms_wasm_wasi::fd_fdstat_get(
            &self.context,
            &mut self.segments,
            arg_0,
            arg_1,
        )?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_2(&mut self, arg_0: i32, arg_1: i64, arg_2: i32, arg_3: Handle) -> Option<i32> {
        Some(ms_wasm_wasi::fd_seek(
            &self.context,
            &mut self.segments,
            arg_0,
            arg_1,
            arg_2,
            arg_3,
        )?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_3(&mut self, arg_0: i32, arg_1: Handle, arg_2: i32, arg_3: Handle) -> Option<i32> {
        Some(ms_wasm_wasi::fd_write(
            &self.context,
            &mut self.segments,
            arg_0,
            arg_1,
            arg_2,
            arg_3,
        )?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_4(&mut self, arg_0: i32) -> Option<()> {
        std::process::exit(arg_0)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_5(&mut self) -> Option<()> {
        self.func_6()?;
        Some(())
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_6(&mut self) -> Option<()> {
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        v0 = TaggedVal::from(2097152i32);
        v0 = TaggedVal::from(self.new_segment(v0.try_as_i32()? as u32)?);
        v1 = TaggedVal::from(2097152i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        self.globals[0] = TaggedVal::from(v0.try_as_Handle()?);
        Some(())
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_7(&mut self) -> Option<()> {
        let mut local_0: i32 = 0i32;
        let mut v0: TaggedVal;
        self.func_5()?;
        v0 = TaggedVal::from(self.func_9()?);
        local_0 = v0.try_as_i32()?;
        self.func_16()?;
        'label_0: loop {
            v0 = TaggedVal::from(local_0);
            v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_0;
            }
            v0 = TaggedVal::from(local_0);
            self.func_14(v0.try_as_i32()?)?;
            unreachable!("Reached a point explicitly marked unreachable in WASM module");
            break;
        }
        Some(())
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_8(&mut self) -> Option<i32> {
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        v0 = self.globals[1];
        v1 = TaggedVal::from(1024i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v0 = TaggedVal::from(self.func_22(v0.try_as_Handle()?)?);

        v0 = TaggedVal::from(0i32);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_9(&mut self) -> Option<i32> {
        let mut v0: TaggedVal;
        v0 = TaggedVal::from(self.func_8()?);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_10(&mut self, arg_0: i32) -> Option<i32> {
        let mut local_0: i32 = arg_0;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        v0 = TaggedVal::from(local_0);
        v0 = TaggedVal::from(self.func_0(v0.try_as_i32()?)?);
        v1 = TaggedVal::from(65535i32);
        v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_11(&mut self, arg_0: i32, arg_1: Handle) -> Option<i32> {
        let mut local_0: i32 = arg_0;
        let mut local_1: Handle = arg_1;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(local_1);
        v0 = TaggedVal::from(self.func_1(v0.try_as_i32()?, v1.try_as_Handle()?)?);
        v1 = TaggedVal::from(65535i32);
        v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_12(&mut self, arg_0: i32, arg_1: i64, arg_2: i32, arg_3: Handle) -> Option<i32> {
        let mut local_0: i32 = arg_0;
        let mut local_1: i64 = arg_1;
        let mut local_2: i32 = arg_2;
        let mut local_3: Handle = arg_3;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        let mut v3: TaggedVal;
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(local_1);
        v2 = TaggedVal::from(local_2);
        v3 = TaggedVal::from(local_3);
        v0 = TaggedVal::from(self.func_2(
            v0.try_as_i32()?,
            v1.try_as_i64()?,
            v2.try_as_i32()?,
            v3.try_as_Handle()?,
        )?);
        v1 = TaggedVal::from(65535i32);
        v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_13(&mut self, arg_0: i32, arg_1: Handle, arg_2: i32, arg_3: Handle) -> Option<i32> {
        let mut local_0: i32 = arg_0;
        let mut local_1: Handle = arg_1;
        let mut local_2: i32 = arg_2;
        let mut local_3: Handle = arg_3;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        let mut v3: TaggedVal;
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(local_1);
        v2 = TaggedVal::from(local_2);
        v3 = TaggedVal::from(local_3);
        v0 = TaggedVal::from(self.func_3(
            v0.try_as_i32()?,
            v1.try_as_Handle()?,
            v2.try_as_i32()?,
            v3.try_as_Handle()?,
        )?);
        v1 = TaggedVal::from(65535i32);
        v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_14(&mut self, arg_0: i32) -> Option<()> {
        let mut local_0: i32 = arg_0;
        let mut v0: TaggedVal;
        v0 = TaggedVal::from(local_0);
        self.func_4(v0.try_as_i32()?)?;
        unreachable!("Reached a point explicitly marked unreachable in WASM module");
        // no implicit return
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_15(&mut self) -> Option<()> {
        Some(())
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_16(&mut self) -> Option<()> {
        self.func_15()?;
        self.func_17()?;
        Some(())
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_17(&mut self) -> Option<()> {
        let mut local_0: Handle = Handle::NULL;
        let mut local_1: i32 = 0i32;
        let mut local_2: Handle = Handle::NULL;
        let mut local_3: Handle = Handle::NULL;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        let mut v3: TaggedVal;
        let mut v4: TaggedVal;
        'label_0: loop {
            v0 = self.globals[1];
            v1 = TaggedVal::from(1040i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            local_0 = v0.try_as_Handle()?;
            v1 = TaggedVal::from(40i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v0 = TaggedVal::from(read!(
                get_handle,
                self.segments,
                v0.try_as_handle()?.add(0)?
            ));
            v1 = TaggedVal::from(local_0);
            v2 = TaggedVal::from(48i32);
            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
            v1 = TaggedVal::from(read!(
                get_handle,
                self.segments,
                v1.try_as_handle()?.add(0)?
            ));
            v0 = TaggedVal::from(v0.try_as_handle()?.is_eq(v1.try_as_handle()?) as u32);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_0;
            }
            v0 = self.globals[1];
            v1 = TaggedVal::from(1040i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            local_0 = v0.try_as_Handle()?;
            v1 = TaggedVal::from(64i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v0 = TaggedVal::from(read_mem_i32(
                &self
                    .segments
                    .get(v0.try_as_Handle()?.segment_index()?)?
                    .get_data()?,
                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            )?);
            local_1 = v0.try_as_i32()?;
            v0 = TaggedVal::from(local_0);
            v1 = TaggedVal::from(Handle::NULL);
            v2 = TaggedVal::from(0i32);
            v3 = TaggedVal::from(local_1);
            {
                let rets = self.indirect_call(v3.try_as_i32()? as usize, &[v0, v1, v2])?;
                if rets.len() != 1 {
                    return None;
                }
                v0 = rets[0];
            }

            break;
        }
        'label_1: loop {
            v0 = self.globals[1];
            v1 = TaggedVal::from(1040i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            local_0 = v0.try_as_Handle()?;
            v1 = TaggedVal::from(8i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v0 = TaggedVal::from(read!(
                get_handle,
                self.segments,
                v0.try_as_handle()?.add(0)?
            ));
            local_2 = v0.try_as_Handle()?;
            v1 = TaggedVal::from(local_0);
            v2 = TaggedVal::from(16i32);
            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
            v1 = TaggedVal::from(read!(
                get_handle,
                self.segments,
                v1.try_as_handle()?.add(0)?
            ));
            local_0 = v1.try_as_Handle()?;
            v0 = TaggedVal::from(v0.try_as_handle()?.is_eq(v1.try_as_handle()?) as u32);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_1;
            }
            v0 = self.globals[1];
            v1 = TaggedVal::from(1040i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            local_3 = v0.try_as_Handle()?;
            v1 = TaggedVal::from(local_2);
            v1 = TaggedVal::from(v1.try_as_handle()?.segment_offset()? as u32);
            v2 = TaggedVal::from(local_0);
            v2 = TaggedVal::from(v2.try_as_handle()?.segment_offset()? as u32);
            v1 = TaggedVal::from(v1.try_as_i32()?.wrapping_sub(v2.try_as_i32()?));
            v1 = TaggedVal::from((v1.try_as_i32()? as i64));
            v2 = TaggedVal::from(1i32);
            v3 = TaggedVal::from(local_3);
            v4 = TaggedVal::from(72i32);
            v3 = TaggedVal::from(v3.try_as_handle()?.add(v4.try_as_i32()?)?);
            v3 = TaggedVal::from(read_mem_i32(
                &self
                    .segments
                    .get(v3.try_as_Handle()?.segment_index()?)?
                    .get_data()?,
                (v3.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            )?);
            {
                let rets = self.indirect_call(v3.try_as_i32()? as usize, &[v0, v1, v2])?;
                if rets.len() != 1 {
                    return None;
                }
                v0 = rets[0];
            }

            break;
        }
        Some(())
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_18(&mut self, arg_0: Handle) -> Option<i32> {
        let mut local_0: Handle = arg_0;
        let mut local_1: Handle = Handle::NULL;
        let mut local_2: i32 = 0i32;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        let mut v3: TaggedVal;
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(116i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        local_1 = v0.try_as_Handle()?;
        v1 = TaggedVal::from(local_1);
        v1 = TaggedVal::from(read_mem_i32(
            &self
                .segments
                .get(v1.try_as_Handle()?.segment_index()?)?
                .get_data()?,
            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
        )?);
        local_2 = v1.try_as_i32()?;
        v2 = TaggedVal::from(-1i32);
        v1 = TaggedVal::from(v1.try_as_i32()?.wrapping_add(v2.try_as_i32()?));
        v2 = TaggedVal::from(local_2);
        v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
        write_mem_i32(
            &mut self
                .segments
                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            v1.try_as_i32()?,
        )?;
        'label_0: loop {
            v0 = TaggedVal::from(local_0);
            v0 = TaggedVal::from(read_mem_i32(
                &self
                    .segments
                    .get(v0.try_as_Handle()?.segment_index()?)?
                    .get_data()?,
                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            )?);
            local_2 = v0.try_as_i32()?;
            v1 = TaggedVal::from(8i32);
            v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
            v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_0;
            }
            v0 = TaggedVal::from(local_0);
            v1 = TaggedVal::from(local_2);
            v2 = TaggedVal::from(32i32);
            v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
            write_mem_i32(
                &mut self
                    .segments
                    .get_mut(v0.try_as_Handle()?.segment_index()?)?
                    .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                v1.try_as_i32()?,
            )?;
            v0 = TaggedVal::from(-1i32);
            return Some(v0.try_as_i32()?);
            break;
        }
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(16i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v1 = TaggedVal::from(0i64);
        write_mem_i64(
            &mut self
                .segments
                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            v1.try_as_i64()?,
        )?;
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(8i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v1 = TaggedVal::from(0i64);
        write_mem_i64(
            &mut self
                .segments
                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            v1.try_as_i64()?,
        )?;
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(48i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v1 = TaggedVal::from(local_0);
        v2 = TaggedVal::from(80i32);
        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
        v1 = TaggedVal::from(read!(
            get_handle,
            self.segments,
            v1.try_as_handle()?.add(0)?
        ));
        local_1 = v1.try_as_Handle()?;
        write!(
            store_handle,
            self.segments,
            v0.try_as_handle()?.add(0)?,
            v1.try_as_handle()?
        );
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(40i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v1 = TaggedVal::from(local_1);
        write!(
            store_handle,
            self.segments,
            v0.try_as_handle()?.add(0)?,
            v1.try_as_handle()?
        );
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(32i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v1 = TaggedVal::from(local_1);
        v2 = TaggedVal::from(local_0);
        v3 = TaggedVal::from(88i32);
        v2 = TaggedVal::from(v2.try_as_handle()?.add(v3.try_as_i32()?)?);
        v2 = TaggedVal::from(read_mem_i32(
            &self
                .segments
                .get(v2.try_as_Handle()?.segment_index()?)?
                .get_data()?,
            (v2.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
        )?);
        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
        write!(
            store_handle,
            self.segments,
            v0.try_as_handle()?.add(0)?,
            v1.try_as_handle()?
        );
        v0 = TaggedVal::from(0i32);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_19(&mut self, arg_0: Handle, arg_1: i32, arg_2: i32, arg_3: Handle) -> Option<i32> {
        let mut local_0: Handle = arg_0;
        let mut local_1: i32 = arg_1;
        let mut local_2: i32 = arg_2;
        let mut local_3: Handle = arg_3;
        let mut local_4: i32 = 0i32;
        let mut local_5: Handle = Handle::NULL;
        let mut local_6: i32 = 0i32;
        let mut local_7: i32 = 0i32;
        let mut local_8: i32 = 0i32;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        let mut v3: TaggedVal;
        let mut v4: TaggedVal;
        v0 = TaggedVal::from(local_2);
        v1 = TaggedVal::from(local_1);
        v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_mul(v1.try_as_i32()?));
        local_4 = v0.try_as_i32()?;
        'label_0: loop {
            'label_1: loop {
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(32i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_5 = v0.try_as_Handle()?;
                v0 = TaggedVal::from(read!(
                    get_handle,
                    self.segments,
                    v0.try_as_handle()?.add(0)?
                ));
                v1 = TaggedVal::from(Handle::NULL);
                v0 = TaggedVal::from(v0.try_as_handle()?.is_eq(v1.try_as_handle()?) as u32);
                v1 = TaggedVal::from(1i32);
                v0 = TaggedVal::from(v0.try_as_i32()? ^ v1.try_as_i32()?);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_1;
                }
                v0 = TaggedVal::from(0i32);
                local_6 = v0.try_as_i32()?;
                v0 = TaggedVal::from(local_3);
                v0 = TaggedVal::from(self.func_18(v0.try_as_Handle()?)?);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_0;
                }
                break;
            }
            'label_2: loop {
                v0 = TaggedVal::from(local_5);
                v0 = TaggedVal::from(read!(
                    get_handle,
                    self.segments,
                    v0.try_as_handle()?.add(0)?
                ));
                v0 = TaggedVal::from(v0.try_as_handle()?.segment_offset()? as u32);
                v1 = TaggedVal::from(local_3);
                v2 = TaggedVal::from(40i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(read!(
                    get_handle,
                    self.segments,
                    v1.try_as_handle()?.add(0)?
                ));
                v1 = TaggedVal::from(v1.try_as_handle()?.segment_offset()? as u32);
                v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_sub(v1.try_as_i32()?));
                v1 = TaggedVal::from(local_4);
                v0 = TaggedVal::from(
                    ((v0.try_as_i32()? as u32) >= (v1.try_as_i32()? as u32)) as i32,
                );
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_2;
                }
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(local_0);
                v2 = TaggedVal::from(local_4);
                v3 = TaggedVal::from(local_3);
                v4 = TaggedVal::from(64i32);
                v3 = TaggedVal::from(v3.try_as_handle()?.add(v4.try_as_i32()?)?);
                v3 = TaggedVal::from(read_mem_i32(
                    &self
                        .segments
                        .get(v3.try_as_Handle()?.segment_index()?)?
                        .get_data()?,
                    (v3.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                )?);
                {
                    let rets = self.indirect_call(v3.try_as_i32()? as usize, &[v0, v1, v2])?;
                    if rets.len() != 1 {
                        return None;
                    }
                    v0 = rets[0];
                }
                local_6 = v0.try_as_i32()?;
                {}
                break 'label_0;
                break;
            }
            v0 = TaggedVal::from(0i32);
            local_7 = v0.try_as_i32()?;
            'label_3: loop {
                'label_4: loop {
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(120i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    v0 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v0.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    v1 = TaggedVal::from(0i32);
                    v0 = TaggedVal::from((v0.try_as_i32()? >= v1.try_as_i32()?) as i32);
                    if v0.try_as_i32()? != 0 {
                        {}
                        break 'label_4;
                    }
                    v0 = TaggedVal::from(local_4);
                    local_6 = v0.try_as_i32()?;
                    {}
                    break 'label_3;
                    break;
                }
                v0 = TaggedVal::from(local_4);
                v1 = TaggedVal::from(1i32);
                v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                local_6 = v0.try_as_i32()?;
                'label_5: loop {
                    'label_6: loop {
                        v0 = TaggedVal::from(local_6);
                        v1 = TaggedVal::from(1i32);
                        v0 = TaggedVal::from((v0.try_as_i32()? != v1.try_as_i32()?) as i32);
                        if v0.try_as_i32()? != 0 {
                            {}
                            break 'label_6;
                        }
                        v0 = TaggedVal::from(local_4);
                        local_6 = v0.try_as_i32()?;
                        v0 = TaggedVal::from(0i32);
                        local_7 = v0.try_as_i32()?;
                        {}
                        break 'label_3;
                        break;
                    }
                    v0 = TaggedVal::from(local_6);
                    v1 = TaggedVal::from(-2i32);
                    v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                    local_8 = v0.try_as_i32()?;
                    v0 = TaggedVal::from(local_6);
                    v1 = TaggedVal::from(-1i32);
                    v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                    local_7 = v0.try_as_i32()?;
                    local_6 = v0.try_as_i32()?;
                    v0 = TaggedVal::from(local_0);
                    v1 = TaggedVal::from(local_8);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    v0 = TaggedVal::from(
                        read_mem_u8(
                            &self
                                .segments
                                .get(v0.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )
                        .and_then(|x| Some(x as i32))?,
                    );
                    v1 = TaggedVal::from(10i32);
                    v0 = TaggedVal::from((v0.try_as_i32()? != v1.try_as_i32()?) as i32);
                    if v0.try_as_i32()? != 0 {
                        {}
                        continue 'label_5;
                    }
                    break;
                }
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(local_0);
                v2 = TaggedVal::from(local_7);
                v3 = TaggedVal::from(local_3);
                v4 = TaggedVal::from(64i32);
                v3 = TaggedVal::from(v3.try_as_handle()?.add(v4.try_as_i32()?)?);
                v3 = TaggedVal::from(read_mem_i32(
                    &self
                        .segments
                        .get(v3.try_as_Handle()?.segment_index()?)?
                        .get_data()?,
                    (v3.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                )?);
                {
                    let rets = self.indirect_call(v3.try_as_i32()? as usize, &[v0, v1, v2])?;
                    if rets.len() != 1 {
                        return None;
                    }
                    v0 = rets[0];
                }
                local_6 = v0.try_as_i32()?;
                v1 = TaggedVal::from(local_7);
                v0 =
                    TaggedVal::from(((v0.try_as_i32()? as u32) < (v1.try_as_i32()? as u32)) as i32);
                local_8 = v0.try_as_i32()?;
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_0;
                }
                v0 = TaggedVal::from(local_0);
                v1 = TaggedVal::from(local_7);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_0 = v0.try_as_Handle()?;
                v0 = TaggedVal::from(local_4);
                v1 = TaggedVal::from(0i32);
                v2 = TaggedVal::from(local_7);
                v3 = TaggedVal::from(local_8);
                if ValType::from(v1) != ValType::from(v2) {
                    return None;
                }
                if v3.try_as_i32()? != 0 {
                    v1 = v1;
                } else {
                    v1 = v2;
                }
                v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_sub(v1.try_as_i32()?));
                local_6 = v0.try_as_i32()?;
                break;
            }
            v0 = TaggedVal::from(local_3);
            v1 = TaggedVal::from(40i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            local_3 = v0.try_as_Handle()?;
            v0 = TaggedVal::from(read!(
                get_handle,
                self.segments,
                v0.try_as_handle()?.add(0)?
            ));
            v1 = TaggedVal::from(local_0);
            v2 = TaggedVal::from(local_6);
            v0 = TaggedVal::from(self.func_31(
                v0.try_as_Handle()?,
                v1.try_as_Handle()?,
                v2.try_as_i32()?,
            )?);

            v0 = TaggedVal::from(local_3);
            v1 = TaggedVal::from(local_3);
            v1 = TaggedVal::from(read!(
                get_handle,
                self.segments,
                v1.try_as_handle()?.add(0)?
            ));
            v2 = TaggedVal::from(local_6);
            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
            write!(
                store_handle,
                self.segments,
                v0.try_as_handle()?.add(0)?,
                v1.try_as_handle()?
            );
            v0 = TaggedVal::from(local_7);
            v1 = TaggedVal::from(local_6);
            v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
            local_6 = v0.try_as_i32()?;
            break;
        }
        'label_7: loop {
            v0 = TaggedVal::from(local_6);
            v1 = TaggedVal::from(local_4);
            v0 = TaggedVal::from((v0.try_as_i32()? != v1.try_as_i32()?) as i32);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_7;
            }
            v0 = TaggedVal::from(local_2);
            v1 = TaggedVal::from(0i32);
            v2 = TaggedVal::from(local_1);
            if ValType::from(v0) != ValType::from(v1) {
                return None;
            }
            if v2.try_as_i32()? != 0 {
                v0 = v0;
            } else {
                v0 = v1;
            }
            return Some(v0.try_as_i32()?);
            break;
        }
        v0 = TaggedVal::from(local_6);
        v1 = TaggedVal::from(local_1);
        v0 = TaggedVal::from((v0.try_as_i32()? as u32).checked_div(v1.try_as_i32()? as u32)?);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_20(&mut self, arg_0: Handle, arg_1: Handle) -> Option<i32> {
        let mut local_0: Handle = arg_0;
        let mut local_1: Handle = arg_1;
        let mut local_2: i32 = 0i32;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        let mut v3: TaggedVal;
        let mut v4: TaggedVal;
        let mut v5: TaggedVal;
        let mut v6: TaggedVal;
        v0 = TaggedVal::from(local_0);
        v0 = TaggedVal::from(self.func_32(v0.try_as_Handle()?)?);
        local_2 = v0.try_as_i32()?;
        v0 = TaggedVal::from(-1i32);
        v1 = TaggedVal::from(0i32);
        v2 = TaggedVal::from(local_2);
        v3 = TaggedVal::from(local_0);
        v4 = TaggedVal::from(1i32);
        v5 = TaggedVal::from(local_2);
        v6 = TaggedVal::from(local_1);
        v3 = TaggedVal::from(self.func_19(
            v3.try_as_Handle()?,
            v4.try_as_i32()?,
            v5.try_as_i32()?,
            v6.try_as_Handle()?,
        )?);
        v2 = TaggedVal::from((v2.try_as_i32()? != v3.try_as_i32()?) as i32);
        if ValType::from(v0) != ValType::from(v1) {
            return None;
        }
        if v2.try_as_i32()? != 0 {
            v0 = v0;
        } else {
            v0 = v1;
        }
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_21(&mut self, arg_0: Handle, arg_1: i32) -> Option<i32> {
        let mut local_0: Handle = arg_0;
        let mut local_1: i32 = arg_1;
        let mut local_2: Handle = Handle::NULL;
        let mut local_3: Handle = Handle::NULL;
        let mut local_4: i32 = 0i32;
        let mut local_5: Handle = Handle::NULL;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        let mut v3: TaggedVal;
        let mut v4: TaggedVal;
        v0 = self.globals[0];
        v1 = TaggedVal::from(-16i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        local_2 = v0.try_as_Handle()?;
        self.globals[0] = TaggedVal::from(v0.try_as_Handle()?);
        v0 = TaggedVal::from(local_2);
        v1 = TaggedVal::from(local_1);
        write_mem_u8(
            &mut self
                .segments
                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                .get_mut_data((v0.try_as_Handle()?.add(15)?.segment_offset()?))?,
            (v0.try_as_Handle()?.add(15)?.segment_offset()?) as usize,
            v1.try_as_i32()? as u8,
        )?;
        'label_0: loop {
            'label_1: loop {
                v0 = TaggedVal::from(local_0);
                v1 = TaggedVal::from(32i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_3 = v0.try_as_Handle()?;
                v0 = TaggedVal::from(read!(
                    get_handle,
                    self.segments,
                    v0.try_as_handle()?.add(0)?
                ));
                v1 = TaggedVal::from(Handle::NULL);
                v0 = TaggedVal::from(v0.try_as_handle()?.is_eq(v1.try_as_handle()?) as u32);
                v1 = TaggedVal::from(1i32);
                v0 = TaggedVal::from(v0.try_as_i32()? ^ v1.try_as_i32()?);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_1;
                }
                v0 = TaggedVal::from(-1i32);
                local_4 = v0.try_as_i32()?;
                v0 = TaggedVal::from(local_0);
                v0 = TaggedVal::from(self.func_18(v0.try_as_Handle()?)?);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_0;
                }
                break;
            }
            'label_2: loop {
                v0 = TaggedVal::from(local_0);
                v1 = TaggedVal::from(40i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v0 = TaggedVal::from(read!(
                    get_handle,
                    self.segments,
                    v0.try_as_handle()?.add(0)?
                ));
                local_5 = v0.try_as_Handle()?;
                v1 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(read!(
                    get_handle,
                    self.segments,
                    v1.try_as_handle()?.add(0)?
                ));
                v0 = TaggedVal::from(v0.try_as_handle()?.is_eq(v1.try_as_handle()?) as u32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_2;
                }
                v0 = TaggedVal::from(local_0);
                v1 = TaggedVal::from(120i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v0 = TaggedVal::from(read_mem_i32(
                    &self
                        .segments
                        .get(v0.try_as_Handle()?.segment_index()?)?
                        .get_data()?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                )?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(255i32);
                v1 = TaggedVal::from(v1.try_as_i32()? & v2.try_as_i32()?);
                local_4 = v1.try_as_i32()?;
                v0 = TaggedVal::from((v0.try_as_i32()? == v1.try_as_i32()?) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_2;
                }
                v0 = TaggedVal::from(local_0);
                v1 = TaggedVal::from(40i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_5);
                v2 = TaggedVal::from(1i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                write!(
                    store_handle,
                    self.segments,
                    v0.try_as_handle()?.add(0)?,
                    v1.try_as_handle()?
                );
                v0 = TaggedVal::from(local_5);
                v1 = TaggedVal::from(local_1);
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                {}
                break 'label_0;
                break;
            }
            v0 = TaggedVal::from(-1i32);
            local_4 = v0.try_as_i32()?;
            v0 = TaggedVal::from(local_0);
            v1 = TaggedVal::from(local_2);
            v2 = TaggedVal::from(15i32);
            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
            v2 = TaggedVal::from(1i32);
            v3 = TaggedVal::from(local_0);
            v4 = TaggedVal::from(64i32);
            v3 = TaggedVal::from(v3.try_as_handle()?.add(v4.try_as_i32()?)?);
            v3 = TaggedVal::from(read_mem_i32(
                &self
                    .segments
                    .get(v3.try_as_Handle()?.segment_index()?)?
                    .get_data()?,
                (v3.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            )?);
            {
                let rets = self.indirect_call(v3.try_as_i32()? as usize, &[v0, v1, v2])?;
                if rets.len() != 1 {
                    return None;
                }
                v0 = rets[0];
            }
            v1 = TaggedVal::from(1i32);
            v0 = TaggedVal::from((v0.try_as_i32()? != v1.try_as_i32()?) as i32);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_0;
            }
            v0 = TaggedVal::from(local_2);
            v0 = TaggedVal::from(
                read_mem_u8(
                    &self
                        .segments
                        .get(v0.try_as_Handle()?.segment_index()?)?
                        .get_data()?,
                    (v0.try_as_Handle()?.add(15)?.segment_offset()?) as usize,
                )
                .and_then(|x| Some(x as i32))?,
            );
            local_4 = v0.try_as_i32()?;
            break;
        }
        v0 = TaggedVal::from(local_2);
        v1 = TaggedVal::from(16i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        self.globals[0] = TaggedVal::from(v0.try_as_Handle()?);
        v0 = TaggedVal::from(local_4);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_22(&mut self, arg_0: Handle) -> Option<i32> {
        let mut local_0: Handle = arg_0;
        let mut local_1: Handle = Handle::NULL;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        'label_0: loop {
            v0 = TaggedVal::from(local_0);
            v1 = self.globals[1];
            v2 = TaggedVal::from(1040i32);
            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
            v0 = TaggedVal::from(self.func_20(v0.try_as_Handle()?, v1.try_as_Handle()?)?);
            v1 = TaggedVal::from(0i32);
            v0 = TaggedVal::from((v0.try_as_i32()? >= v1.try_as_i32()?) as i32);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_0;
            }
            v0 = TaggedVal::from(-1i32);
            return Some(v0.try_as_i32()?);
            break;
        }
        'label_1: loop {
            v0 = self.globals[1];
            v1 = TaggedVal::from(1040i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v1 = TaggedVal::from(120i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v0 = TaggedVal::from(read_mem_i32(
                &self
                    .segments
                    .get(v0.try_as_Handle()?.segment_index()?)?
                    .get_data()?,
                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            )?);
            v1 = TaggedVal::from(10i32);
            v0 = TaggedVal::from((v0.try_as_i32()? == v1.try_as_i32()?) as i32);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_1;
            }
            v0 = self.globals[1];
            v1 = TaggedVal::from(1040i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            local_1 = v0.try_as_Handle()?;
            v1 = TaggedVal::from(40i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v0 = TaggedVal::from(read!(
                get_handle,
                self.segments,
                v0.try_as_handle()?.add(0)?
            ));
            local_0 = v0.try_as_Handle()?;
            v1 = TaggedVal::from(local_1);
            v2 = TaggedVal::from(32i32);
            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
            v1 = TaggedVal::from(read!(
                get_handle,
                self.segments,
                v1.try_as_handle()?.add(0)?
            ));
            v0 = TaggedVal::from(v0.try_as_handle()?.is_eq(v1.try_as_handle()?) as u32);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_1;
            }
            v0 = self.globals[1];
            v1 = TaggedVal::from(1040i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v1 = TaggedVal::from(40i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v1 = TaggedVal::from(local_0);
            v2 = TaggedVal::from(1i32);
            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
            write!(
                store_handle,
                self.segments,
                v0.try_as_handle()?.add(0)?,
                v1.try_as_handle()?
            );
            v0 = TaggedVal::from(local_0);
            v1 = TaggedVal::from(10i32);
            write_mem_u8(
                &mut self
                    .segments
                    .get_mut(v0.try_as_Handle()?.segment_index()?)?
                    .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                v1.try_as_i32()? as u8,
            )?;
            v0 = TaggedVal::from(0i32);
            return Some(v0.try_as_i32()?);
            break;
        }
        v0 = self.globals[1];
        v1 = TaggedVal::from(1040i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v1 = TaggedVal::from(10i32);
        v0 = TaggedVal::from(self.func_21(v0.try_as_Handle()?, v1.try_as_i32()?)?);
        v1 = TaggedVal::from(31i32);
        v0 = TaggedVal::from(v0.try_as_i32()? >> (v1.try_as_i32()? % 32));
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_23(&mut self, arg_0: i32) -> Option<i32> {
        let mut local_0: i32 = arg_0;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        'label_0: loop {
            v0 = TaggedVal::from(local_0);
            v0 = TaggedVal::from(self.func_10(v0.try_as_i32()?)?);
            local_0 = v0.try_as_i32()?;
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_0;
            }
            v0 = TaggedVal::from(0i32);
            return Some(v0.try_as_i32()?);
            break;
        }
        v0 = self.globals[1];
        v1 = TaggedVal::from(1232i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v1 = TaggedVal::from(local_0);
        write_mem_i32(
            &mut self
                .segments
                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            v1.try_as_i32()?,
        )?;
        v0 = TaggedVal::from(-1i32);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_24(&mut self, arg_0: Handle) -> Option<i32> {
        let mut local_0: Handle = arg_0;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(112i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v0 = TaggedVal::from(read_mem_i32(
            &self
                .segments
                .get(v0.try_as_Handle()?.segment_index()?)?
                .get_data()?,
            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
        )?);
        v0 = TaggedVal::from(self.func_23(v0.try_as_i32()?)?);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_25(&mut self, arg_0: i32, arg_1: Handle, arg_2: i32) -> Option<i32> {
        let mut local_0: i32 = arg_0;
        let mut local_1: Handle = arg_1;
        let mut local_2: i32 = arg_2;
        let mut local_3: Handle = Handle::NULL;
        let mut local_4: i32 = 0i32;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        let mut v3: TaggedVal;
        let mut v4: TaggedVal;
        v0 = self.globals[0];
        v1 = TaggedVal::from(-16i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        local_3 = v0.try_as_Handle()?;
        self.globals[0] = TaggedVal::from(v0.try_as_Handle()?);
        v0 = TaggedVal::from(-1i32);
        local_4 = v0.try_as_i32()?;
        'label_0: loop {
            'label_1: loop {
                v0 = TaggedVal::from(local_2);
                v1 = TaggedVal::from(-1i32);
                v0 = TaggedVal::from((v0.try_as_i32()? > v1.try_as_i32()?) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_1;
                }
                v0 = self.globals[1];
                v1 = TaggedVal::from(1232i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(28i32);
                write_mem_i32(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()?,
                )?;
                {}
                break 'label_0;
                break;
            }
            'label_2: loop {
                v0 = TaggedVal::from(local_0);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(local_2);
                v3 = TaggedVal::from(local_3);
                v4 = TaggedVal::from(12i32);
                v3 = TaggedVal::from(v3.try_as_handle()?.add(v4.try_as_i32()?)?);
                v0 = TaggedVal::from(self.func_13(
                    v0.try_as_i32()?,
                    v1.try_as_Handle()?,
                    v2.try_as_i32()?,
                    v3.try_as_Handle()?,
                )?);
                local_2 = v0.try_as_i32()?;
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_2;
                }
                v0 = self.globals[1];
                v1 = TaggedVal::from(1232i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_2);
                write_mem_i32(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()?,
                )?;
                v0 = TaggedVal::from(-1i32);
                local_4 = v0.try_as_i32()?;
                {}
                break 'label_0;
                break;
            }
            v0 = TaggedVal::from(local_3);
            v0 = TaggedVal::from(read_mem_i32(
                &self
                    .segments
                    .get(v0.try_as_Handle()?.segment_index()?)?
                    .get_data()?,
                (v0.try_as_Handle()?.add(12)?.segment_offset()?) as usize,
            )?);
            local_4 = v0.try_as_i32()?;
            break;
        }
        v0 = TaggedVal::from(local_3);
        v1 = TaggedVal::from(16i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        self.globals[0] = TaggedVal::from(v0.try_as_Handle()?);
        v0 = TaggedVal::from(local_4);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_26(&mut self, arg_0: Handle, arg_1: Handle, arg_2: i32) -> Option<i32> {
        let mut local_0: Handle = arg_0;
        let mut local_1: Handle = arg_1;
        let mut local_2: i32 = arg_2;
        let mut local_3: Handle = Handle::NULL;
        let mut local_4: Handle = Handle::NULL;
        let mut local_5: Handle = Handle::NULL;
        let mut local_6: i32 = 0i32;
        let mut local_7: i32 = 0i32;
        let mut local_8: i32 = 0i32;
        let mut local_9: Handle = Handle::NULL;
        let mut local_10: i32 = 0i32;
        let mut local_11: i32 = 0i32;
        let mut local_12: Handle = Handle::NULL;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        let mut v3: TaggedVal;
        let mut v4: TaggedVal;
        let mut v5: TaggedVal;
        v0 = self.globals[0];
        v1 = TaggedVal::from(-32i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        local_3 = v0.try_as_Handle()?;
        self.globals[0] = TaggedVal::from(v0.try_as_Handle()?);
        v0 = TaggedVal::from(local_3);
        v1 = TaggedVal::from(16i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v1 = TaggedVal::from(local_1);
        write!(
            store_handle,
            self.segments,
            v0.try_as_handle()?.add(0)?,
            v1.try_as_handle()?
        );
        v0 = TaggedVal::from(local_3);
        v1 = TaggedVal::from(24i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v1 = TaggedVal::from(local_2);
        write_mem_i32(
            &mut self
                .segments
                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            v1.try_as_i32()?,
        )?;
        v0 = TaggedVal::from(local_3);
        v1 = TaggedVal::from(8i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v1 = TaggedVal::from(local_0);
        v2 = TaggedVal::from(40i32);
        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
        local_4 = v1.try_as_Handle()?;
        v1 = TaggedVal::from(read!(
            get_handle,
            self.segments,
            v1.try_as_handle()?.add(0)?
        ));
        v1 = TaggedVal::from(v1.try_as_handle()?.segment_offset()? as u32);
        v2 = TaggedVal::from(local_0);
        v3 = TaggedVal::from(48i32);
        v2 = TaggedVal::from(v2.try_as_handle()?.add(v3.try_as_i32()?)?);
        local_5 = v2.try_as_Handle()?;
        v2 = TaggedVal::from(read!(
            get_handle,
            self.segments,
            v2.try_as_handle()?.add(0)?
        ));
        local_1 = v2.try_as_Handle()?;
        v2 = TaggedVal::from(v2.try_as_handle()?.segment_offset()? as u32);
        v1 = TaggedVal::from(v1.try_as_i32()?.wrapping_sub(v2.try_as_i32()?));
        local_6 = v1.try_as_i32()?;
        write_mem_i32(
            &mut self
                .segments
                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            v1.try_as_i32()?,
        )?;
        v0 = TaggedVal::from(local_3);
        v1 = TaggedVal::from(local_1);
        write!(
            store_handle,
            self.segments,
            v0.try_as_handle()?.add(0)?,
            v1.try_as_handle()?
        );
        v0 = TaggedVal::from(2i32);
        local_7 = v0.try_as_i32()?;
        'label_0: loop {
            'label_1: loop {
                v0 = TaggedVal::from(local_6);
                v1 = TaggedVal::from(local_2);
                v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                local_8 = v0.try_as_i32()?;
                v1 = TaggedVal::from(local_0);
                v2 = TaggedVal::from(112i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                local_9 = v1.try_as_Handle()?;
                v1 = TaggedVal::from(read_mem_i32(
                    &self
                        .segments
                        .get(v1.try_as_Handle()?.segment_index()?)?
                        .get_data()?,
                    (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                )?);
                v2 = TaggedVal::from(local_3);
                v3 = TaggedVal::from(2i32);
                v1 = TaggedVal::from(self.func_25(
                    v1.try_as_i32()?,
                    v2.try_as_Handle()?,
                    v3.try_as_i32()?,
                )?);
                local_6 = v1.try_as_i32()?;
                v0 = TaggedVal::from((v0.try_as_i32()? == v1.try_as_i32()?) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_1;
                }
                v0 = TaggedVal::from(local_3);
                local_1 = v0.try_as_Handle()?;
                'label_2: loop {
                    'label_3: loop {
                        v0 = TaggedVal::from(local_6);
                        v1 = TaggedVal::from(-1i32);
                        v0 = TaggedVal::from((v0.try_as_i32()? > v1.try_as_i32()?) as i32);
                        if v0.try_as_i32()? != 0 {
                            {}
                            break 'label_3;
                        }
                        v0 = TaggedVal::from(local_0);
                        v1 = TaggedVal::from(48i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        v1 = TaggedVal::from(0i64);
                        write_mem_i64(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i64()?,
                        )?;
                        v0 = TaggedVal::from(local_0);
                        v1 = TaggedVal::from(40i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        v1 = TaggedVal::from(0i64);
                        write_mem_i64(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i64()?,
                        )?;
                        v0 = TaggedVal::from(local_0);
                        v1 = TaggedVal::from(32i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        v1 = TaggedVal::from(0i64);
                        write_mem_i64(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i64()?,
                        )?;
                        v0 = TaggedVal::from(local_0);
                        v1 = TaggedVal::from(local_0);
                        v1 = TaggedVal::from(read_mem_i32(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )?);
                        v2 = TaggedVal::from(32i32);
                        v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                        write_mem_i32(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()?,
                        )?;
                        v0 = TaggedVal::from(0i32);
                        local_6 = v0.try_as_i32()?;
                        v0 = TaggedVal::from(local_7);
                        v1 = TaggedVal::from(2i32);
                        v0 = TaggedVal::from((v0.try_as_i32()? == v1.try_as_i32()?) as i32);
                        if v0.try_as_i32()? != 0 {
                            {}
                            break 'label_0;
                        }
                        v0 = TaggedVal::from(local_2);
                        v1 = TaggedVal::from(local_1);
                        v2 = TaggedVal::from(8i32);
                        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                        v1 = TaggedVal::from(read_mem_i32(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )?);
                        v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_sub(v1.try_as_i32()?));
                        local_6 = v0.try_as_i32()?;
                        {}
                        break 'label_0;
                        break;
                    }
                    v0 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(local_6);
                    v2 = TaggedVal::from(local_1);
                    v3 = TaggedVal::from(8i32);
                    v2 = TaggedVal::from(v2.try_as_handle()?.add(v3.try_as_i32()?)?);
                    v2 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v2.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v2.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    local_10 = v2.try_as_i32()?;
                    v1 = TaggedVal::from(
                        ((v1.try_as_i32()? as u32) > (v2.try_as_i32()? as u32)) as i32,
                    );
                    local_11 = v1.try_as_i32()?;
                    v2 = TaggedVal::from(4i32);
                    v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_12 = v0.try_as_Handle()?;
                    v1 = TaggedVal::from(local_12);
                    v1 = TaggedVal::from(read!(
                        get_handle,
                        self.segments,
                        v1.try_as_handle()?.add(0)?
                    ));
                    v2 = TaggedVal::from(local_6);
                    v3 = TaggedVal::from(local_10);
                    v4 = TaggedVal::from(0i32);
                    v5 = TaggedVal::from(local_11);
                    if ValType::from(v3) != ValType::from(v4) {
                        return None;
                    }
                    if v5.try_as_i32()? != 0 {
                        v3 = v3;
                    } else {
                        v3 = v4;
                    }
                    v2 = TaggedVal::from(v2.try_as_i32()?.wrapping_sub(v3.try_as_i32()?));
                    local_10 = v2.try_as_i32()?;
                    v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                    write!(
                        store_handle,
                        self.segments,
                        v0.try_as_handle()?.add(0)?,
                        v1.try_as_handle()?
                    );
                    v0 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(24i32);
                    v2 = TaggedVal::from(8i32);
                    v3 = TaggedVal::from(local_11);
                    if ValType::from(v1) != ValType::from(v2) {
                        return None;
                    }
                    if v3.try_as_i32()? != 0 {
                        v1 = v1;
                    } else {
                        v1 = v2;
                    }
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_12 = v0.try_as_Handle()?;
                    v1 = TaggedVal::from(local_12);
                    v1 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    v2 = TaggedVal::from(local_10);
                    v1 = TaggedVal::from(v1.try_as_i32()?.wrapping_sub(v2.try_as_i32()?));
                    write_mem_i32(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()?,
                    )?;
                    v0 = TaggedVal::from(local_8);
                    v1 = TaggedVal::from(local_6);
                    v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_sub(v1.try_as_i32()?));
                    local_8 = v0.try_as_i32()?;
                    v1 = TaggedVal::from(local_9);
                    v1 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    v2 = TaggedVal::from(local_1);
                    v3 = TaggedVal::from(16i32);
                    v2 = TaggedVal::from(v2.try_as_handle()?.add(v3.try_as_i32()?)?);
                    v3 = TaggedVal::from(local_1);
                    v4 = TaggedVal::from(local_11);
                    if ValType::from(v2) != ValType::from(v3) {
                        return None;
                    }
                    if v4.try_as_i32()? != 0 {
                        v2 = v2;
                    } else {
                        v2 = v3;
                    }
                    local_1 = v2.try_as_Handle()?;
                    v3 = TaggedVal::from(local_7);
                    v4 = TaggedVal::from(local_11);
                    v3 = TaggedVal::from(v3.try_as_i32()?.wrapping_sub(v4.try_as_i32()?));
                    local_7 = v3.try_as_i32()?;
                    v1 = TaggedVal::from(self.func_25(
                        v1.try_as_i32()?,
                        v2.try_as_Handle()?,
                        v3.try_as_i32()?,
                    )?);
                    local_6 = v1.try_as_i32()?;
                    v0 = TaggedVal::from((v0.try_as_i32()? != v1.try_as_i32()?) as i32);
                    if v0.try_as_i32()? != 0 {
                        {}
                        continue 'label_2;
                    }
                    break;
                }
                break;
            }
            v0 = TaggedVal::from(local_5);
            v1 = TaggedVal::from(local_0);
            v2 = TaggedVal::from(80i32);
            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
            v1 = TaggedVal::from(read!(
                get_handle,
                self.segments,
                v1.try_as_handle()?.add(0)?
            ));
            local_1 = v1.try_as_Handle()?;
            write!(
                store_handle,
                self.segments,
                v0.try_as_handle()?.add(0)?,
                v1.try_as_handle()?
            );
            v0 = TaggedVal::from(local_4);
            v1 = TaggedVal::from(local_1);
            write!(
                store_handle,
                self.segments,
                v0.try_as_handle()?.add(0)?,
                v1.try_as_handle()?
            );
            v0 = TaggedVal::from(local_0);
            v1 = TaggedVal::from(32i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v1 = TaggedVal::from(local_1);
            v2 = TaggedVal::from(local_0);
            v3 = TaggedVal::from(88i32);
            v2 = TaggedVal::from(v2.try_as_handle()?.add(v3.try_as_i32()?)?);
            v2 = TaggedVal::from(read_mem_i32(
                &self
                    .segments
                    .get(v2.try_as_Handle()?.segment_index()?)?
                    .get_data()?,
                (v2.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            )?);
            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
            write!(
                store_handle,
                self.segments,
                v0.try_as_handle()?.add(0)?,
                v1.try_as_handle()?
            );
            v0 = TaggedVal::from(local_2);
            local_6 = v0.try_as_i32()?;
            break;
        }
        v0 = TaggedVal::from(local_3);
        v1 = TaggedVal::from(32i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        self.globals[0] = TaggedVal::from(v0.try_as_Handle()?);
        v0 = TaggedVal::from(local_6);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_27(&mut self, arg_0: i32) -> Option<i32> {
        let mut local_0: i32 = arg_0;
        let mut local_1: Handle = Handle::NULL;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        v0 = self.globals[0];
        v1 = TaggedVal::from(-32i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        local_1 = v0.try_as_Handle()?;
        self.globals[0] = TaggedVal::from(v0.try_as_Handle()?);
        'label_0: loop {
            'label_1: loop {
                v0 = TaggedVal::from(local_0);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(8i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v0 = TaggedVal::from(self.func_11(v0.try_as_i32()?, v1.try_as_Handle()?)?);
                local_0 = v0.try_as_i32()?;
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_1;
                }
                v0 = TaggedVal::from(59i32);
                local_0 = v0.try_as_i32()?;
                v0 = TaggedVal::from(local_1);
                v0 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v0.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v0.try_as_Handle()?.add(8)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                v1 = TaggedVal::from(2i32);
                v0 = TaggedVal::from((v0.try_as_i32()? != v1.try_as_i32()?) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_1;
                }
                v0 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(16i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v0 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v0.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                v1 = TaggedVal::from(36i32);
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_1;
                }
                v0 = TaggedVal::from(1i32);
                local_0 = v0.try_as_i32()?;
                {}
                break 'label_0;
                break;
            }
            v0 = self.globals[1];
            v1 = TaggedVal::from(1232i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v1 = TaggedVal::from(local_0);
            write_mem_i32(
                &mut self
                    .segments
                    .get_mut(v0.try_as_Handle()?.segment_index()?)?
                    .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                v1.try_as_i32()?,
            )?;
            v0 = TaggedVal::from(0i32);
            local_0 = v0.try_as_i32()?;
            break;
        }
        v0 = TaggedVal::from(local_1);
        v1 = TaggedVal::from(32i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        self.globals[0] = TaggedVal::from(v0.try_as_Handle()?);
        v0 = TaggedVal::from(local_0);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_28(&mut self, arg_0: Handle, arg_1: Handle, arg_2: i32) -> Option<i32> {
        let mut local_0: Handle = arg_0;
        let mut local_1: Handle = arg_1;
        let mut local_2: i32 = arg_2;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(64i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v1 = TaggedVal::from(1i32);
        write_mem_i32(
            &mut self
                .segments
                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            v1.try_as_i32()?,
        )?;
        'label_0: loop {
            v0 = TaggedVal::from(local_0);
            v0 = TaggedVal::from(
                read_mem_u8(
                    &self
                        .segments
                        .get(v0.try_as_Handle()?.segment_index()?)?
                        .get_data()?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                )
                .and_then(|x| Some(x as i32))?,
            );
            v1 = TaggedVal::from(64i32);
            v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_0;
            }
            v0 = TaggedVal::from(local_0);
            v1 = TaggedVal::from(112i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v0 = TaggedVal::from(read_mem_i32(
                &self
                    .segments
                    .get(v0.try_as_Handle()?.segment_index()?)?
                    .get_data()?,
                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
            )?);
            v0 = TaggedVal::from(self.func_27(v0.try_as_i32()?)?);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_0;
            }
            v0 = TaggedVal::from(local_0);
            v1 = TaggedVal::from(120i32);
            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
            v1 = TaggedVal::from(-1i32);
            write_mem_i32(
                &mut self
                    .segments
                    .get_mut(v0.try_as_Handle()?.segment_index()?)?
                    .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                v1.try_as_i32()?,
            )?;
            break;
        }
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(local_1);
        v2 = TaggedVal::from(local_2);
        v0 = TaggedVal::from(self.func_26(
            v0.try_as_Handle()?,
            v1.try_as_Handle()?,
            v2.try_as_i32()?,
        )?);
        Some(v0.try_as_i32()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_29(&mut self, arg_0: i32, arg_1: i64, arg_2: i32) -> Option<i64> {
        let mut local_0: i32 = arg_0;
        let mut local_1: i64 = arg_1;
        let mut local_2: i32 = arg_2;
        let mut local_3: Handle = Handle::NULL;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        let mut v3: TaggedVal;
        let mut v4: TaggedVal;
        v0 = self.globals[0];
        v1 = TaggedVal::from(-16i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        local_3 = v0.try_as_Handle()?;
        self.globals[0] = TaggedVal::from(v0.try_as_Handle()?);
        'label_0: loop {
            'label_1: loop {
                v0 = TaggedVal::from(local_0);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(local_2);
                v3 = TaggedVal::from(255i32);
                v2 = TaggedVal::from(v2.try_as_i32()? & v3.try_as_i32()?);
                v3 = TaggedVal::from(local_3);
                v4 = TaggedVal::from(8i32);
                v3 = TaggedVal::from(v3.try_as_handle()?.add(v4.try_as_i32()?)?);
                v0 = TaggedVal::from(self.func_12(
                    v0.try_as_i32()?,
                    v1.try_as_i64()?,
                    v2.try_as_i32()?,
                    v3.try_as_Handle()?,
                )?);
                local_0 = v0.try_as_i32()?;
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_1;
                }
                v0 = self.globals[1];
                v1 = TaggedVal::from(1232i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(70i32);
                v2 = TaggedVal::from(local_0);
                v3 = TaggedVal::from(local_0);
                v4 = TaggedVal::from(76i32);
                v3 = TaggedVal::from((v3.try_as_i32()? == v4.try_as_i32()?) as i32);
                if ValType::from(v1) != ValType::from(v2) {
                    return None;
                }
                if v3.try_as_i32()? != 0 {
                    v1 = v1;
                } else {
                    v1 = v2;
                }
                write_mem_i32(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()?,
                )?;
                v0 = TaggedVal::from(-1i64);
                local_1 = v0.try_as_i64()?;
                {}
                break 'label_0;
                break;
            }
            v0 = TaggedVal::from(local_3);
            v0 = TaggedVal::from(read_mem_i64(
                &self
                    .segments
                    .get(v0.try_as_Handle()?.segment_index()?)?
                    .get_data()?,
                (v0.try_as_Handle()?.add(8)?.segment_offset()?) as usize,
            )?);
            local_1 = v0.try_as_i64()?;
            break;
        }
        v0 = TaggedVal::from(local_3);
        v1 = TaggedVal::from(16i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        self.globals[0] = TaggedVal::from(v0.try_as_Handle()?);
        v0 = TaggedVal::from(local_1);
        Some(v0.try_as_i64()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_30(&mut self, arg_0: Handle, arg_1: i64, arg_2: i32) -> Option<i64> {
        let mut local_0: Handle = arg_0;
        let mut local_1: i64 = arg_1;
        let mut local_2: i32 = arg_2;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        v0 = TaggedVal::from(local_0);
        v1 = TaggedVal::from(112i32);
        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
        v0 = TaggedVal::from(read_mem_i32(
            &self
                .segments
                .get(v0.try_as_Handle()?.segment_index()?)?
                .get_data()?,
            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
        )?);
        v1 = TaggedVal::from(local_1);
        v2 = TaggedVal::from(local_2);
        v0 = TaggedVal::from(self.func_29(v0.try_as_i32()?, v1.try_as_i64()?, v2.try_as_i32()?)?);
        Some(v0.try_as_i64()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_31(&mut self, arg_0: Handle, arg_1: Handle, arg_2: i32) -> Option<Handle> {
        let mut local_0: Handle = arg_0;
        let mut local_1: Handle = arg_1;
        let mut local_2: i32 = arg_2;
        let mut local_3: Handle = Handle::NULL;
        let mut local_4: i32 = 0i32;
        let mut local_5: i32 = 0i32;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        let mut v3: TaggedVal;
        'label_0: loop {
            'label_1: loop {
                v0 = TaggedVal::from(local_2);
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_1;
                }
                v0 = TaggedVal::from(local_1);
                v0 = TaggedVal::from(v0.try_as_handle()?.segment_offset()? as u32);
                v1 = TaggedVal::from(3i32);
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_1;
                }
                v0 = TaggedVal::from(local_0);
                local_3 = v0.try_as_Handle()?;
                'label_2: loop {
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(
                        read_mem_u8(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )
                        .and_then(|x| Some(x as i32))?,
                    );
                    write_mem_u8(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()? as u8,
                    )?;
                    v0 = TaggedVal::from(local_2);
                    v1 = TaggedVal::from(-1i32);
                    v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                    local_4 = v0.try_as_i32()?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(1i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_3 = v0.try_as_Handle()?;
                    v0 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(1i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_1 = v0.try_as_Handle()?;
                    v0 = TaggedVal::from(local_2);
                    v1 = TaggedVal::from(1i32);
                    v0 = TaggedVal::from((v0.try_as_i32()? == v1.try_as_i32()?) as i32);
                    if v0.try_as_i32()? != 0 {
                        {}
                        break 'label_0;
                    }
                    v0 = TaggedVal::from(local_4);
                    local_2 = v0.try_as_i32()?;
                    v0 = TaggedVal::from(local_1);
                    v0 = TaggedVal::from(v0.try_as_handle()?.segment_offset()? as u32);
                    v1 = TaggedVal::from(3i32);
                    v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                    if v0.try_as_i32()? != 0 {
                        {}
                        continue 'label_2;
                    }
                    {}
                    break 'label_0;
                    break;
                }
                break;
            }
            v0 = TaggedVal::from(local_2);
            local_4 = v0.try_as_i32()?;
            v0 = TaggedVal::from(local_0);
            local_3 = v0.try_as_Handle()?;
            break;
        }
        'label_3: loop {
            'label_4: loop {
                v0 = TaggedVal::from(local_3);
                v0 = TaggedVal::from(v0.try_as_handle()?.segment_offset()? as u32);
                v1 = TaggedVal::from(3i32);
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                local_2 = v0.try_as_i32()?;
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_4;
                }
                'label_5: loop {
                    v0 = TaggedVal::from(local_4);
                    v1 = TaggedVal::from(16i32);
                    v0 = TaggedVal::from(
                        ((v0.try_as_i32()? as u32) < (v1.try_as_i32()? as u32)) as i32,
                    );
                    if v0.try_as_i32()? != 0 {
                        {}
                        break 'label_5;
                    }
                    'label_6: loop {
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(local_1);
                        v1 = TaggedVal::from(read_mem_i32(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )?);
                        write_mem_i32(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()?,
                        )?;
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(4i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        v1 = TaggedVal::from(local_1);
                        v2 = TaggedVal::from(4i32);
                        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                        v1 = TaggedVal::from(read_mem_i32(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )?);
                        write_mem_i32(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()?,
                        )?;
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(8i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        v1 = TaggedVal::from(local_1);
                        v2 = TaggedVal::from(8i32);
                        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                        v1 = TaggedVal::from(read_mem_i32(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )?);
                        write_mem_i32(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()?,
                        )?;
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(12i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        v1 = TaggedVal::from(local_1);
                        v2 = TaggedVal::from(12i32);
                        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                        v1 = TaggedVal::from(read_mem_i32(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )?);
                        write_mem_i32(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()?,
                        )?;
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(16i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        local_3 = v0.try_as_Handle()?;
                        v0 = TaggedVal::from(local_1);
                        v1 = TaggedVal::from(16i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        local_1 = v0.try_as_Handle()?;
                        v0 = TaggedVal::from(local_4);
                        v1 = TaggedVal::from(-16i32);
                        v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                        local_4 = v0.try_as_i32()?;
                        v1 = TaggedVal::from(15i32);
                        v0 = TaggedVal::from(
                            ((v0.try_as_i32()? as u32) > (v1.try_as_i32()? as u32)) as i32,
                        );
                        if v0.try_as_i32()? != 0 {
                            {}
                            continue 'label_6;
                        }
                        break;
                    }
                    break;
                }
                'label_7: loop {
                    v0 = TaggedVal::from(local_4);
                    v1 = TaggedVal::from(8i32);
                    v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                    v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                    if v0.try_as_i32()? != 0 {
                        {}
                        break 'label_7;
                    }
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    write_mem_i32(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()?,
                    )?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(4i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    v1 = TaggedVal::from(local_1);
                    v2 = TaggedVal::from(4i32);
                    v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                    v1 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    write_mem_i32(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()?,
                    )?;
                    v0 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(8i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_1 = v0.try_as_Handle()?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(8i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_3 = v0.try_as_Handle()?;
                    break;
                }
                'label_8: loop {
                    v0 = TaggedVal::from(local_4);
                    v1 = TaggedVal::from(4i32);
                    v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                    v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                    if v0.try_as_i32()? != 0 {
                        {}
                        break 'label_8;
                    }
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    write_mem_i32(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()?,
                    )?;
                    v0 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(4i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_1 = v0.try_as_Handle()?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(4i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_3 = v0.try_as_Handle()?;
                    break;
                }
                'label_9: loop {
                    v0 = TaggedVal::from(local_4);
                    v1 = TaggedVal::from(2i32);
                    v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                    v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                    if v0.try_as_i32()? != 0 {
                        {}
                        break 'label_9;
                    }
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(
                        read_mem_u8(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )
                        .and_then(|x| Some(x as i32))?,
                    );
                    write_mem_u8(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()? as u8,
                    )?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(1i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    v1 = TaggedVal::from(local_1);
                    v2 = TaggedVal::from(1i32);
                    v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                    v1 = TaggedVal::from(
                        read_mem_u8(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )
                        .and_then(|x| Some(x as i32))?,
                    );
                    write_mem_u8(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()? as u8,
                    )?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(2i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_3 = v0.try_as_Handle()?;
                    v0 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(2i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_1 = v0.try_as_Handle()?;
                    break;
                }
                v0 = TaggedVal::from(local_4);
                v1 = TaggedVal::from(1i32);
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_3;
                }
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_0);
                return Some(v0.try_as_Handle()?);
                break;
            }
            'label_10: loop {
                v0 = TaggedVal::from(local_4);
                v1 = TaggedVal::from(32i32);
                v0 =
                    TaggedVal::from(((v0.try_as_i32()? as u32) < (v1.try_as_i32()? as u32)) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_10;
                }
                'label_11: loop {
                    'label_12: loop {
                        'label_13: loop {
                            v0 = TaggedVal::from(local_2);
                            v1 = TaggedVal::from(-1i32);
                            v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                            match v0.try_as_i32()? {
                                0 => {
                                    {}
                                    break 'label_13;
                                }
                                1 => {
                                    {}
                                    break 'label_12;
                                }
                                2 => {
                                    {}
                                    break 'label_11;
                                }
                                _ => {
                                    {}
                                    break 'label_10;
                                }
                            }
                            break;
                        }
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(1i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        v1 = TaggedVal::from(local_1);
                        v2 = TaggedVal::from(1i32);
                        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                        v1 = TaggedVal::from(
                            read_mem_u8(
                                &self
                                    .segments
                                    .get(v1.try_as_Handle()?.segment_index()?)?
                                    .get_data()?,
                                (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            )
                            .and_then(|x| Some(x as i32))?,
                        );
                        write_mem_u8(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()? as u8,
                        )?;
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(local_1);
                        v1 = TaggedVal::from(read_mem_i32(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )?);
                        local_2 = v1.try_as_i32()?;
                        write_mem_u8(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()? as u8,
                        )?;
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(2i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        v1 = TaggedVal::from(local_1);
                        v2 = TaggedVal::from(2i32);
                        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                        v1 = TaggedVal::from(
                            read_mem_u8(
                                &self
                                    .segments
                                    .get(v1.try_as_Handle()?.segment_index()?)?
                                    .get_data()?,
                                (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            )
                            .and_then(|x| Some(x as i32))?,
                        );
                        write_mem_u8(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()? as u8,
                        )?;
                        v0 = TaggedVal::from(local_4);
                        v1 = TaggedVal::from(-3i32);
                        v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                        local_4 = v0.try_as_i32()?;
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(3i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        local_3 = v0.try_as_Handle()?;
                        v0 = TaggedVal::from(local_1);
                        v1 = TaggedVal::from(3i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        local_1 = v0.try_as_Handle()?;
                        'label_14: loop {
                            v0 = TaggedVal::from(local_3);
                            v1 = TaggedVal::from(local_1);
                            v2 = TaggedVal::from(1i32);
                            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                            v1 = TaggedVal::from(read_mem_i32(
                                &self
                                    .segments
                                    .get(v1.try_as_Handle()?.segment_index()?)?
                                    .get_data()?,
                                (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            )?);
                            local_5 = v1.try_as_i32()?;
                            v2 = TaggedVal::from(8i32);
                            v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                            v2 = TaggedVal::from(local_2);
                            v3 = TaggedVal::from(24i32);
                            v2 = TaggedVal::from(
                                (v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32),
                            );
                            v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                            write_mem_i32(
                                &mut self
                                    .segments
                                    .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                    .get_mut_data(
                                        (v0.try_as_Handle()?.add(0)?.segment_offset()?),
                                    )?,
                                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                                v1.try_as_i32()?,
                            )?;
                            v0 = TaggedVal::from(local_3);
                            v1 = TaggedVal::from(4i32);
                            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                            v1 = TaggedVal::from(local_1);
                            v2 = TaggedVal::from(5i32);
                            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                            v1 = TaggedVal::from(read_mem_i32(
                                &self
                                    .segments
                                    .get(v1.try_as_Handle()?.segment_index()?)?
                                    .get_data()?,
                                (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            )?);
                            local_2 = v1.try_as_i32()?;
                            v2 = TaggedVal::from(8i32);
                            v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                            v2 = TaggedVal::from(local_5);
                            v3 = TaggedVal::from(24i32);
                            v2 = TaggedVal::from(
                                (v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32),
                            );
                            v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                            write_mem_i32(
                                &mut self
                                    .segments
                                    .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                    .get_mut_data(
                                        (v0.try_as_Handle()?.add(0)?.segment_offset()?),
                                    )?,
                                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                                v1.try_as_i32()?,
                            )?;
                            v0 = TaggedVal::from(local_3);
                            v1 = TaggedVal::from(8i32);
                            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                            v1 = TaggedVal::from(local_1);
                            v2 = TaggedVal::from(9i32);
                            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                            v1 = TaggedVal::from(read_mem_i32(
                                &self
                                    .segments
                                    .get(v1.try_as_Handle()?.segment_index()?)?
                                    .get_data()?,
                                (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            )?);
                            local_5 = v1.try_as_i32()?;
                            v2 = TaggedVal::from(8i32);
                            v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                            v2 = TaggedVal::from(local_2);
                            v3 = TaggedVal::from(24i32);
                            v2 = TaggedVal::from(
                                (v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32),
                            );
                            v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                            write_mem_i32(
                                &mut self
                                    .segments
                                    .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                    .get_mut_data(
                                        (v0.try_as_Handle()?.add(0)?.segment_offset()?),
                                    )?,
                                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                                v1.try_as_i32()?,
                            )?;
                            v0 = TaggedVal::from(local_3);
                            v1 = TaggedVal::from(12i32);
                            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                            v1 = TaggedVal::from(local_1);
                            v2 = TaggedVal::from(13i32);
                            v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                            v1 = TaggedVal::from(read_mem_i32(
                                &self
                                    .segments
                                    .get(v1.try_as_Handle()?.segment_index()?)?
                                    .get_data()?,
                                (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            )?);
                            local_2 = v1.try_as_i32()?;
                            v2 = TaggedVal::from(8i32);
                            v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                            v2 = TaggedVal::from(local_5);
                            v3 = TaggedVal::from(24i32);
                            v2 = TaggedVal::from(
                                (v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32),
                            );
                            v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                            write_mem_i32(
                                &mut self
                                    .segments
                                    .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                    .get_mut_data(
                                        (v0.try_as_Handle()?.add(0)?.segment_offset()?),
                                    )?,
                                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                                v1.try_as_i32()?,
                            )?;
                            v0 = TaggedVal::from(local_3);
                            v1 = TaggedVal::from(16i32);
                            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                            local_3 = v0.try_as_Handle()?;
                            v0 = TaggedVal::from(local_1);
                            v1 = TaggedVal::from(16i32);
                            v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                            local_1 = v0.try_as_Handle()?;
                            v0 = TaggedVal::from(local_4);
                            v1 = TaggedVal::from(-16i32);
                            v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                            local_4 = v0.try_as_i32()?;
                            v1 = TaggedVal::from(16i32);
                            v0 = TaggedVal::from(
                                ((v0.try_as_i32()? as u32) > (v1.try_as_i32()? as u32)) as i32,
                            );
                            if v0.try_as_i32()? != 0 {
                                {}
                                continue 'label_14;
                            }
                            {}
                            break 'label_10;
                            break;
                        }
                        break;
                    }
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    local_2 = v1.try_as_i32()?;
                    write_mem_u8(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()? as u8,
                    )?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(1i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    v1 = TaggedVal::from(local_1);
                    v2 = TaggedVal::from(1i32);
                    v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                    v1 = TaggedVal::from(
                        read_mem_u8(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )
                        .and_then(|x| Some(x as i32))?,
                    );
                    write_mem_u8(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()? as u8,
                    )?;
                    v0 = TaggedVal::from(local_4);
                    v1 = TaggedVal::from(-2i32);
                    v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                    local_4 = v0.try_as_i32()?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(2i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_3 = v0.try_as_Handle()?;
                    v0 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(2i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_1 = v0.try_as_Handle()?;
                    'label_15: loop {
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(local_1);
                        v2 = TaggedVal::from(2i32);
                        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                        v1 = TaggedVal::from(read_mem_i32(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )?);
                        local_5 = v1.try_as_i32()?;
                        v2 = TaggedVal::from(16i32);
                        v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                        v2 = TaggedVal::from(local_2);
                        v3 = TaggedVal::from(16i32);
                        v2 = TaggedVal::from((v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32));
                        v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                        write_mem_i32(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()?,
                        )?;
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(4i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        v1 = TaggedVal::from(local_1);
                        v2 = TaggedVal::from(6i32);
                        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                        v1 = TaggedVal::from(read_mem_i32(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )?);
                        local_2 = v1.try_as_i32()?;
                        v2 = TaggedVal::from(16i32);
                        v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                        v2 = TaggedVal::from(local_5);
                        v3 = TaggedVal::from(16i32);
                        v2 = TaggedVal::from((v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32));
                        v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                        write_mem_i32(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()?,
                        )?;
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(8i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        v1 = TaggedVal::from(local_1);
                        v2 = TaggedVal::from(10i32);
                        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                        v1 = TaggedVal::from(read_mem_i32(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )?);
                        local_5 = v1.try_as_i32()?;
                        v2 = TaggedVal::from(16i32);
                        v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                        v2 = TaggedVal::from(local_2);
                        v3 = TaggedVal::from(16i32);
                        v2 = TaggedVal::from((v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32));
                        v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                        write_mem_i32(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()?,
                        )?;
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(12i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        v1 = TaggedVal::from(local_1);
                        v2 = TaggedVal::from(14i32);
                        v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                        v1 = TaggedVal::from(read_mem_i32(
                            &self
                                .segments
                                .get(v1.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )?);
                        local_2 = v1.try_as_i32()?;
                        v2 = TaggedVal::from(16i32);
                        v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                        v2 = TaggedVal::from(local_5);
                        v3 = TaggedVal::from(16i32);
                        v2 = TaggedVal::from((v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32));
                        v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                        write_mem_i32(
                            &mut self
                                .segments
                                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                                .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                            v1.try_as_i32()?,
                        )?;
                        v0 = TaggedVal::from(local_3);
                        v1 = TaggedVal::from(16i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        local_3 = v0.try_as_Handle()?;
                        v0 = TaggedVal::from(local_1);
                        v1 = TaggedVal::from(16i32);
                        v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                        local_1 = v0.try_as_Handle()?;
                        v0 = TaggedVal::from(local_4);
                        v1 = TaggedVal::from(-16i32);
                        v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                        local_4 = v0.try_as_i32()?;
                        v1 = TaggedVal::from(17i32);
                        v0 = TaggedVal::from(
                            ((v0.try_as_i32()? as u32) > (v1.try_as_i32()? as u32)) as i32,
                        );
                        if v0.try_as_i32()? != 0 {
                            {}
                            continue 'label_15;
                        }
                        {}
                        break 'label_10;
                        break;
                    }
                    break;
                }
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(read_mem_i32(
                    &self
                        .segments
                        .get(v1.try_as_Handle()?.segment_index()?)?
                        .get_data()?,
                    (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                )?);
                local_2 = v1.try_as_i32()?;
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_4);
                v1 = TaggedVal::from(-1i32);
                v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                local_4 = v0.try_as_i32()?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(1i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_3 = v0.try_as_Handle()?;
                v0 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(1i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_1 = v0.try_as_Handle()?;
                'label_16: loop {
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(local_1);
                    v2 = TaggedVal::from(3i32);
                    v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                    v1 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    local_5 = v1.try_as_i32()?;
                    v2 = TaggedVal::from(24i32);
                    v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                    v2 = TaggedVal::from(local_2);
                    v3 = TaggedVal::from(8i32);
                    v2 = TaggedVal::from((v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32));
                    v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                    write_mem_i32(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()?,
                    )?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(4i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    v1 = TaggedVal::from(local_1);
                    v2 = TaggedVal::from(7i32);
                    v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                    v1 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    local_2 = v1.try_as_i32()?;
                    v2 = TaggedVal::from(24i32);
                    v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                    v2 = TaggedVal::from(local_5);
                    v3 = TaggedVal::from(8i32);
                    v2 = TaggedVal::from((v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32));
                    v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                    write_mem_i32(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()?,
                    )?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(8i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    v1 = TaggedVal::from(local_1);
                    v2 = TaggedVal::from(11i32);
                    v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                    v1 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    local_5 = v1.try_as_i32()?;
                    v2 = TaggedVal::from(24i32);
                    v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                    v2 = TaggedVal::from(local_2);
                    v3 = TaggedVal::from(8i32);
                    v2 = TaggedVal::from((v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32));
                    v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                    write_mem_i32(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()?,
                    )?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(12i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    v1 = TaggedVal::from(local_1);
                    v2 = TaggedVal::from(15i32);
                    v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                    v1 = TaggedVal::from(read_mem_i32(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )?);
                    local_2 = v1.try_as_i32()?;
                    v2 = TaggedVal::from(24i32);
                    v1 = TaggedVal::from(v1.try_as_i32()? << (v2.try_as_i32()? % 32));
                    v2 = TaggedVal::from(local_5);
                    v3 = TaggedVal::from(8i32);
                    v2 = TaggedVal::from((v2.try_as_i32()? as u32) >> (v3.try_as_i32()? % 32));
                    v1 = TaggedVal::from(v1.try_as_i32()? | v2.try_as_i32()?);
                    write_mem_i32(
                        &mut self
                            .segments
                            .get_mut(v0.try_as_Handle()?.segment_index()?)?
                            .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        v1.try_as_i32()?,
                    )?;
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(16i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_3 = v0.try_as_Handle()?;
                    v0 = TaggedVal::from(local_1);
                    v1 = TaggedVal::from(16i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_1 = v0.try_as_Handle()?;
                    v0 = TaggedVal::from(local_4);
                    v1 = TaggedVal::from(-16i32);
                    v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_add(v1.try_as_i32()?));
                    local_4 = v0.try_as_i32()?;
                    v1 = TaggedVal::from(18i32);
                    v0 = TaggedVal::from(
                        ((v0.try_as_i32()? as u32) > (v1.try_as_i32()? as u32)) as i32,
                    );
                    if v0.try_as_i32()? != 0 {
                        {}
                        continue 'label_16;
                    }
                    break;
                }
                break;
            }
            'label_17: loop {
                v0 = TaggedVal::from(local_4);
                v1 = TaggedVal::from(16i32);
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_17;
                }
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(1i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(1i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(2i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(2i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(3i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(3i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(4i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(4i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(5i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(5i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(6i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(6i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(7i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(7i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(8i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(8i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(9i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(9i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(10i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(10i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(11i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(11i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(12i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(12i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(13i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(13i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(14i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(14i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(15i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(15i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(16i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_3 = v0.try_as_Handle()?;
                v0 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(16i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_1 = v0.try_as_Handle()?;
                break;
            }
            'label_18: loop {
                v0 = TaggedVal::from(local_4);
                v1 = TaggedVal::from(8i32);
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_18;
                }
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(1i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(1i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(2i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(2i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(3i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(3i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(4i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(4i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(5i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(5i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(6i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(6i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(7i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(7i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(8i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_3 = v0.try_as_Handle()?;
                v0 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(8i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_1 = v0.try_as_Handle()?;
                break;
            }
            'label_19: loop {
                v0 = TaggedVal::from(local_4);
                v1 = TaggedVal::from(4i32);
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_19;
                }
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(1i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(1i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(2i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(2i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(3i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(3i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(4i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_3 = v0.try_as_Handle()?;
                v0 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(4i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_1 = v0.try_as_Handle()?;
                break;
            }
            'label_20: loop {
                v0 = TaggedVal::from(local_4);
                v1 = TaggedVal::from(2i32);
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_20;
                }
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(1i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                v1 = TaggedVal::from(local_1);
                v2 = TaggedVal::from(1i32);
                v1 = TaggedVal::from(v1.try_as_handle()?.add(v2.try_as_i32()?)?);
                v1 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v1.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                write_mem_u8(
                    &mut self
                        .segments
                        .get_mut(v0.try_as_Handle()?.segment_index()?)?
                        .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    v1.try_as_i32()? as u8,
                )?;
                v0 = TaggedVal::from(local_3);
                v1 = TaggedVal::from(2i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_3 = v0.try_as_Handle()?;
                v0 = TaggedVal::from(local_1);
                v1 = TaggedVal::from(2i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_1 = v0.try_as_Handle()?;
                break;
            }
            v0 = TaggedVal::from(local_4);
            v1 = TaggedVal::from(1i32);
            v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
            v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_3;
            }
            v0 = TaggedVal::from(local_3);
            v1 = TaggedVal::from(local_1);
            v1 = TaggedVal::from(
                read_mem_u8(
                    &self
                        .segments
                        .get(v1.try_as_Handle()?.segment_index()?)?
                        .get_data()?,
                    (v1.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                )
                .and_then(|x| Some(x as i32))?,
            );
            write_mem_u8(
                &mut self
                    .segments
                    .get_mut(v0.try_as_Handle()?.segment_index()?)?
                    .get_mut_data((v0.try_as_Handle()?.add(0)?.segment_offset()?))?,
                (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                v1.try_as_i32()? as u8,
            )?;
            break;
        }
        v0 = TaggedVal::from(local_0);
        Some(v0.try_as_Handle()?)
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_32(&mut self, arg_0: Handle) -> Option<i32> {
        let mut local_0: Handle = arg_0;
        let mut local_1: i32 = 0i32;
        let mut local_2: i32 = 0i32;
        let mut local_3: Handle = Handle::NULL;
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        let mut v2: TaggedVal;
        'label_0: loop {
            'label_1: loop {
                v0 = TaggedVal::from(local_0);
                v0 = TaggedVal::from(v0.try_as_handle()?.segment_offset()? as u32);
                local_1 = v0.try_as_i32()?;
                v1 = TaggedVal::from(3i32);
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_1;
                }
                v0 = TaggedVal::from(local_1);
                local_2 = v0.try_as_i32()?;
                v0 = TaggedVal::from(local_0);
                v0 = TaggedVal::from(
                    read_mem_u8(
                        &self
                            .segments
                            .get(v0.try_as_Handle()?.segment_index()?)?
                            .get_data()?,
                        (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                    )
                    .and_then(|x| Some(x as i32))?,
                );
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_0;
                }
                'label_2: loop {
                    v0 = TaggedVal::from(local_0);
                    v1 = TaggedVal::from(1i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_0 = v0.try_as_Handle()?;
                    v0 = TaggedVal::from(v0.try_as_handle()?.segment_offset()? as u32);
                    local_2 = v0.try_as_i32()?;
                    v1 = TaggedVal::from(3i32);
                    v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                    v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                    if v0.try_as_i32()? != 0 {
                        {}
                        break 'label_1;
                    }
                    v0 = TaggedVal::from(local_0);
                    v0 = TaggedVal::from(
                        read_mem_u8(
                            &self
                                .segments
                                .get(v0.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )
                        .and_then(|x| Some(x as i32))?,
                    );
                    v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                    if v0.try_as_i32()? != 0 {
                        {}
                        break 'label_0;
                    }
                    {}
                    continue 'label_2;
                    break;
                }
                break;
            }
            'label_3: loop {
                v0 = TaggedVal::from(local_0);
                local_3 = v0.try_as_Handle()?;
                v1 = TaggedVal::from(4i32);
                v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                local_0 = v0.try_as_Handle()?;
                v0 = TaggedVal::from(local_3);
                v0 = TaggedVal::from(read_mem_i32(
                    &self
                        .segments
                        .get(v0.try_as_Handle()?.segment_index()?)?
                        .get_data()?,
                    (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                )?);
                local_2 = v0.try_as_i32()?;
                v1 = TaggedVal::from(-1i32);
                v0 = TaggedVal::from(v0.try_as_i32()? ^ v1.try_as_i32()?);
                v1 = TaggedVal::from(local_2);
                v2 = TaggedVal::from(-16843009i32);
                v1 = TaggedVal::from(v1.try_as_i32()?.wrapping_add(v2.try_as_i32()?));
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                v1 = TaggedVal::from(-2139062144i32);
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    continue 'label_3;
                }
                break;
            }
            'label_4: loop {
                v0 = TaggedVal::from(local_2);
                v1 = TaggedVal::from(255i32);
                v0 = TaggedVal::from(v0.try_as_i32()? & v1.try_as_i32()?);
                v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
                if v0.try_as_i32()? != 0 {
                    {}
                    break 'label_4;
                }
                'label_5: loop {
                    v0 = TaggedVal::from(local_3);
                    v1 = TaggedVal::from(1i32);
                    v0 = TaggedVal::from(v0.try_as_handle()?.add(v1.try_as_i32()?)?);
                    local_3 = v0.try_as_Handle()?;
                    v0 = TaggedVal::from(
                        read_mem_u8(
                            &self
                                .segments
                                .get(v0.try_as_Handle()?.segment_index()?)?
                                .get_data()?,
                            (v0.try_as_Handle()?.add(0)?.segment_offset()?) as usize,
                        )
                        .and_then(|x| Some(x as i32))?,
                    );
                    if v0.try_as_i32()? != 0 {
                        {}
                        continue 'label_5;
                    }
                    break;
                }
                break;
            }
            v0 = TaggedVal::from(local_3);
            v0 = TaggedVal::from(v0.try_as_handle()?.segment_offset()? as u32);
            local_2 = v0.try_as_i32()?;
            break;
        }
        v0 = TaggedVal::from(local_2);
        v1 = TaggedVal::from(local_1);
        v0 = TaggedVal::from(v0.try_as_i32()?.wrapping_sub(v1.try_as_i32()?));
        Some(v0.try_as_i32()?)
    }
}

impl WasmModule {
    #[allow(dead_code)]
    fn indirect_call(&mut self, idx: usize, args: &[TaggedVal]) -> Option<Vec<TaggedVal>> {
        let call_target = (*self.indirect_call_table.get(idx)?)?;
        match call_target {
            0 => {
                if args.len() != 1 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let rets = self.func_0(a0)?;
                Some(vec![TaggedVal::from(rets)])
            }
            1 => {
                if args.len() != 2 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let a1 = args[1].try_as_Handle()?;
                let rets = self.func_1(a0, a1)?;
                Some(vec![TaggedVal::from(rets)])
            }
            2 => {
                if args.len() != 4 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let a1 = args[1].try_as_i64()?;
                let a2 = args[2].try_as_i32()?;
                let a3 = args[3].try_as_Handle()?;
                let rets = self.func_2(a0, a1, a2, a3)?;
                Some(vec![TaggedVal::from(rets)])
            }
            3 => {
                if args.len() != 4 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let a1 = args[1].try_as_Handle()?;
                let a2 = args[2].try_as_i32()?;
                let a3 = args[3].try_as_Handle()?;
                let rets = self.func_3(a0, a1, a2, a3)?;
                Some(vec![TaggedVal::from(rets)])
            }
            4 => {
                if args.len() != 1 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                self.func_4(a0)?;
                Some(vec![])
            }
            5 => {
                if args.len() != 0 {
                    return None;
                }

                self.func_5()?;
                Some(vec![])
            }
            6 => {
                if args.len() != 0 {
                    return None;
                }

                self.func_6()?;
                Some(vec![])
            }
            7 => {
                if args.len() != 0 {
                    return None;
                }

                self.func_7()?;
                Some(vec![])
            }
            8 => {
                if args.len() != 0 {
                    return None;
                }

                let rets = self.func_8()?;
                Some(vec![TaggedVal::from(rets)])
            }
            9 => {
                if args.len() != 0 {
                    return None;
                }

                let rets = self.func_9()?;
                Some(vec![TaggedVal::from(rets)])
            }
            10 => {
                if args.len() != 1 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let rets = self.func_10(a0)?;
                Some(vec![TaggedVal::from(rets)])
            }
            11 => {
                if args.len() != 2 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let a1 = args[1].try_as_Handle()?;
                let rets = self.func_11(a0, a1)?;
                Some(vec![TaggedVal::from(rets)])
            }
            12 => {
                if args.len() != 4 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let a1 = args[1].try_as_i64()?;
                let a2 = args[2].try_as_i32()?;
                let a3 = args[3].try_as_Handle()?;
                let rets = self.func_12(a0, a1, a2, a3)?;
                Some(vec![TaggedVal::from(rets)])
            }
            13 => {
                if args.len() != 4 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let a1 = args[1].try_as_Handle()?;
                let a2 = args[2].try_as_i32()?;
                let a3 = args[3].try_as_Handle()?;
                let rets = self.func_13(a0, a1, a2, a3)?;
                Some(vec![TaggedVal::from(rets)])
            }
            14 => {
                if args.len() != 1 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                self.func_14(a0)?;
                Some(vec![])
            }
            15 => {
                if args.len() != 0 {
                    return None;
                }

                self.func_15()?;
                Some(vec![])
            }
            16 => {
                if args.len() != 0 {
                    return None;
                }

                self.func_16()?;
                Some(vec![])
            }
            17 => {
                if args.len() != 0 {
                    return None;
                }

                self.func_17()?;
                Some(vec![])
            }
            18 => {
                if args.len() != 1 {
                    return None;
                }
                let a0 = args[0].try_as_Handle()?;
                let rets = self.func_18(a0)?;
                Some(vec![TaggedVal::from(rets)])
            }
            19 => {
                if args.len() != 4 {
                    return None;
                }
                let a0 = args[0].try_as_Handle()?;
                let a1 = args[1].try_as_i32()?;
                let a2 = args[2].try_as_i32()?;
                let a3 = args[3].try_as_Handle()?;
                let rets = self.func_19(a0, a1, a2, a3)?;
                Some(vec![TaggedVal::from(rets)])
            }
            20 => {
                if args.len() != 2 {
                    return None;
                }
                let a0 = args[0].try_as_Handle()?;
                let a1 = args[1].try_as_Handle()?;
                let rets = self.func_20(a0, a1)?;
                Some(vec![TaggedVal::from(rets)])
            }
            21 => {
                if args.len() != 2 {
                    return None;
                }
                let a0 = args[0].try_as_Handle()?;
                let a1 = args[1].try_as_i32()?;
                let rets = self.func_21(a0, a1)?;
                Some(vec![TaggedVal::from(rets)])
            }
            22 => {
                if args.len() != 1 {
                    return None;
                }
                let a0 = args[0].try_as_Handle()?;
                let rets = self.func_22(a0)?;
                Some(vec![TaggedVal::from(rets)])
            }
            23 => {
                if args.len() != 1 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let rets = self.func_23(a0)?;
                Some(vec![TaggedVal::from(rets)])
            }
            24 => {
                if args.len() != 1 {
                    return None;
                }
                let a0 = args[0].try_as_Handle()?;
                let rets = self.func_24(a0)?;
                Some(vec![TaggedVal::from(rets)])
            }
            25 => {
                if args.len() != 3 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let a1 = args[1].try_as_Handle()?;
                let a2 = args[2].try_as_i32()?;
                let rets = self.func_25(a0, a1, a2)?;
                Some(vec![TaggedVal::from(rets)])
            }
            26 => {
                if args.len() != 3 {
                    return None;
                }
                let a0 = args[0].try_as_Handle()?;
                let a1 = args[1].try_as_Handle()?;
                let a2 = args[2].try_as_i32()?;
                let rets = self.func_26(a0, a1, a2)?;
                Some(vec![TaggedVal::from(rets)])
            }
            27 => {
                if args.len() != 1 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let rets = self.func_27(a0)?;
                Some(vec![TaggedVal::from(rets)])
            }
            28 => {
                if args.len() != 3 {
                    return None;
                }
                let a0 = args[0].try_as_Handle()?;
                let a1 = args[1].try_as_Handle()?;
                let a2 = args[2].try_as_i32()?;
                let rets = self.func_28(a0, a1, a2)?;
                Some(vec![TaggedVal::from(rets)])
            }
            29 => {
                if args.len() != 3 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                let a1 = args[1].try_as_i64()?;
                let a2 = args[2].try_as_i32()?;
                let rets = self.func_29(a0, a1, a2)?;
                Some(vec![TaggedVal::from(rets)])
            }
            30 => {
                if args.len() != 3 {
                    return None;
                }
                let a0 = args[0].try_as_Handle()?;
                let a1 = args[1].try_as_i64()?;
                let a2 = args[2].try_as_i32()?;
                let rets = self.func_30(a0, a1, a2)?;
                Some(vec![TaggedVal::from(rets)])
            }
            31 => {
                if args.len() != 3 {
                    return None;
                }
                let a0 = args[0].try_as_Handle()?;
                let a1 = args[1].try_as_Handle()?;
                let a2 = args[2].try_as_i32()?;
                let rets = self.func_31(a0, a1, a2)?;
                Some(vec![TaggedVal::from(rets)])
            }
            32 => {
                if args.len() != 1 {
                    return None;
                }
                let a0 = args[0].try_as_Handle()?;
                let rets = self.func_32(a0)?;
                Some(vec![TaggedVal::from(rets)])
            }
            _ => None,
        }
    }
}

impl WasmModule {
    #[allow(dead_code)]
    pub fn get_memory(&mut self) -> *mut u8 {
        panic!("Memory export currently unimplemented for MS Wasm")
    }
}

impl WasmModule {
    pub fn _start(&mut self) -> Option<()> {
        self.func_7()
    }
}
fn main() {
    let mut wasm_module = WasmModule::new();
    wasm_module._start().unwrap();
}
