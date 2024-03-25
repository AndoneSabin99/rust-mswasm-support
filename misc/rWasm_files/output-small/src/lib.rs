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
        };
        m.globals.resize_with(2, Default::default);
        m.globals[0] = TaggedVal::from(Handle::NULL);
        m.globals[1] = TaggedVal::from(Handle::NULL);

        let init_handle = m.new_segment(1048576).unwrap();
        m.globals[1] = TaggedVal::from(init_handle); /* WORKAROUND for mswasm-llvm and data segment initialization */

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
    fn func_0(&mut self) -> Option<i32> {
        unimplemented!() /* env.__original_main */
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_1(&mut self, arg_0: i32) -> Option<()> {
        unimplemented!() /* env.exit */
    }

    #[allow(
        unused_mut,
        unused_variables,
        unused_assignments,
        unused_parens,
        unreachable_code,
        unused_labels
    )]
    fn func_2(&mut self) -> Option<()> {
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
    fn func_3(&mut self) -> Option<()> {
        let mut local_0: i32 = 0i32;
        let mut v0: TaggedVal;
        'label_0: loop {
            v0 = TaggedVal::from(self.func_0()?);
            local_0 = v0.try_as_i32()?;
            v0 = TaggedVal::from((v0.try_as_i32()? == 0) as i32);
            if v0.try_as_i32()? != 0 {
                {}
                break 'label_0;
            }
            v0 = TaggedVal::from(local_0);
            self.func_1(v0.try_as_i32()?)?;
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
    fn func_4(&mut self) -> Option<()> {
        let mut v0: TaggedVal;
        let mut v1: TaggedVal;
        v0 = TaggedVal::from(0i32);
        v1 = TaggedVal::from(72i32);
        write_mem_u8(
            &mut self
                .segments
                .get_mut(v0.try_as_Handle()?.segment_index()?)?
                .get_mut_data((v0.try_as_Handle()?.add(753664)?.segment_offset()?))?,
            (v0.try_as_Handle()?.add(753664)?.segment_offset()?) as usize,
            v1.try_as_i32()? as u8,
        )?;
        'label_0: loop {
            {}
            continue 'label_0;
            break;
        }
        Some(())
    }
}

impl WasmModule {
    #[allow(dead_code)]
    fn indirect_call(&mut self, idx: usize, args: &[TaggedVal]) -> Option<Vec<TaggedVal>> {
        let call_target = (*self.indirect_call_table.get(idx)?)?;
        match call_target {
            0 => {
                if args.len() != 0 {
                    return None;
                }

                let rets = self.func_0()?;
                Some(vec![TaggedVal::from(rets)])
            }
            1 => {
                if args.len() != 1 {
                    return None;
                }
                let a0 = args[0].try_as_i32()?;
                self.func_1(a0)?;
                Some(vec![])
            }
            2 => {
                if args.len() != 0 {
                    return None;
                }

                self.func_2()?;
                Some(vec![])
            }
            3 => {
                if args.len() != 0 {
                    return None;
                }

                self.func_3()?;
                Some(vec![])
            }
            4 => {
                if args.len() != 0 {
                    return None;
                }

                self.func_4()?;
                Some(vec![])
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
        self.func_3()
    }
}

impl WasmModule {
    pub fn my_entry_point(&mut self) -> Option<()> {
        self.func_4()
    }
}
