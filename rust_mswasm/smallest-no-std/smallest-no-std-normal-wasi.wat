(module
  (type (;0;) (func))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32)))
  (type (;5;) (func (param i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32 i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32)))
  (type (;10;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;11;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;12;) (func (param i32 i32 i32 i32 i32)))
  (type (;13;) (func (param i32 i32 i32 i32 i32 i32 i32)))
  (type (;14;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;15;) (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;16;) (func (param i64 i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "fd_write" (func $wasi::lib_generated::wasi_snapshot_preview1::fd_write::h0b10c40574ebf28c (type 7)))
  (import "wasi_snapshot_preview1" "environ_get" (func $__imported_wasi_snapshot_preview1_environ_get (type 6)))
  (import "wasi_snapshot_preview1" "environ_sizes_get" (func $__imported_wasi_snapshot_preview1_environ_sizes_get (type 6)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (type 1)))
  (func $__wasm_call_ctors (type 0))
  (func $_start (type 0)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load offset=1052208
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store offset=1052208
        call $__wasm_call_ctors
        call $__main_void
        local.set 0
        call $__wasm_call_dtors
        local.get 0
        br_if 1 (;@1;)
        return
      end
      unreachable
      unreachable
    end
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $std::sys_common::backtrace::__rust_begin_short_backtrace::hea9e69b2e5103216 (type 1) (param i32)
    local.get 0
    call_indirect (type 0))
  (func $std::rt::lang_start::h17fccc321786affa (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    i32.const 12
    i32.add
    i32.const 1048576
    local.get 1
    local.get 2
    local.get 3
    call $std::rt::lang_start_internal::he26dd9e71170290b
    local.set 0
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $std::rt::lang_start::_$u7b$$u7b$closure$u7d$$u7d$::hbaf4d041f180fb97 (type 3) (param i32) (result i32)
    local.get 0
    i32.load
    call $std::sys_common::backtrace::__rust_begin_short_backtrace::hea9e69b2e5103216
    i32.const 0)
  (func $core::ops::function::FnOnce::call_once$u7b$$u7b$vtable.shim$u7d$$u7d$::h2ded1b847c4da183 (type 3) (param i32) (result i32)
    local.get 0
    i32.load
    call $std::sys_common::backtrace::__rust_begin_short_backtrace::hea9e69b2e5103216
    i32.const 0)
  (func $core::ptr::drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$::h8e212b48b3fb4e5f (type 1) (param i32))
  (func $hello::main::hb7b3890ee9daee14 (type 0))
  (func $__main_void (type 8) (result i32)
    i32.const 1
    i32.const 0
    i32.const 0
    i32.const 0
    call $std::rt::lang_start::h17fccc321786affa)
  (func $__rust_alloc (type 6) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    call $__rdl_alloc
    local.set 2
    local.get 2
    return)
  (func $__rust_dealloc (type 4) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $__rdl_dealloc
    return)
  (func $__rust_realloc (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__rdl_realloc
    local.set 4
    local.get 4
    return)
  (func $__rust_alloc_error_handler (type 2) (param i32 i32)
    local.get 0
    local.get 1
    call $__rg_oom
    return)
  (func $_$LT$T$u20$as$u20$core..any..Any$GT$::type_id::h1142b6be157e9bc4 (type 2) (param i32 i32)
    local.get 0
    i64.const -163230743173927068
    i64.store offset=8
    local.get 0
    i64.const -4493808902380553279
    i64.store)
  (func $_$LT$T$u20$as$u20$core..any..Any$GT$::type_id::h586c8643717611c3 (type 2) (param i32 i32)
    local.get 0
    i64.const -1100274326188739332
    i64.store offset=8
    local.get 0
    i64.const -5303373566618544236
    i64.store)
  (func $_$LT$T$u20$as$u20$core..any..Any$GT$::type_id::h7efadeb85ead2e08 (type 2) (param i32 i32)
    local.get 0
    i64.const -1215451021191083597
    i64.store offset=8
    local.get 0
    i64.const 2606717219617146388
    i64.store)
  (func $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h2079d7df0a1eb8b0 (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_$LT$bool$u20$as$u20$core..fmt..Display$GT$::fmt::h8663ae5543f3e281)
  (func $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h279b4a1bdf2e6d98 (type 6) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.load
    i32.load
    local.tee 0
    i32.store offset=12
    local.get 1
    i32.const 1048936
    i32.const 8
    local.get 0
    i32.const 12
    i32.add
    i32.const 1048944
    local.get 2
    i32.const 12
    i32.add
    i32.const 1048960
    call $core::fmt::Formatter::debug_tuple_field2_finish::ha1725a08f0d66504
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h28708fd1c962f157 (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 0
    i32.load offset=8
    local.set 3
    local.get 0
    i32.load
    local.set 0
    local.get 2
    i32.const 4
    i32.add
    local.get 1
    call $core::fmt::Formatter::debug_list::h454de1ae3271f93b
    block  ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 2
        local.get 0
        i32.store offset=12
        local.get 2
        i32.const 4
        i32.add
        local.get 2
        i32.const 12
        i32.add
        i32.const 1048604
        call $core::fmt::builders::DebugSet::entry::h5325a031c885a89f
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 3
        i32.const -1
        i32.add
        local.tee 3
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 4
    i32.add
    call $core::fmt::builders::DebugList::finish::he438d931749ecb0a
    local.set 0
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h6d8c8d1d35948efd (type 6) (param i32 i32) (result i32)
    local.get 1
    i32.const 1048600
    i32.const 2
    call $core::fmt::Formatter::pad::hdb5d5c683ab6fe77)
  (func $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h963c7d69dc6543a0 (type 6) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.load
    local.set 0
    block  ;; label = @1
      local.get 1
      i32.load offset=28
      local.tee 2
      i32.const 16
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.const 32
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $core::fmt::num::imp::_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$::fmt::ha027f6e8cdd18387
        return
      end
      local.get 0
      local.get 1
      call $core::fmt::num::_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i8$GT$::fmt::hf957f32f03d84197
      return
    end
    local.get 0
    local.get 1
    call $core::fmt::num::_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i8$GT$::fmt::hd72fbff1ec49255f)
  (func $_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$::fmt::h6e592427f5a867eb (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    call $_$LT$core..panic..location..Location$u20$as$u20$core..fmt..Display$GT$::fmt::h1dfad41ac74fe89f)
  (func $_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$::fmt::h81171607e1e94452 (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_$LT$str$u20$as$u20$core..fmt..Display$GT$::fmt::h02dbbed087bb8109)
  (func $core::fmt::num::_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$::fmt::h0c9e60ab0a791324 (type 6) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=28
      local.tee 2
      i32.const 16
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.const 32
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $core::fmt::num::imp::_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$::fmt::h29fb969253e3cd7f
        return
      end
      local.get 0
      local.get 1
      call $core::fmt::num::_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$::fmt::h38cc0ec19c9bca48
      return
    end
    local.get 0
    local.get 1
    call $core::fmt::num::_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$::fmt::h8c09e6cb62ff79fe)
  (func $core::fmt::Write::write_char::h5d5523b45bbe5748 (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 3
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 3
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 1
      i32.load offset=4
      local.get 1
      i32.load offset=8
      local.tee 0
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      local.get 3
      call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd
      local.get 1
      i32.load offset=8
      local.set 0
    end
    local.get 1
    i32.load
    local.get 0
    i32.add
    local.get 2
    i32.const 12
    i32.add
    local.get 3
    call $memcpy
    drop
    local.get 1
    local.get 0
    local.get 3
    i32.add
    i32.store offset=8
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd (type 4) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 2
        i32.add
        local.tee 2
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.tee 1
        i32.const 1
        i32.shl
        local.tee 4
        local.get 2
        local.get 4
        local.get 2
        i32.gt_u
        select
        local.tee 2
        i32.const 8
        local.get 2
        i32.const 8
        i32.gt_u
        select
        local.tee 2
        i32.const -1
        i32.xor
        i32.const 31
        i32.shr_u
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            local.get 3
            i32.const 0
            i32.store offset=24
            br 1 (;@3;)
          end
          local.get 3
          local.get 1
          i32.store offset=28
          local.get 3
          i32.const 1
          i32.store offset=24
          local.get 3
          local.get 0
          i32.load
          i32.store offset=20
        end
        local.get 3
        i32.const 8
        i32.add
        local.get 4
        local.get 2
        local.get 3
        i32.const 20
        i32.add
        call $alloc::raw_vec::finish_grow::h6f11965df52e7958
        local.get 3
        i32.load offset=12
        local.set 1
        block  ;; label = @3
          local.get 3
          i32.load offset=8
          br_if 0 (;@3;)
          local.get 0
          local.get 2
          i32.store offset=4
          local.get 0
          local.get 1
          i32.store
          br 2 (;@1;)
        end
        local.get 1
        i32.const -2147483647
        i32.eq
        br_if 1 (;@1;)
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.const 16
        i32.add
        i32.load
        call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
        unreachable
      end
      call $alloc::raw_vec::capacity_overflow::h504ef83d06198b94
      unreachable
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $core::fmt::Write::write_char::hc91a6ceb133a5c56 (type 6) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 1
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 1
    end
    local.get 0
    local.get 2
    i32.const 12
    i32.add
    local.get 1
    call $_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$::write_str::hd8d11b51ef8f70c5
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$::write_str::hd8d11b51ef8f70c5 (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 0
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          loop  ;; label = @4
            local.get 3
            local.get 2
            i32.store offset=4
            local.get 3
            local.get 1
            i32.store
            local.get 3
            i32.const 8
            i32.add
            i32.const 2
            local.get 3
            i32.const 1
            call $wasi::lib_generated::fd_write::h41f6a0177730a9fb
            block  ;; label = @5
              local.get 3
              i32.load16_u offset=8
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 5
                br_if 0 (;@6;)
                i32.const 2
                local.set 2
                i32.const 1049612
                local.set 5
                br 3 (;@3;)
              end
              local.get 2
              local.get 5
              i32.lt_u
              br_if 4 (;@1;)
              local.get 1
              local.get 5
              i32.add
              local.set 1
              local.get 2
              local.get 5
              i32.sub
              local.tee 2
              br_if 1 (;@4;)
              br 3 (;@2;)
            end
            block  ;; label = @5
              local.get 3
              i32.load16_u offset=10
              local.tee 5
              i32.const 27
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              br_if 1 (;@4;)
              br 3 (;@2;)
            end
          end
          i32.const 0
          local.set 2
        end
        local.get 0
        i32.load offset=4
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            local.tee 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 4
          i32.load
          local.tee 6
          local.get 4
          i32.const 4
          i32.add
          i32.load
          local.tee 1
          i32.load
          call_indirect (type 1)
          block  ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 7
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 7
            local.get 1
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 4
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 0
        local.get 5
        i32.store offset=4
        local.get 0
        local.get 2
        i32.store
        i32.const 1
        local.set 4
      end
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
      return
    end
    local.get 5
    local.get 2
    i32.const 1049624
    call $core::slice::index::slice_start_index_len_fail::hfb1719074a270fbd
    unreachable)
  (func $core::fmt::Write::write_fmt::h38938f948ad04fb5 (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.const 1049016
    local.get 1
    call $core::fmt::write::he742b579cc4461da)
  (func $core::fmt::Write::write_fmt::h54e558fbe9b645b1 (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.const 1049064
    local.get 1
    call $core::fmt::write::he742b579cc4461da)
  (func $core::fmt::Write::write_fmt::h5f6df1021872fcd4 (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.const 1049040
    local.get 1
    call $core::fmt::write::he742b579cc4461da)
  (func $std::panicking::default_hook::h5151d4f5a11faf85 (type 1) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u offset=17
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 0
          i32.load offset=1052296
          i32.const 1
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          call $std::panic::get_backtrace_style::hd88fb9ea4d232974
          i32.store8 offset=35
          br 2 (;@1;)
        end
        local.get 1
        i32.const 1
        i32.store8 offset=35
        br 1 (;@1;)
      end
      local.get 1
      i32.const 3
      i32.store8 offset=35
    end
    local.get 1
    local.get 0
    i32.load offset=12
    i32.store offset=36
    i32.const 12
    local.set 2
    local.get 1
    i32.const 16
    i32.add
    local.get 0
    i32.load
    local.tee 3
    local.get 0
    i32.load offset=4
    i32.const 12
    i32.add
    local.tee 0
    i32.load
    call_indirect (type 2)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i64.load offset=16
          i64.const -4493808902380553279
          i64.xor
          local.get 1
          i32.const 16
          i32.add
          i32.const 8
          i32.add
          i64.load
          i64.const -163230743173927068
          i64.xor
          i64.or
          i64.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 3
          local.get 0
          i32.load
          call_indirect (type 2)
          i32.const 1050460
          local.set 0
          local.get 1
          i64.load
          i64.const 2606717219617146388
          i64.xor
          local.get 1
          i32.const 8
          i32.add
          i64.load
          i64.const -1215451021191083597
          i64.xor
          i64.or
          i64.eqz
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 8
          i32.add
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.const 4
        i32.add
        local.set 0
      end
      local.get 0
      i32.load
      local.set 2
      local.get 3
      i32.load
      local.set 0
    end
    local.get 1
    local.get 2
    i32.store offset=44
    local.get 1
    local.get 0
    i32.store offset=40
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1052304
                  local.tee 0
                  br_if 0 (;@7;)
                  call $core::cell::once::OnceCell$LT$T$GT$::get_or_try_init::outlined_call::hdfbad01490acba19
                  local.set 0
                  i32.const 0
                  i32.load offset=1052304
                  br_if 1 (;@6;)
                  i32.const 0
                  local.get 0
                  i32.store offset=1052304
                end
                local.get 0
                local.get 0
                i32.load
                local.tee 3
                i32.const 1
                i32.add
                i32.store
                local.get 3
                i32.const -1
                i32.le_s
                br_if 1 (;@5;)
                local.get 1
                local.get 0
                i32.store offset=48
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.const 16
                    i32.add
                    i32.load
                    local.tee 3
                    br_if 0 (;@8;)
                    i32.const 9
                    local.set 2
                    i32.const 1050472
                    local.set 3
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.const 20
                  i32.add
                  i32.load
                  i32.const -1
                  i32.add
                  local.set 2
                end
                local.get 1
                local.get 2
                i32.store offset=56
                local.get 1
                local.get 3
                i32.store offset=52
                local.get 1
                local.get 1
                i32.const 35
                i32.add
                i32.store offset=72
                local.get 1
                local.get 1
                i32.const 40
                i32.add
                i32.store offset=68
                local.get 1
                local.get 1
                i32.const 36
                i32.add
                i32.store offset=64
                local.get 1
                local.get 1
                i32.const 52
                i32.add
                i32.store offset=60
                block  ;; label = @7
                  i32.const 0
                  i32.load8_u offset=1052215
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 0
                  i32.store offset=76
                  br 4 (;@3;)
                end
                i32.const 0
                i32.const 1
                i32.store8 offset=1052215
                block  ;; label = @7
                  i32.const 0
                  i32.load8_u offset=1052312
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 1
                  i32.store8 offset=1052312
                  i32.const 0
                  i32.const 0
                  i32.store offset=1052316
                  local.get 1
                  i32.const 0
                  i32.store offset=76
                  br 4 (;@3;)
                end
                local.get 1
                i32.const 0
                i32.load offset=1052316
                local.tee 3
                i32.store offset=76
                i32.const 0
                i32.const 0
                i32.store offset=1052316
                local.get 3
                i32.eqz
                br_if 3 (;@3;)
                local.get 3
                i32.load8_u offset=8
                local.set 0
                local.get 3
                i32.const 1
                i32.store8 offset=8
                local.get 1
                local.get 0
                i32.store8 offset=83
                local.get 0
                br_if 2 (;@4;)
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1052280
                      i32.const 2147483647
                      i32.and
                      br_if 0 (;@9;)
                      local.get 1
                      i32.const 60
                      i32.add
                      local.get 3
                      i32.const 12
                      i32.add
                      i32.const 1050484
                      call $std::panicking::default_hook::_$u7b$$u7b$closure$u7d$$u7d$::h419c149e05a30ae3
                      local.get 3
                      i32.const 9
                      i32.add
                      local.set 0
                      br 1 (;@8;)
                    end
                    call $std::panicking::panic_count::is_zero_slow_path::h2f06658ce40047a2
                    local.set 0
                    local.get 1
                    i32.const 60
                    i32.add
                    local.get 3
                    i32.const 12
                    i32.add
                    i32.const 1050484
                    call $std::panicking::default_hook::_$u7b$$u7b$closure$u7d$$u7d$::h419c149e05a30ae3
                    local.get 0
                    i32.eqz
                    br_if 1 (;@7;)
                    local.get 3
                    i32.const 9
                    i32.add
                    local.set 0
                  end
                  i32.const 0
                  i32.load offset=1052280
                  i32.const 2147483647
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  call $std::panicking::panic_count::is_zero_slow_path::h2f06658ce40047a2
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 1
                  i32.store8
                end
                local.get 3
                i32.const 0
                i32.store8 offset=8
                i32.const 0
                i32.const 1
                i32.store8 offset=1052215
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load8_u offset=1052312
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 3
                    i32.store offset=1052316
                    i32.const 0
                    i32.const 1
                    i32.store8 offset=1052312
                    br 1 (;@7;)
                  end
                  i32.const 0
                  i32.load offset=1052316
                  local.set 0
                  i32.const 0
                  local.get 3
                  i32.store offset=1052316
                  local.get 1
                  local.get 0
                  i32.store offset=84
                  local.get 0
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 0
                  i32.load
                  local.tee 3
                  i32.const -1
                  i32.add
                  i32.store
                  local.get 3
                  i32.const 1
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 84
                  i32.add
                  call $alloc::sync::Arc$LT$T$C$A$GT$::drop_slow::hf268e402dc91d702
                end
                i32.const 1
                local.set 3
                local.get 1
                i32.load offset=48
                local.tee 0
                i32.eqz
                br_if 5 (;@1;)
                br 4 (;@2;)
              end
              local.get 1
              i32.const 96
              i32.add
              i64.const 0
              i64.store align=4
              local.get 1
              i32.const 1
              i32.store offset=88
              local.get 1
              i32.const 1048636
              i32.store offset=84
              local.get 1
              i32.const 1048620
              i32.store offset=92
              local.get 1
              i32.const 84
              i32.add
              i32.const 1048724
              call $core::panicking::panic_fmt::h5318dfeccdd30466
              unreachable
            end
            unreachable
            unreachable
          end
          local.get 1
          i64.const 0
          i64.store offset=96 align=4
          local.get 1
          i32.const 1048620
          i32.store offset=92
          local.get 1
          i32.const 1
          i32.store offset=88
          local.get 1
          i32.const 1049744
          i32.store offset=84
          local.get 1
          i32.const 83
          i32.add
          local.get 1
          i32.const 84
          i32.add
          call $core::panicking::assert_failed::ha618ecf66c52be40
          unreachable
        end
        local.get 1
        i32.const 60
        i32.add
        local.get 1
        i32.const 111
        i32.add
        i32.const 1050524
        call $std::panicking::default_hook::_$u7b$$u7b$closure$u7d$$u7d$::h419c149e05a30ae3
        i32.const 0
        local.set 3
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 2
      i32.const -1
      i32.add
      i32.store
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.const 48
        i32.add
        call $alloc::sync::Arc$LT$T$C$A$GT$::drop_slow::h46b666e0dd7f5b95
      end
      local.get 3
      i32.const -1
      i32.xor
      local.get 1
      i32.load offset=76
      local.tee 0
      i32.const 0
      i32.ne
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i32.load
      local.tee 3
      i32.const -1
      i32.add
      i32.store
      local.get 3
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.const 76
      i32.add
      call $alloc::sync::Arc$LT$T$C$A$GT$::drop_slow::hf268e402dc91d702
    end
    local.get 1
    i32.const 112
    i32.add
    global.set $__stack_pointer)
  (func $core::ptr::drop_in_place$LT$$RF$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Sync$u2b$core..marker..Send$GT$$GT$::h4c65b221180b18dd (type 1) (param i32))
  (func $std::panicking::panic_count::is_zero_slow_path::h2f06658ce40047a2 (type 8) (result i32)
    i32.const 0
    i32.load offset=1052296
    i32.eqz)
  (func $core::ptr::drop_in_place$LT$$LP$$RP$$GT$::h2646790de1351d8c (type 1) (param i32))
  (func $alloc::sync::Arc$LT$T$C$A$GT$::drop_slow::h46b666e0dd7f5b95 (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.const 16
      i32.add
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 20
      i32.add
      i32.load
      local.set 2
      local.get 1
      i32.const 0
      i32.store8
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 2
      i32.const 1
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 0
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.const -1
      i32.add
      i32.store offset=4
      local.get 1
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 24
      i32.const 8
      call $__rust_dealloc
    end)
  (func $core::ptr::drop_in_place$LT$alloc..string..String$GT$::hb6d62107c9eb146c (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $core::ptr::drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$::ha5109be51b049845 (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $core::ptr::drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$::h21964594aec38a11 (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 8
      i32.add
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end)
  (func $core::ptr::drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$::haebd22c8be51709e (type 2) (param i32 i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.and
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end)
  (func $core::ptr::drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$::h7c2da7c0ed4859f5 (type 1) (param i32)
    (local i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end)
  (func $core::cell::once::OnceCell$LT$T$GT$::get_or_try_init::outlined_call::hdfbad01490acba19 (type 8) (result i32)
    (local i32 i32 i32 i32 i64 i64 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 8
    i32.add
    i32.const 8
    i32.const 16
    call $alloc::sync::arcinner_layout_for_value_layout::hbef0101ab1060e75
    local.get 0
    i32.load offset=8
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=12
        local.tee 2
        br_if 0 (;@2;)
        local.get 1
        local.set 3
        br 1 (;@1;)
      end
      i32.const 0
      i32.load8_u offset=1052213
      drop
      local.get 2
      local.get 1
      call $__rust_alloc
      local.set 3
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i64.const 4294967297
        i64.store
        local.get 3
        i32.const 16
        i32.add
        i32.const 0
        i32.store
        i32.const 0
        i64.load offset=1052288
        local.set 4
        loop  ;; label = @3
          local.get 4
          i64.const 1
          i64.add
          local.tee 5
          i64.eqz
          br_if 2 (;@1;)
          i32.const 0
          local.get 5
          i32.const 0
          i64.load offset=1052288
          local.tee 6
          local.get 6
          local.get 4
          i64.eq
          local.tee 1
          select
          i64.store offset=1052288
          local.get 6
          local.set 4
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 3
        local.get 5
        i64.store offset=8
        local.get 0
        i32.const 16
        i32.add
        global.set $__stack_pointer
        local.get 3
        return
      end
      local.get 1
      local.get 2
      call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
      unreachable
    end
    call $std::thread::ThreadId::new::exhausted::hff9eab39c7883b24
    unreachable)
  (func $std::thread::ThreadId::new::exhausted::hff9eab39c7883b24 (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 20
    i32.add
    i64.const 0
    i64.store align=4
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1049292
    i32.store offset=8
    local.get 0
    i32.const 1048620
    i32.store offset=16
    local.get 0
    i32.const 8
    i32.add
    i32.const 1049300
    call $core::panicking::panic_fmt::h5318dfeccdd30466
    unreachable)
  (func $core::panicking::assert_failed::ha618ecf66c52be40 (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1048740
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    i32.const 0
    local.get 2
    i32.const 8
    i32.add
    i32.const 1048744
    local.get 2
    i32.const 12
    i32.add
    i32.const 1048744
    local.get 1
    i32.const 1049808
    call $core::panicking::assert_failed_inner::h610911f03d5e9020
    unreachable)
  (func $_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$::write_char::hdbb5a8debbf3869a (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=14
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 1
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=15
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 1
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load offset=4
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve_for_push::h4693d34bee005451
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          local.get 3
          i32.const 1
          i32.add
          i32.store offset=8
          local.get 0
          i32.load
          local.get 3
          i32.add
          local.get 1
          i32.store8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        local.get 1
        call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd
        local.get 0
        i32.load offset=8
        local.set 3
      end
      local.get 0
      i32.load
      local.get 3
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 1
      call $memcpy
      drop
      local.get 0
      local.get 3
      local.get 1
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve_for_push::h4693d34bee005451 (type 2) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.const 1
        i32.shl
        local.tee 4
        local.get 1
        local.get 4
        local.get 1
        i32.gt_u
        select
        local.tee 1
        i32.const 8
        local.get 1
        i32.const 8
        i32.gt_u
        select
        local.tee 1
        i32.const -1
        i32.xor
        i32.const 31
        i32.shr_u
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=24
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.store offset=28
          local.get 2
          i32.const 1
          i32.store offset=24
          local.get 2
          local.get 0
          i32.load
          i32.store offset=20
        end
        local.get 2
        i32.const 8
        i32.add
        local.get 4
        local.get 1
        local.get 2
        i32.const 20
        i32.add
        call $alloc::raw_vec::finish_grow::h6f11965df52e7958
        local.get 2
        i32.load offset=12
        local.set 3
        block  ;; label = @3
          local.get 2
          i32.load offset=8
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.store offset=4
          local.get 0
          local.get 3
          i32.store
          br 2 (;@1;)
        end
        local.get 3
        i32.const -2147483647
        i32.eq
        br_if 1 (;@1;)
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.const 16
        i32.add
        i32.load
        call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
        unreachable
      end
      call $alloc::raw_vec::capacity_overflow::h504ef83d06198b94
      unreachable
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$::write_str::heb382b2c46f42892 (type 5) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load
    local.get 3
    i32.add
    local.get 1
    local.get 2
    call $memcpy
    drop
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $alloc::sync::Arc$LT$T$C$A$GT$::drop_slow::hf268e402dc91d702 (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.const 16
      i32.add
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 12
      i32.add
      i32.load
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 0
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.const -1
      i32.add
      i32.store offset=4
      local.get 1
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 24
      i32.const 4
      call $__rust_dealloc
    end)
  (func $alloc::raw_vec::finish_grow::h6f11965df52e7958 (type 9) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const -1
          i32.le_s
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.const 8
                  i32.add
                  i32.load
                  local.tee 4
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    local.get 1
                    local.set 3
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1052213
                  drop
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                local.get 1
                local.get 2
                call $__rust_realloc
                local.set 3
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                local.get 1
                local.set 3
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1052213
              drop
            end
            local.get 2
            local.get 1
            call $__rust_alloc
            local.set 3
          end
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            i32.store offset=4
            local.get 0
            i32.const 8
            i32.add
            local.get 2
            i32.store
            local.get 0
            i32.const 0
            i32.store
            return
          end
          local.get 0
          local.get 1
          i32.store offset=4
          local.get 0
          i32.const 8
          i32.add
          local.get 2
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        i32.const 0
        i32.store offset=4
        local.get 0
        i32.const 8
        i32.add
        local.get 2
        i32.store
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=4
    end
    local.get 0
    i32.const 1
    i32.store)
  (func $_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$::fmt::haf91c68ed724588a (type 6) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        i32.store offset=8
        local.get 1
        i32.const 1048976
        i32.const 2
        local.get 2
        i32.const 8
        i32.add
        i32.const 1048984
        call $core::fmt::Formatter::debug_tuple_field1_finish::hdff30d39fb3c99d5
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      local.get 0
      i32.store offset=12
      local.get 1
      i32.const 1048978
      i32.const 3
      local.get 2
      i32.const 12
      i32.add
      i32.const 1049000
      call $core::fmt::Formatter::debug_tuple_field1_finish::hdff30d39fb3c99d5
      local.set 0
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $std::sys::wasi::once::Once::call::h3955b2b90402c29d (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load8_u offset=1052214
                    br_table 0 (;@8;) 1 (;@7;) 2 (;@6;) 7 (;@1;) 0 (;@8;)
                  end
                  i32.const 0
                  i32.const 2
                  i32.store8 offset=1052214
                  local.get 0
                  i32.load8_u
                  local.set 2
                  local.get 0
                  i32.const 0
                  i32.store8
                  block  ;; label = @8
                    local.get 2
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 1
                    i32.const 0
                    i32.store8 offset=39
                    block  ;; label = @9
                      i32.const 0
                      i32.load8_u offset=1052248
                      i32.const 3
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 1
                      i32.const 39
                      i32.add
                      call $std::sync::once_lock::OnceLock$LT$T$GT$::initialize::h06e53343fecb2fd4
                      local.get 1
                      i32.load8_u offset=39
                      br_if 7 (;@2;)
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1052216
                          i32.const 1052308
                          i32.eq
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load8_u offset=1052244
                          local.set 2
                          i32.const 1
                          local.set 0
                          i32.const 0
                          i32.const 1
                          i32.store8 offset=1052244
                          local.get 2
                          br_if 9 (;@2;)
                          i32.const 0
                          i32.const 1052308
                          i32.store offset=1052216
                          br 1 (;@10;)
                        end
                        i32.const 0
                        i32.load offset=1052220
                        i32.const 1
                        i32.add
                        local.tee 0
                        i32.eqz
                        br_if 1 (;@9;)
                      end
                      i32.const 0
                      local.get 0
                      i32.store offset=1052220
                      i32.const 0
                      i32.load offset=1052224
                      br_if 4 (;@5;)
                      i32.const 0
                      i32.const -1
                      i32.store offset=1052224
                      i32.const 0
                      i32.load8_u offset=1052240
                      br_if 6 (;@3;)
                      i32.const 0
                      local.set 0
                      i32.const 0
                      i32.load offset=1052236
                      local.tee 3
                      i32.eqz
                      br_if 6 (;@3;)
                      i32.const 0
                      i32.load offset=1052228
                      local.set 4
                      loop  ;; label = @10
                        local.get 1
                        local.get 3
                        local.get 0
                        i32.sub
                        local.tee 5
                        i32.store offset=44
                        local.get 1
                        local.get 4
                        local.get 0
                        i32.add
                        local.tee 6
                        i32.store offset=40
                        local.get 1
                        i32.const 12
                        i32.add
                        i32.const 1
                        local.get 1
                        i32.const 40
                        i32.add
                        i32.const 1
                        call $wasi::lib_generated::fd_write::h41f6a0177730a9fb
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 1
                                  i32.load16_u offset=12
                                  br_if 0 (;@15;)
                                  local.get 1
                                  i32.load offset=16
                                  local.set 2
                                  br 1 (;@14;)
                                end
                                local.get 5
                                local.set 2
                                local.get 1
                                i32.load16_u offset=14
                                i32.const -8
                                i32.add
                                br_table 0 (;@14;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 1 (;@13;) 3 (;@11;) 1 (;@13;)
                              end
                              local.get 2
                              br_if 1 (;@12;)
                            end
                            local.get 0
                            i32.eqz
                            br_if 9 (;@3;)
                            local.get 4
                            local.get 6
                            local.get 5
                            call $memmove
                            drop
                            br 9 (;@3;)
                          end
                          local.get 2
                          local.get 0
                          i32.add
                          local.set 0
                        end
                        local.get 0
                        local.get 3
                        i32.ge_u
                        br_if 6 (;@4;)
                        br 0 (;@10;)
                      end
                    end
                    i32.const 1049900
                    i32.const 38
                    i32.const 1049972
                    call $core::option::expect_failed::h90e12276ee96550c
                    unreachable
                  end
                  i32.const 1048760
                  i32.const 43
                  i32.const 1049852
                  call $core::panicking::panic::h9910a7377b663c09
                  unreachable
                end
                local.get 1
                i32.const 24
                i32.add
                i64.const 0
                i64.store align=4
                local.get 1
                i32.const 1
                i32.store offset=16
                local.get 1
                i32.const 1051168
                i32.store offset=12
                local.get 1
                i32.const 1048620
                i32.store offset=20
                local.get 1
                i32.const 12
                i32.add
                i32.const 1049192
                call $core::panicking::panic_fmt::h5318dfeccdd30466
                unreachable
              end
              local.get 1
              i32.const 24
              i32.add
              i64.const 0
              i64.store align=4
              local.get 1
              i32.const 1
              i32.store offset=16
              local.get 1
              i32.const 1051232
              i32.store offset=12
              local.get 1
              i32.const 1048620
              i32.store offset=20
              local.get 1
              i32.const 12
              i32.add
              i32.const 1049192
              call $core::panicking::panic_fmt::h5318dfeccdd30466
              unreachable
            end
            i32.const 1049368
            call $core::cell::panic_already_borrowed::hba1b9dd1c7238586
            unreachable
          end
          local.get 3
          local.get 0
          i32.ge_u
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          i32.const 1048920
          call $core::slice::index::slice_end_index_len_fail::h1772581b926ea523
          unreachable
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1052232
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1052228
          local.get 0
          i32.const 1
          call $__rust_dealloc
        end
        i32.const 0
        i64.const 0
        i64.store offset=1052232 align=4
        i32.const 0
        i32.const 1
        i32.store offset=1052228
        i32.const 0
        i32.const 0
        i32.load offset=1052224
        i32.const 1
        i32.add
        i32.store offset=1052224
        i32.const 0
        i32.const 0
        i32.load offset=1052220
        i32.const -1
        i32.add
        local.tee 0
        i32.store offset=1052220
        i32.const 0
        i32.const 0
        i32.store8 offset=1052240
        local.get 0
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store8 offset=1052244
        i32.const 0
        i32.const 0
        i32.store offset=1052216
      end
      i32.const 0
      i32.const 3
      i32.store8 offset=1052214
    end
    local.get 1
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $std::rt::lang_start_internal::he26dd9e71170290b (type 10) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i64 i64 i64)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    i32.const 20
    i32.add
    i32.const 1049088
    i32.const 4
    call $_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$::spec_new_impl::haf5611f48815a534
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 5
            i32.load offset=20
            br_if 0 (;@4;)
            local.get 5
            i32.const 20
            i32.add
            i32.const 8
            i32.add
            i32.load
            local.set 6
            local.get 5
            i32.load offset=24
            local.set 7
            local.get 5
            i32.const 8
            i32.add
            i32.const 8
            i32.const 16
            call $alloc::sync::arcinner_layout_for_value_layout::hbef0101ab1060e75
            local.get 5
            i32.load offset=8
            local.set 8
            block  ;; label = @5
              block  ;; label = @6
                local.get 5
                i32.load offset=12
                local.tee 9
                br_if 0 (;@6;)
                local.get 8
                local.set 10
                br 1 (;@5;)
              end
              i32.const 0
              i32.load8_u offset=1052213
              drop
              local.get 9
              local.get 8
              call $__rust_alloc
              local.set 10
            end
            local.get 10
            i32.eqz
            br_if 1 (;@3;)
            local.get 10
            i64.const 4294967297
            i64.store
            local.get 10
            local.get 6
            i32.store offset=20
            local.get 10
            i32.const 16
            i32.add
            local.get 7
            i32.store
            i32.const 0
            i64.load offset=1052288
            local.set 11
            loop  ;; label = @5
              local.get 11
              i64.const 1
              i64.add
              local.tee 12
              i64.eqz
              br_if 3 (;@2;)
              i32.const 0
              local.get 12
              i32.const 0
              i64.load offset=1052288
              local.tee 13
              local.get 13
              local.get 11
              i64.eq
              local.tee 8
              select
              i64.store offset=1052288
              local.get 13
              local.set 11
              local.get 8
              i32.eqz
              br_if 0 (;@5;)
            end
            local.get 10
            local.get 12
            i64.store offset=8
            local.get 5
            i32.load offset=20
            local.tee 8
            i32.eqz
            br_if 3 (;@1;)
            local.get 5
            i32.load offset=24
            local.tee 6
            i32.eqz
            br_if 3 (;@1;)
            local.get 8
            local.get 6
            i32.const 1
            call $__rust_dealloc
            br 3 (;@1;)
          end
          local.get 5
          local.get 5
          i32.const 20
          i32.add
          i32.store offset=36
          local.get 5
          i32.const 68
          i32.add
          i64.const 1
          i64.store align=4
          local.get 5
          i32.const 2
          i32.store offset=60
          local.get 5
          i32.const 1049152
          i32.store offset=56
          local.get 5
          i32.const 5
          i32.store offset=52
          local.get 5
          local.get 5
          i32.const 48
          i32.add
          i32.store offset=64
          local.get 5
          local.get 5
          i32.const 36
          i32.add
          i32.store offset=48
          local.get 5
          i32.const 40
          i32.add
          local.get 5
          i32.const 48
          i32.add
          local.get 5
          i32.const 56
          i32.add
          call $std::io::Write::write_fmt::h3862c0cb55a9e920
          local.get 5
          i32.load8_u offset=40
          local.get 5
          i32.load offset=44
          call $core::ptr::drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$::haebd22c8be51709e
          call $std::sys::wasi::abort_internal::h173ec7667b242253
          unreachable
        end
        local.get 8
        local.get 9
        call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
        unreachable
      end
      call $std::thread::ThreadId::new::exhausted::hff9eab39c7883b24
      unreachable
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=1052304
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      i32.const 68
      i32.add
      i64.const 0
      i64.store align=4
      local.get 5
      i32.const 1
      i32.store offset=60
      local.get 5
      i32.const 1050300
      i32.store offset=56
      local.get 5
      local.get 5
      i32.const 48
      i32.add
      i32.store offset=64
      local.get 5
      i32.const 20
      i32.add
      local.get 5
      i32.const 48
      i32.add
      local.get 5
      i32.const 56
      i32.add
      call $std::io::Write::write_fmt::h3862c0cb55a9e920
      local.get 5
      i32.load8_u offset=20
      local.get 5
      i32.load offset=24
      call $core::ptr::drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$::haebd22c8be51709e
      call $std::sys::wasi::abort_internal::h173ec7667b242253
      unreachable
    end
    i32.const 0
    local.get 10
    i32.store offset=1052304
    local.get 0
    local.get 1
    i32.const 20
    i32.add
    i32.load
    call_indirect (type 3)
    local.set 8
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=1052214
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 5
      i32.const 1
      i32.store8 offset=56
      local.get 5
      i32.const 56
      i32.add
      call $std::sys::wasi::once::Once::call::h3955b2b90402c29d
    end
    local.get 5
    i32.const 80
    i32.add
    global.set $__stack_pointer
    local.get 8)
  (func $std::io::Write::write_fmt::h3862c0cb55a9e920 (type 4) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 4
    i32.store8
    local.get 3
    local.get 1
    i32.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const 1049064
        local.get 2
        call $core::fmt::write::he742b579cc4461da
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.load8_u
          i32.const 4
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          i32.const 1049656
          i32.store offset=4
          local.get 0
          i32.const 2
          i32.store8
          br 2 (;@1;)
        end
        local.get 0
        local.get 3
        i64.load
        i64.store align=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 4
      i32.store8
      local.get 3
      i32.load offset=4
      local.set 1
      block  ;; label = @2
        local.get 3
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $std::sys::wasi::abort_internal::h173ec7667b242253 (type 0)
    call $abort
    unreachable)
  (func $std::env::current_dir::h8ceca78af9d4a06f (type 1) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    i32.load8_u offset=1052213
    drop
    i32.const 512
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 512
            i32.const 1
            call $__rust_alloc
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 512
            i32.store offset=8
            local.get 1
            local.get 3
            i32.store offset=4
            local.get 3
            i32.const 512
            call $getcwd
            br_if 1 (;@3;)
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1052816
                  local.tee 2
                  i32.const 68
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 512
                  local.set 2
                  br 1 (;@6;)
                end
                local.get 0
                i64.const 0
                i64.store align=4
                local.get 0
                i32.const 8
                i32.add
                local.get 2
                i32.store
                i32.const 512
                local.set 2
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 1
                local.get 2
                i32.store offset=12
                local.get 1
                i32.const 4
                i32.add
                local.get 2
                i32.const 1
                call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd
                local.get 1
                i32.load offset=4
                local.tee 3
                local.get 1
                i32.load offset=8
                local.tee 2
                call $getcwd
                br_if 3 (;@3;)
                i32.const 0
                i32.load offset=1052816
                local.tee 4
                i32.const 68
                i32.eq
                br_if 0 (;@6;)
              end
              local.get 0
              i64.const 0
              i64.store align=4
              local.get 0
              i32.const 8
              i32.add
              local.get 4
              i32.store
              local.get 2
              i32.eqz
              br_if 3 (;@2;)
            end
            local.get 3
            local.get 2
            i32.const 1
            call $__rust_dealloc
            br 2 (;@2;)
          end
          i32.const 1
          i32.const 512
          call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
          unreachable
        end
        local.get 1
        local.get 3
        call $strlen
        local.tee 4
        i32.store offset=12
        block  ;; label = @3
          local.get 2
          local.get 4
          i32.le_u
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 4
              br_if 0 (;@5;)
              i32.const 1
              local.set 5
              local.get 3
              local.get 2
              i32.const 1
              call $__rust_dealloc
              br 1 (;@4;)
            end
            local.get 3
            local.get 2
            i32.const 1
            local.get 4
            call $__rust_realloc
            local.tee 5
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 1
          local.get 4
          i32.store offset=8
          local.get 1
          local.get 5
          i32.store offset=4
        end
        local.get 0
        local.get 1
        i64.load offset=4 align=4
        i64.store align=4
        local.get 0
        i32.const 8
        i32.add
        local.get 1
        i32.const 4
        i32.add
        i32.const 8
        i32.add
        i32.load
        i32.store
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1
    local.get 4
    call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
    unreachable)
  (func $std::env::_var_os::h6b2c627c14d826bd (type 4) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 416
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 383
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const 20
            i32.add
            local.get 1
            local.get 2
            call $memcpy
            drop
            local.get 3
            i32.const 20
            i32.add
            local.get 2
            i32.add
            i32.const 0
            i32.store8
            i32.const 1
            local.set 1
            local.get 3
            i32.const 404
            i32.add
            local.get 3
            i32.const 20
            i32.add
            local.get 2
            i32.const 1
            i32.add
            call $core::ffi::c_str::CStr::from_bytes_with_nul::he6d3eb8b4b0547ea
            block  ;; label = @5
              local.get 3
              i32.load offset=404
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 3
                i32.load offset=408
                call $getenv
                local.tee 1
                br_if 0 (;@6;)
                i32.const 0
                local.set 1
                local.get 3
                i32.const 0
                i32.store offset=8
                br 5 (;@1;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  call $strlen
                  local.tee 2
                  br_if 0 (;@7;)
                  i32.const 1
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 2
                i32.const -1
                i32.le_s
                br_if 3 (;@3;)
                i32.const 0
                i32.load8_u offset=1052213
                drop
                local.get 2
                i32.const 1
                call $__rust_alloc
                local.tee 4
                i32.eqz
                br_if 4 (;@2;)
              end
              local.get 4
              local.get 1
              local.get 2
              call $memcpy
              local.set 1
              local.get 3
              i32.const 16
              i32.add
              local.get 2
              i32.store
              local.get 3
              i32.const 12
              i32.add
              local.get 2
              i32.store
              local.get 3
              local.get 1
              i32.store offset=8
              i32.const 0
              local.set 1
              br 4 (;@1;)
            end
            local.get 3
            i32.const 0
            i64.load offset=1050048
            i64.store offset=8 align=4
            br 3 (;@1;)
          end
          local.get 3
          i32.const 4
          i32.add
          local.get 1
          local.get 2
          call $std::sys::common::small_c_string::run_with_cstr_allocating::h4eb6038d28f59c9b
          local.get 3
          i32.load offset=4
          local.set 1
          br 2 (;@1;)
        end
        call $alloc::raw_vec::capacity_overflow::h504ef83d06198b94
        unreachable
      end
      i32.const 1
      local.get 2
      call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
      unreachable
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        i64.load offset=8 align=4
        i64.store align=4
        local.get 0
        i32.const 8
        i32.add
        local.get 3
        i32.const 16
        i32.add
        i32.load
        i32.store
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 3
        i32.load8_u offset=8
        i32.const 3
        i32.ne
        br_if 0 (;@2;)
        local.get 3
        i32.const 12
        i32.add
        i32.load
        local.tee 2
        i32.load
        local.tee 4
        local.get 2
        i32.const 4
        i32.add
        i32.load
        local.tee 1
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          local.get 1
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 2
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 0
      i32.const 0
      i32.store
    end
    local.get 3
    i32.const 416
    i32.add
    global.set $__stack_pointer)
  (func $std::sys::common::small_c_string::run_with_cstr_allocating::h4eb6038d28f59c9b (type 4) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    local.get 2
    call $_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$::spec_new_impl::haf5611f48815a534
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.load
            local.tee 2
            br_if 0 (;@4;)
            local.get 3
            i32.const 8
            i32.add
            i32.load
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                local.tee 1
                call $getenv
                local.tee 5
                br_if 0 (;@6;)
                local.get 0
                i32.const 0
                i32.store offset=4
                br 1 (;@5;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  call $strlen
                  local.tee 2
                  br_if 0 (;@7;)
                  i32.const 1
                  local.set 6
                  br 1 (;@6;)
                end
                local.get 2
                i32.const -1
                i32.le_s
                br_if 3 (;@3;)
                i32.const 0
                i32.load8_u offset=1052213
                drop
                local.get 2
                i32.const 1
                call $__rust_alloc
                local.tee 6
                i32.eqz
                br_if 4 (;@2;)
              end
              local.get 6
              local.get 5
              local.get 2
              call $memcpy
              local.set 5
              local.get 0
              i32.const 12
              i32.add
              local.get 2
              i32.store
              local.get 0
              i32.const 8
              i32.add
              local.get 2
              i32.store
              local.get 0
              local.get 5
              i32.store offset=4
            end
            local.get 1
            i32.const 0
            i32.store8
            local.get 0
            i32.const 0
            i32.store
            local.get 4
            i32.eqz
            br_if 3 (;@1;)
            local.get 1
            local.get 4
            i32.const 1
            call $__rust_dealloc
            br 3 (;@1;)
          end
          local.get 0
          i32.const 1
          i32.store
          local.get 0
          i32.const 0
          i64.load offset=1050048
          i64.store offset=4 align=4
          local.get 3
          i32.load offset=4
          local.tee 0
          i32.eqz
          br_if 2 (;@1;)
          local.get 2
          local.get 0
          i32.const 1
          call $__rust_dealloc
          br 2 (;@1;)
        end
        call $alloc::raw_vec::capacity_overflow::h504ef83d06198b94
        unreachable
      end
      i32.const 1
      local.get 2
      call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
      unreachable
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $std::io::impls::_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$::write::hbc834fce95ba6f38 (type 9) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      local.get 1
      i32.load offset=8
      local.tee 4
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 1
      local.get 4
      local.get 3
      call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd
      local.get 1
      i32.load offset=8
      local.set 4
    end
    local.get 1
    i32.load
    local.get 4
    i32.add
    local.get 2
    local.get 3
    call $memcpy
    drop
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 4
    local.get 3
    i32.add
    i32.store offset=8
    local.get 0
    i32.const 4
    i32.store8)
  (func $std::io::impls::_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$::write_vectored::hc5314be1b0b8188a (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.const 3
      i32.and
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 4
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          i32.const 0
          local.set 6
          br 1 (;@2;)
        end
        local.get 2
        i32.const 28
        i32.add
        local.set 7
        local.get 3
        i32.const -4
        i32.and
        local.set 8
        i32.const 0
        local.set 4
        i32.const 0
        local.set 6
        loop  ;; label = @3
          local.get 7
          i32.load
          local.get 7
          i32.const -8
          i32.add
          i32.load
          local.get 7
          i32.const -16
          i32.add
          i32.load
          local.get 7
          i32.const -24
          i32.add
          i32.load
          local.get 4
          i32.add
          i32.add
          i32.add
          i32.add
          local.set 4
          local.get 7
          i32.const 32
          i32.add
          local.set 7
          local.get 8
          local.get 6
          i32.const 4
          i32.add
          local.tee 6
          i32.ne
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.const 3
        i32.shl
        local.get 2
        i32.add
        i32.const 4
        i32.add
        local.set 7
        loop  ;; label = @3
          local.get 7
          i32.load
          local.get 4
          i32.add
          local.set 4
          local.get 7
          i32.const 8
          i32.add
          local.set 7
          local.get 5
          i32.const -1
          i32.add
          local.tee 5
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        local.get 1
        i32.load offset=8
        local.tee 7
        i32.sub
        local.get 4
        i32.ge_u
        br_if 0 (;@2;)
        local.get 1
        local.get 7
        local.get 4
        call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd
      end
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 3
      i32.const 3
      i32.shl
      i32.add
      local.set 8
      local.get 1
      i32.load offset=8
      local.set 7
      loop  ;; label = @2
        local.get 2
        i32.load
        local.set 6
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.get 7
          i32.sub
          local.get 2
          i32.const 4
          i32.add
          i32.load
          local.tee 5
          i32.ge_u
          br_if 0 (;@3;)
          local.get 1
          local.get 7
          local.get 5
          call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd
          local.get 1
          i32.load offset=8
          local.set 7
        end
        local.get 1
        i32.load
        local.get 7
        i32.add
        local.get 6
        local.get 5
        call $memcpy
        drop
        local.get 1
        local.get 7
        local.get 5
        i32.add
        local.tee 7
        i32.store offset=8
        local.get 2
        i32.const 8
        i32.add
        local.tee 2
        local.get 8
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0
    i32.const 4
    i32.store8
    local.get 0
    local.get 4
    i32.store offset=4)
  (func $std::io::impls::_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$::is_write_vectored::h5c6f08d3987e141a (type 3) (param i32) (result i32)
    i32.const 1)
  (func $std::io::impls::_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$::write_all::ha97b7046e137b85f (type 9) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      local.get 1
      i32.load offset=8
      local.tee 4
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 1
      local.get 4
      local.get 3
      call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd
      local.get 1
      i32.load offset=8
      local.set 4
    end
    local.get 1
    i32.load
    local.get 4
    i32.add
    local.get 2
    local.get 3
    call $memcpy
    drop
    local.get 0
    i32.const 4
    i32.store8
    local.get 1
    local.get 4
    local.get 3
    i32.add
    i32.store offset=8)
  (func $std::io::impls::_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$::flush::habcfd84f08fc16a7 (type 2) (param i32 i32)
    local.get 0
    i32.const 4
    i32.store8)
  (func $std::io::Write::write_all_vectored::h79d316cfae4f469a (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.const 4
              i32.add
              local.set 5
              local.get 3
              i32.const 3
              i32.shl
              local.set 6
              local.get 3
              i32.const -1
              i32.add
              i32.const 536870911
              i32.and
              i32.const 1
              i32.add
              local.set 7
              i32.const 0
              local.set 8
              i32.const 0
              local.set 9
              block  ;; label = @6
                loop  ;; label = @7
                  local.get 9
                  local.get 5
                  i32.load
                  local.tee 10
                  i32.lt_u
                  br_if 1 (;@6;)
                  local.get 5
                  i32.const 8
                  i32.add
                  local.set 5
                  local.get 8
                  i32.const 1
                  i32.add
                  local.set 8
                  local.get 9
                  local.get 10
                  i32.sub
                  local.set 9
                  local.get 6
                  i32.const -8
                  i32.add
                  local.tee 6
                  br_if 0 (;@7;)
                end
                local.get 7
                local.set 8
              end
              local.get 3
              local.get 8
              i32.lt_u
              br_if 3 (;@2;)
              local.get 2
              local.get 8
              i32.const 3
              i32.shl
              local.tee 5
              i32.add
              local.set 7
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  local.get 8
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 9
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 4
                  i32.const 20
                  i32.add
                  i64.const 0
                  i64.store align=4
                  local.get 4
                  i32.const 1
                  i32.store offset=12
                  local.get 4
                  i32.const 1049468
                  i32.store offset=8
                  local.get 4
                  i32.const 1048620
                  i32.store offset=16
                  local.get 4
                  i32.const 8
                  i32.add
                  i32.const 1049476
                  call $core::panicking::panic_fmt::h5318dfeccdd30466
                  unreachable
                end
                local.get 2
                local.get 5
                i32.add
                local.tee 5
                i32.load offset=4
                local.tee 6
                local.get 9
                i32.lt_u
                br_if 3 (;@3;)
                local.get 5
                i32.const 4
                i32.add
                local.get 6
                local.get 9
                i32.sub
                i32.store
                local.get 7
                local.get 7
                i32.load
                local.get 9
                i32.add
                i32.store
              end
              local.get 3
              local.get 8
              i32.sub
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              loop  ;; label = @6
                local.get 4
                i32.const 8
                i32.add
                i32.const 2
                local.get 7
                local.get 3
                call $wasi::lib_generated::fd_write::h41f6a0177730a9fb
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 4
                      i32.load16_u offset=8
                      br_if 0 (;@9;)
                      block  ;; label = @10
                        local.get 4
                        i32.load offset=12
                        local.tee 9
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 1049612
                        i32.store offset=4
                        local.get 0
                        i32.const 2
                        i32.store8
                        br 9 (;@1;)
                      end
                      local.get 7
                      i32.const 4
                      i32.add
                      local.set 5
                      local.get 3
                      i32.const 3
                      i32.shl
                      local.set 6
                      local.get 3
                      i32.const -1
                      i32.add
                      i32.const 536870911
                      i32.and
                      i32.const 1
                      i32.add
                      local.set 2
                      i32.const 0
                      local.set 8
                      loop  ;; label = @10
                        local.get 9
                        local.get 5
                        i32.load
                        local.tee 10
                        i32.lt_u
                        br_if 2 (;@8;)
                        local.get 5
                        i32.const 8
                        i32.add
                        local.set 5
                        local.get 8
                        i32.const 1
                        i32.add
                        local.set 8
                        local.get 9
                        local.get 10
                        i32.sub
                        local.set 9
                        local.get 6
                        i32.const -8
                        i32.add
                        local.tee 6
                        br_if 0 (;@10;)
                      end
                      local.get 2
                      local.set 8
                      br 1 (;@8;)
                    end
                    local.get 4
                    i32.load16_u offset=10
                    local.tee 9
                    i32.const 27
                    i32.eq
                    br_if 1 (;@7;)
                    local.get 0
                    local.get 9
                    i32.store offset=4
                    local.get 0
                    i32.const 0
                    i32.store
                    br 7 (;@1;)
                  end
                  local.get 3
                  local.get 8
                  i32.lt_u
                  br_if 3 (;@4;)
                  local.get 3
                  local.get 8
                  i32.sub
                  local.set 6
                  local.get 7
                  local.get 8
                  i32.const 3
                  i32.shl
                  local.tee 10
                  i32.add
                  local.set 5
                  block  ;; label = @8
                    local.get 3
                    local.get 8
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 5
                    local.set 7
                    local.get 6
                    local.set 3
                    local.get 9
                    i32.eqz
                    br_if 1 (;@7;)
                    local.get 4
                    i32.const 20
                    i32.add
                    i64.const 0
                    i64.store align=4
                    local.get 4
                    i32.const 1
                    i32.store offset=12
                    local.get 4
                    i32.const 1049468
                    i32.store offset=8
                    local.get 4
                    i32.const 1048620
                    i32.store offset=16
                    local.get 4
                    i32.const 8
                    i32.add
                    i32.const 1049476
                    call $core::panicking::panic_fmt::h5318dfeccdd30466
                    unreachable
                  end
                  block  ;; label = @8
                    local.get 7
                    local.get 10
                    i32.add
                    local.tee 8
                    i32.load offset=4
                    local.tee 10
                    local.get 9
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 8
                    i32.const 4
                    i32.add
                    local.get 10
                    local.get 9
                    i32.sub
                    i32.store
                    local.get 5
                    local.get 5
                    i32.load
                    local.get 9
                    i32.add
                    i32.store
                    local.get 5
                    local.set 7
                    local.get 6
                    local.set 3
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.const 20
                  i32.add
                  i64.const 0
                  i64.store align=4
                  local.get 4
                  i32.const 1
                  i32.store offset=12
                  local.get 4
                  i32.const 1049528
                  i32.store offset=8
                  local.get 4
                  i32.const 1048620
                  i32.store offset=16
                  local.get 4
                  i32.const 8
                  i32.add
                  i32.const 1049568
                  call $core::panicking::panic_fmt::h5318dfeccdd30466
                  unreachable
                end
                local.get 3
                br_if 0 (;@6;)
              end
            end
            local.get 0
            i32.const 4
            i32.store8
            br 3 (;@1;)
          end
          local.get 8
          local.get 3
          i32.const 1049412
          call $core::slice::index::slice_start_index_len_fail::hfb1719074a270fbd
          unreachable
        end
        local.get 4
        i32.const 20
        i32.add
        i64.const 0
        i64.store align=4
        local.get 4
        i32.const 1
        i32.store offset=12
        local.get 4
        i32.const 1049528
        i32.store offset=8
        local.get 4
        i32.const 1048620
        i32.store offset=16
        local.get 4
        i32.const 8
        i32.add
        i32.const 1049568
        call $core::panicking::panic_fmt::h5318dfeccdd30466
        unreachable
      end
      local.get 8
      local.get 3
      i32.const 1049412
      call $core::slice::index::slice_start_index_len_fail::hfb1719074a270fbd
      unreachable
    end
    local.get 4
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $std::io::Write::write_all::h7f34d387562b9235 (type 9) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 4
              local.get 3
              i32.store offset=4
              local.get 4
              local.get 2
              i32.store
              local.get 4
              i32.const 8
              i32.add
              i32.const 2
              local.get 4
              i32.const 1
              call $wasi::lib_generated::fd_write::h41f6a0177730a9fb
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.load16_u offset=8
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 4
                    i32.load offset=12
                    local.tee 5
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 1049612
                    i32.store offset=4
                    local.get 0
                    i32.const 2
                    i32.store8
                    br 7 (;@1;)
                  end
                  local.get 3
                  local.get 5
                  i32.lt_u
                  br_if 4 (;@3;)
                  local.get 2
                  local.get 5
                  i32.add
                  local.set 2
                  local.get 3
                  local.get 5
                  i32.sub
                  local.set 3
                  br 1 (;@6;)
                end
                local.get 4
                i32.load16_u offset=10
                local.tee 5
                i32.const 27
                i32.ne
                br_if 4 (;@2;)
              end
              local.get 3
              br_if 0 (;@5;)
            end
          end
          local.get 0
          i32.const 4
          i32.store8
          br 2 (;@1;)
        end
        local.get 5
        local.get 3
        i32.const 1049624
        call $core::slice::index::slice_start_index_len_fail::hfb1719074a270fbd
        unreachable
      end
      local.get 0
      local.get 5
      i32.store offset=4
      local.get 0
      i32.const 0
      i32.store
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $std::io::Write::write_all_vectored::h9d926dc1a80a6b06 (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                i32.const 4
                i32.add
                local.set 5
                local.get 3
                i32.const 3
                i32.shl
                local.set 6
                local.get 3
                i32.const -1
                i32.add
                i32.const 536870911
                i32.and
                i32.const 1
                i32.add
                local.set 7
                i32.const 0
                local.set 8
                i32.const 0
                local.set 9
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 9
                    local.get 5
                    i32.load
                    local.tee 10
                    i32.lt_u
                    br_if 1 (;@7;)
                    local.get 5
                    i32.const 8
                    i32.add
                    local.set 5
                    local.get 8
                    i32.const 1
                    i32.add
                    local.set 8
                    local.get 9
                    local.get 10
                    i32.sub
                    local.set 9
                    local.get 6
                    i32.const -8
                    i32.add
                    local.tee 6
                    br_if 0 (;@8;)
                  end
                  local.get 7
                  local.set 8
                end
                local.get 3
                local.get 8
                i32.lt_u
                br_if 4 (;@2;)
                local.get 2
                local.get 8
                i32.const 3
                i32.shl
                local.tee 5
                i32.add
                local.set 11
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 3
                    local.get 8
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 9
                    i32.eqz
                    br_if 1 (;@7;)
                    local.get 4
                    i32.const 20
                    i32.add
                    i64.const 0
                    i64.store align=4
                    local.get 4
                    i32.const 1
                    i32.store offset=12
                    local.get 4
                    i32.const 1049468
                    i32.store offset=8
                    local.get 4
                    i32.const 1048620
                    i32.store offset=16
                    local.get 4
                    i32.const 8
                    i32.add
                    i32.const 1049476
                    call $core::panicking::panic_fmt::h5318dfeccdd30466
                    unreachable
                  end
                  local.get 2
                  local.get 5
                  i32.add
                  local.tee 5
                  i32.load offset=4
                  local.tee 6
                  local.get 9
                  i32.lt_u
                  br_if 4 (;@3;)
                  local.get 5
                  i32.const 4
                  i32.add
                  local.get 6
                  local.get 9
                  i32.sub
                  i32.store
                  local.get 11
                  local.get 11
                  i32.load
                  local.get 9
                  i32.add
                  i32.store
                end
                local.get 3
                local.get 8
                i32.sub
                local.tee 7
                i32.eqz
                br_if 0 (;@6;)
                loop  ;; label = @7
                  i32.const 0
                  local.set 8
                  i32.const 0
                  local.set 6
                  block  ;; label = @8
                    local.get 7
                    i32.const -1
                    i32.add
                    local.tee 12
                    i32.const 3
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 11
                    i32.const 28
                    i32.add
                    local.set 9
                    local.get 7
                    i32.const -4
                    i32.and
                    local.set 5
                    i32.const 0
                    local.set 8
                    i32.const 0
                    local.set 6
                    loop  ;; label = @9
                      local.get 9
                      i32.load
                      local.get 9
                      i32.const -8
                      i32.add
                      i32.load
                      local.get 9
                      i32.const -16
                      i32.add
                      i32.load
                      local.get 9
                      i32.const -24
                      i32.add
                      i32.load
                      local.get 8
                      i32.add
                      i32.add
                      i32.add
                      i32.add
                      local.set 8
                      local.get 9
                      i32.const 32
                      i32.add
                      local.set 9
                      local.get 5
                      local.get 6
                      i32.const 4
                      i32.add
                      local.tee 6
                      i32.ne
                      br_if 0 (;@9;)
                    end
                  end
                  block  ;; label = @8
                    local.get 7
                    i32.const 3
                    i32.and
                    local.tee 5
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 11
                    local.get 6
                    i32.const 3
                    i32.shl
                    i32.add
                    i32.const 4
                    i32.add
                    local.set 9
                    loop  ;; label = @9
                      local.get 9
                      i32.load
                      local.get 8
                      i32.add
                      local.set 8
                      local.get 9
                      i32.const 8
                      i32.add
                      local.set 9
                      local.get 5
                      i32.const -1
                      i32.add
                      local.tee 5
                      br_if 0 (;@9;)
                    end
                  end
                  block  ;; label = @8
                    local.get 1
                    i32.load offset=4
                    local.get 1
                    i32.load offset=8
                    local.tee 9
                    i32.sub
                    local.get 8
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 1
                    local.get 9
                    local.get 8
                    call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd
                    local.get 1
                    i32.load offset=8
                    local.set 9
                  end
                  local.get 11
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.tee 2
                  i32.add
                  local.set 3
                  local.get 11
                  local.set 5
                  loop  ;; label = @8
                    local.get 5
                    i32.load
                    local.set 10
                    block  ;; label = @9
                      local.get 1
                      i32.load offset=4
                      local.get 9
                      i32.sub
                      local.get 5
                      i32.const 4
                      i32.add
                      i32.load
                      local.tee 6
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 1
                      local.get 9
                      local.get 6
                      call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd
                      local.get 1
                      i32.load offset=8
                      local.set 9
                    end
                    local.get 1
                    i32.load
                    local.get 9
                    i32.add
                    local.get 10
                    local.get 6
                    call $memcpy
                    drop
                    local.get 1
                    local.get 9
                    local.get 6
                    i32.add
                    local.tee 9
                    i32.store offset=8
                    local.get 5
                    i32.const 8
                    i32.add
                    local.tee 5
                    local.get 3
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  block  ;; label = @8
                    local.get 8
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 1049612
                    i32.store offset=4
                    local.get 0
                    i32.const 2
                    i32.store8
                    br 7 (;@1;)
                  end
                  local.get 11
                  i32.const 4
                  i32.add
                  local.set 9
                  local.get 12
                  i32.const 536870911
                  i32.and
                  i32.const 1
                  i32.add
                  local.set 10
                  i32.const 0
                  local.set 5
                  block  ;; label = @8
                    loop  ;; label = @9
                      local.get 8
                      local.get 9
                      i32.load
                      local.tee 6
                      i32.lt_u
                      br_if 1 (;@8;)
                      local.get 9
                      i32.const 8
                      i32.add
                      local.set 9
                      local.get 5
                      i32.const 1
                      i32.add
                      local.set 5
                      local.get 8
                      local.get 6
                      i32.sub
                      local.set 8
                      local.get 2
                      i32.const -8
                      i32.add
                      local.tee 2
                      br_if 0 (;@9;)
                    end
                    local.get 10
                    local.set 5
                  end
                  local.get 7
                  local.get 5
                  i32.lt_u
                  br_if 2 (;@5;)
                  local.get 11
                  local.get 5
                  i32.const 3
                  i32.shl
                  local.tee 6
                  i32.add
                  local.set 9
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 7
                      local.get 5
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 8
                      i32.eqz
                      br_if 1 (;@8;)
                      local.get 4
                      i32.const 20
                      i32.add
                      i64.const 0
                      i64.store align=4
                      local.get 4
                      i32.const 1
                      i32.store offset=12
                      local.get 4
                      i32.const 1049468
                      i32.store offset=8
                      local.get 4
                      i32.const 1048620
                      i32.store offset=16
                      local.get 4
                      i32.const 8
                      i32.add
                      i32.const 1049476
                      call $core::panicking::panic_fmt::h5318dfeccdd30466
                      unreachable
                    end
                    local.get 11
                    local.get 6
                    i32.add
                    local.tee 6
                    i32.load offset=4
                    local.tee 10
                    local.get 8
                    i32.lt_u
                    br_if 4 (;@4;)
                    local.get 6
                    i32.const 4
                    i32.add
                    local.get 10
                    local.get 8
                    i32.sub
                    i32.store
                    local.get 9
                    local.get 9
                    i32.load
                    local.get 8
                    i32.add
                    i32.store
                  end
                  local.get 9
                  local.set 11
                  local.get 7
                  local.get 5
                  i32.sub
                  local.tee 7
                  br_if 0 (;@7;)
                end
              end
              local.get 0
              i32.const 4
              i32.store8
              br 4 (;@1;)
            end
            local.get 5
            local.get 7
            i32.const 1049412
            call $core::slice::index::slice_start_index_len_fail::hfb1719074a270fbd
            unreachable
          end
          local.get 4
          i32.const 20
          i32.add
          i64.const 0
          i64.store align=4
          local.get 4
          i32.const 1
          i32.store offset=12
          local.get 4
          i32.const 1049528
          i32.store offset=8
          local.get 4
          i32.const 1048620
          i32.store offset=16
          local.get 4
          i32.const 8
          i32.add
          i32.const 1049568
          call $core::panicking::panic_fmt::h5318dfeccdd30466
          unreachable
        end
        local.get 4
        i32.const 20
        i32.add
        i64.const 0
        i64.store align=4
        local.get 4
        i32.const 1
        i32.store offset=12
        local.get 4
        i32.const 1049528
        i32.store offset=8
        local.get 4
        i32.const 1048620
        i32.store offset=16
        local.get 4
        i32.const 8
        i32.add
        i32.const 1049568
        call $core::panicking::panic_fmt::h5318dfeccdd30466
        unreachable
      end
      local.get 8
      local.get 3
      i32.const 1049412
      call $core::slice::index::slice_start_index_len_fail::hfb1719074a270fbd
      unreachable
    end
    local.get 4
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $std::io::Write::write_fmt::ha48c60d67e874ccc (type 4) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 4
    i32.store8
    local.get 3
    local.get 1
    i32.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const 1049040
        local.get 2
        call $core::fmt::write::he742b579cc4461da
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.load8_u
          i32.const 4
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          i32.const 1049656
          i32.store offset=4
          local.get 0
          i32.const 2
          i32.store8
          br 2 (;@1;)
        end
        local.get 0
        local.get 3
        i64.load
        i64.store align=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 4
      i32.store8
      local.get 3
      i32.load offset=4
      local.set 1
      block  ;; label = @2
        local.get 3
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$::write_str::h55d1142903433de9 (type 5) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve::do_reserve_and_handle::hf9034a2fb0def3fd
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load
    local.get 3
    i32.add
    local.get 1
    local.get 2
    call $memcpy
    drop
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $std::panic::get_backtrace_style::hd88fb9ea4d232974 (type 8) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1052252
              br_table 3 (;@2;) 4 (;@1;) 2 (;@3;) 1 (;@4;) 0 (;@5;)
            end
            i32.const 1048803
            i32.const 40
            i32.const 1049692
            call $core::panicking::panic::h9910a7377b663c09
            unreachable
          end
          i32.const 2
          local.set 1
          br 2 (;@1;)
        end
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      i32.const 4
      i32.add
      i32.const 1049316
      i32.const 14
      call $std::env::_var_os::h6b2c627c14d826bd
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          local.get 0
          i32.load offset=8
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=12
                i32.const -1
                i32.add
                br_table 0 (;@6;) 2 (;@4;) 2 (;@4;) 1 (;@5;) 2 (;@4;)
              end
              local.get 2
              i32.load8_u
              i32.const 48
              i32.eq
              i32.const 1
              i32.shl
              local.set 1
              br 1 (;@4;)
            end
            local.get 2
            i32.const 1049708
            i32.const 4
            call $memcmp
            i32.eqz
            local.set 1
          end
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            i32.const 1
            call $__rust_dealloc
          end
          local.get 1
          i32.const 1
          i32.add
          local.set 2
          br 1 (;@2;)
        end
        i32.const 3
        local.set 2
        i32.const 2
        local.set 1
      end
      i32.const 0
      local.get 2
      i32.store offset=1052252
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $std::process::abort::ha5f94cae24ca7d6d (type 0)
    call $std::sys::wasi::abort_internal::h173ec7667b242253
    unreachable)
  (func $std::sync::once_lock::OnceLock$LT$T$GT$::initialize::h06e53343fecb2fd4 (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=1052248
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      i32.const 1052216
      i32.store offset=4
      local.get 1
      local.get 0
      i32.store
      local.get 1
      local.get 1
      i32.const 15
      i32.add
      i32.store offset=8
      local.get 1
      call $std::sys::wasi::once::Once::call::hc2bea12fcf343d70
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $std::sys::wasi::once::Once::call::hc2bea12fcf343d70 (type 1) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load8_u offset=1052248
            local.tee 2
            i32.const 2
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const -2
            i32.add
            br_table 3 (;@1;) 1 (;@3;) 3 (;@1;)
          end
          i32.const 0
          i32.const 2
          i32.store8 offset=1052248
          local.get 0
          i32.load
          local.set 2
          local.get 0
          i32.const 0
          i32.store
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=4
          local.set 0
          local.get 2
          i32.const 1
          i32.store8
          local.get 0
          i64.const 0
          i64.store offset=16 align=4
          local.get 0
          i64.const 4294967296
          i64.store offset=8 align=4
          local.get 0
          i64.const 0
          i64.store align=4
          local.get 0
          i32.const 24
          i32.add
          i32.const 0
          i32.store8
          local.get 0
          i32.const 0
          i32.store8 offset=28
          i32.const 0
          i32.const 3
          i32.store8 offset=1052248
        end
        local.get 1
        i32.const 32
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 1048760
      i32.const 43
      i32.const 1049884
      call $core::panicking::panic::h9910a7377b663c09
      unreachable
    end
    local.get 1
    i32.const 20
    i32.add
    i64.const 0
    i64.store align=4
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1051232
    i32.store offset=8
    local.get 1
    i32.const 1048620
    i32.store offset=16
    local.get 1
    i32.const 8
    i32.add
    i32.const 1049868
    call $core::panicking::panic_fmt::h5318dfeccdd30466
    unreachable)
  (func $std::sys_common::backtrace::print::h6f13639632200fc1 (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    i32.const 0
    i32.load8_u offset=1052256
    local.set 5
    i32.const 1
    local.set 6
    i32.const 0
    i32.const 1
    i32.store8 offset=1052256
    local.get 4
    local.get 5
    i32.store8 offset=36
    block  ;; label = @1
      local.get 5
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=1052280
        i32.const 2147483647
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        call $std::panicking::panic_count::is_zero_slow_path::h2f06658ce40047a2
        local.set 6
      end
      local.get 2
      i32.const 36
      i32.add
      i32.load
      local.set 5
      local.get 4
      i32.const 24
      i32.add
      i64.const 1
      i64.store align=4
      local.get 4
      i32.const 1
      i32.store offset=16
      local.get 4
      i32.const 1049332
      i32.store offset=12
      local.get 4
      i32.const 6
      i32.store offset=40
      local.get 4
      local.get 3
      i32.store8 offset=47
      local.get 4
      local.get 4
      i32.const 36
      i32.add
      i32.store offset=20
      local.get 4
      local.get 4
      i32.const 47
      i32.add
      i32.store offset=36
      local.get 0
      local.get 1
      local.get 4
      i32.const 12
      i32.add
      local.get 5
      call_indirect (type 4)
      block  ;; label = @2
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=1052280
        i32.const 2147483647
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        call $std::panicking::panic_count::is_zero_slow_path::h2f06658ce40047a2
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store8 offset=1052257
      end
      i32.const 0
      i32.const 0
      i32.store8 offset=1052256
      local.get 4
      i32.const 48
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 4
    i64.const 0
    i64.store offset=24 align=4
    local.get 4
    i32.const 1048620
    i32.store offset=20
    local.get 4
    i32.const 1
    i32.store offset=16
    local.get 4
    i32.const 1049744
    i32.store offset=12
    local.get 4
    i32.const 36
    i32.add
    local.get 4
    i32.const 12
    i32.add
    call $core::panicking::assert_failed::ha618ecf66c52be40
    unreachable)
  (func $_$LT$std..sys_common..backtrace.._print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$::fmt::h904749c5f1a60b7d (type 6) (param i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load8_u
    local.set 3
    local.get 2
    i32.const 8
    i32.add
    call $std::env::current_dir::h8ceca78af9d4a06f
    local.get 2
    i64.load offset=12 align=4
    local.set 4
    block  ;; label = @1
      local.get 2
      i32.load offset=8
      local.tee 0
      br_if 0 (;@1;)
      local.get 4
      i64.const 255
      i64.and
      i64.const 3
      i64.ne
      br_if 0 (;@1;)
      local.get 4
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      local.tee 5
      i32.load
      local.tee 6
      local.get 5
      i32.const 4
      i32.add
      i32.load
      local.tee 7
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 7
        i32.load offset=4
        local.tee 8
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        local.get 8
        local.get 7
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 5
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 2
    i32.const 20
    i32.add
    i64.const 0
    i64.store align=4
    i32.const 1
    local.set 5
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    i32.const 1050076
    i32.store offset=8
    local.get 2
    i32.const 1048620
    i32.store offset=16
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          local.get 2
          i32.const 8
          i32.add
          call $core::fmt::Formatter::write_fmt::hdf1a415742e2a22b
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 3
            i32.const 255
            i32.and
            br_if 0 (;@4;)
            local.get 2
            i32.const 20
            i32.add
            i64.const 0
            i64.store align=4
            local.get 2
            i32.const 1
            i32.store offset=12
            local.get 2
            i32.const 1050172
            i32.store offset=8
            local.get 2
            i32.const 1048620
            i32.store offset=16
            local.get 1
            local.get 2
            i32.const 8
            i32.add
            call $core::fmt::Formatter::write_fmt::hdf1a415742e2a22b
            br_if 1 (;@3;)
          end
          i32.const 0
          local.set 5
          local.get 0
          i32.eqz
          br_if 2 (;@1;)
          br 1 (;@2;)
        end
        local.get 0
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 4
      i32.wrap_i64
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 5)
  (func $std::sys_common::backtrace::__rust_end_short_backtrace::h874d7060d440a668 (type 1) (param i32)
    local.get 0
    call $std::panicking::begin_panic_handler::_$u7b$$u7b$closure$u7d$$u7d$::h4912f9b049c76c0a
    unreachable)
  (func $std::panicking::begin_panic_handler::_$u7b$$u7b$closure$u7d$$u7d$::h4912f9b049c76c0a (type 1) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 2
    i32.const 12
    i32.add
    i32.load
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load offset=4
            br_table 0 (;@4;) 1 (;@3;) 3 (;@1;)
          end
          local.get 3
          br_if 2 (;@1;)
          i32.const 1048620
          local.set 2
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 3
        br_if 1 (;@1;)
        local.get 2
        i32.load
        local.tee 2
        i32.load offset=4
        local.set 3
        local.get 2
        i32.load
        local.set 2
      end
      local.get 1
      local.get 3
      i32.store offset=4
      local.get 1
      local.get 2
      i32.store
      local.get 1
      i32.const 1050756
      local.get 0
      i32.load offset=4
      local.tee 2
      i32.load offset=8
      local.get 0
      i32.load offset=8
      local.get 2
      i32.load8_u offset=16
      local.get 2
      i32.load8_u offset=17
      call $std::panicking::rust_panic_with_hook::h9180c29a90b6450d
      unreachable
    end
    local.get 1
    i32.const 0
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store
    local.get 1
    i32.const 1050776
    local.get 0
    i32.load offset=4
    local.tee 2
    i32.load offset=8
    local.get 0
    i32.load offset=8
    local.get 2
    i32.load8_u offset=16
    local.get 2
    i32.load8_u offset=17
    call $std::panicking::rust_panic_with_hook::h9180c29a90b6450d
    unreachable)
  (func $std::alloc::default_alloc_error_hook::hc15ad6b0c6c51483 (type 2) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=1052212
      br_if 0 (;@1;)
      local.get 2
      i32.const 24
      i32.add
      i64.const 1
      i64.store align=4
      local.get 2
      i32.const 2
      i32.store offset=16
      local.get 2
      i32.const 1050344
      i32.store offset=12
      local.get 2
      i32.const 7
      i32.store offset=40
      local.get 2
      local.get 1
      i32.store offset=44
      local.get 2
      local.get 2
      i32.const 36
      i32.add
      i32.store offset=20
      local.get 2
      local.get 2
      i32.const 44
      i32.add
      i32.store offset=36
      local.get 2
      i32.const 4
      i32.store8 offset=48
      local.get 2
      local.get 2
      i32.const 63
      i32.add
      i32.store offset=56
      local.get 2
      i32.const 48
      i32.add
      i32.const 1049064
      local.get 2
      i32.const 12
      i32.add
      call $core::fmt::write::he742b579cc4461da
      local.set 3
      local.get 2
      i32.load8_u offset=48
      local.set 1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 4
          i32.eq
          br_if 1 (;@2;)
          local.get 2
          i32.load offset=52
          local.set 3
          block  ;; label = @4
            local.get 2
            i32.load8_u offset=48
            local.tee 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 2 (;@2;)
          end
          local.get 3
          i32.load
          local.tee 4
          local.get 3
          i32.const 4
          i32.add
          i32.load
          local.tee 1
          i32.load
          call_indirect (type 1)
          block  ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            local.get 1
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 3
          i32.const 12
          i32.const 4
          call $__rust_dealloc
          br 1 (;@2;)
        end
        local.get 2
        i32.load offset=52
        local.set 3
        block  ;; label = @3
          local.get 1
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 3
        i32.load
        local.tee 4
        local.get 3
        i32.const 4
        i32.add
        i32.load
        local.tee 1
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          local.get 1
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 3
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 2
      i32.const 64
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 2
    i32.const 24
    i32.add
    i64.const 1
    i64.store align=4
    local.get 2
    i32.const 2
    i32.store offset=16
    local.get 2
    i32.const 1050376
    i32.store offset=12
    local.get 2
    i32.const 7
    i32.store offset=52
    local.get 2
    local.get 1
    i32.store offset=36
    local.get 2
    local.get 2
    i32.const 48
    i32.add
    i32.store offset=20
    local.get 2
    local.get 2
    i32.const 36
    i32.add
    i32.store offset=48
    local.get 2
    i32.const 12
    i32.add
    i32.const 1050416
    call $core::panicking::panic_fmt::h5318dfeccdd30466
    unreachable)
  (func $__rdl_alloc (type 6) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 8
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        i32.le_u
        br_if 1 (;@1;)
      end
      local.get 1
      local.get 1
      local.get 0
      local.get 1
      i32.rem_u
      local.tee 2
      i32.sub
      i32.const 0
      local.get 2
      select
      local.get 0
      i32.add
      call $aligned_alloc
      return
    end
    local.get 0
    call $malloc)
  (func $__rdl_dealloc (type 4) (param i32 i32 i32)
    local.get 0
    call $free)
  (func $__rdl_realloc (type 7) (param i32 i32 i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 8
          i32.gt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.le_u
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 4
        local.get 2
        local.get 2
        local.get 3
        local.get 2
        i32.rem_u
        local.tee 5
        i32.sub
        i32.const 0
        local.get 5
        select
        local.get 3
        i32.add
        call $aligned_alloc
        local.tee 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        local.get 1
        local.get 3
        local.get 1
        local.get 3
        i32.lt_u
        select
        call $memcpy
        local.set 2
        local.get 0
        call $free
        local.get 2
        return
      end
      local.get 0
      local.get 3
      call $realloc
      local.set 4
    end
    local.get 4)
  (func $std::panicking::default_hook::_$u7b$$u7b$closure$u7d$$u7d$::h419c149e05a30ae3 (type 4) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 16
    i32.add
    i32.const 12
    i32.add
    i64.const 3
    i64.store align=4
    local.get 3
    i32.const 60
    i32.add
    i32.const 8
    i32.store
    local.get 3
    i32.const 40
    i32.add
    i32.const 12
    i32.add
    i32.const 9
    i32.store
    local.get 3
    i32.const 1050588
    i32.store offset=16
    local.get 3
    i32.const 8
    i32.store offset=44
    local.get 3
    local.get 0
    i32.load offset=8
    i32.store offset=56
    local.get 3
    local.get 0
    i32.load offset=4
    i32.store offset=48
    local.get 3
    local.get 0
    i32.load
    i32.store offset=40
    local.get 3
    local.get 3
    i32.const 40
    i32.add
    i32.store offset=24
    local.get 3
    i32.const 4
    i32.store offset=20
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    local.get 3
    i32.const 16
    i32.add
    local.get 2
    i32.load offset=36
    local.tee 4
    call_indirect (type 4)
    local.get 3
    i32.load offset=12
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.load8_u offset=8
        local.tee 6
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 6
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 5
      i32.load
      local.tee 7
      local.get 5
      i32.const 4
      i32.add
      i32.load
      local.tee 6
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 6
        i32.load offset=4
        local.tee 8
        i32.eqz
        br_if 0 (;@2;)
        local.get 7
        local.get 8
        local.get 6
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 5
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=12
      i32.load8_u
      local.tee 0
      i32.const 3
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;) 0 (;@4;)
          end
          local.get 3
          i32.const 40
          i32.add
          local.get 1
          local.get 2
          i32.const 0
          call $std::sys_common::backtrace::print::h6f13639632200fc1
          local.get 3
          i32.load offset=44
          local.set 1
          block  ;; label = @4
            local.get 3
            i32.load8_u offset=40
            local.tee 0
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.ne
            br_if 3 (;@1;)
          end
          local.get 1
          i32.load
          local.tee 2
          local.get 1
          i32.const 4
          i32.add
          i32.load
          local.tee 0
          i32.load
          call_indirect (type 1)
          block  ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 6
            local.get 0
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 1
          i32.const 12
          i32.const 4
          call $__rust_dealloc
          br 2 (;@1;)
        end
        local.get 3
        i32.const 40
        i32.add
        local.get 1
        local.get 2
        i32.const 1
        call $std::sys_common::backtrace::print::h6f13639632200fc1
        local.get 3
        i32.load offset=44
        local.set 1
        block  ;; label = @3
          local.get 3
          i32.load8_u offset=40
          local.tee 0
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 3
          i32.ne
          br_if 2 (;@1;)
        end
        local.get 1
        i32.load
        local.tee 2
        local.get 1
        i32.const 4
        i32.add
        i32.load
        local.tee 0
        i32.load
        call_indirect (type 1)
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 6
          local.get 0
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 1
        i32.const 12
        i32.const 4
        call $__rust_dealloc
        br 1 (;@1;)
      end
      i32.const 0
      i32.load8_u offset=1052192
      local.set 0
      i32.const 0
      i32.const 0
      i32.store8 offset=1052192
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 52
      i32.add
      i64.const 0
      i64.store align=4
      local.get 3
      i32.const 1
      i32.store offset=44
      local.get 3
      i32.const 1050700
      i32.store offset=40
      local.get 3
      i32.const 1048620
      i32.store offset=48
      local.get 3
      i32.const 16
      i32.add
      local.get 1
      local.get 3
      i32.const 40
      i32.add
      local.get 4
      call_indirect (type 4)
      local.get 3
      i32.load offset=20
      local.set 1
      block  ;; label = @2
        local.get 3
        i32.load8_u offset=16
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 1)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 6
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end
    local.get 3
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $rust_begin_unwind (type 1) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 2
      br_if 0 (;@1;)
      i32.const 1048760
      i32.const 43
      i32.const 1050708
      call $core::panicking::panic::h9910a7377b663c09
      unreachable
    end
    local.get 1
    local.get 0
    i32.load offset=12
    i32.store offset=12
    local.get 1
    local.get 0
    i32.store offset=8
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 4
    i32.add
    call $std::sys_common::backtrace::__rust_end_short_backtrace::h874d7060d440a668
    unreachable)
  (func $_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$::take_box::h451c9df43699cc16 (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.add
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      br_if 0 (;@1;)
      local.get 1
      i32.load
      local.set 4
      local.get 2
      i32.const 36
      i32.add
      i32.const 8
      i32.add
      local.tee 5
      i32.const 0
      i32.store
      local.get 2
      i64.const 1
      i64.store offset=36 align=4
      local.get 2
      i32.const 36
      i32.add
      i32.const 1049016
      local.get 4
      call $core::fmt::write::he742b579cc4461da
      drop
      local.get 2
      i32.const 24
      i32.add
      i32.const 8
      i32.add
      local.get 5
      i32.load
      local.tee 4
      i32.store
      local.get 2
      local.get 2
      i64.load offset=36 align=4
      local.tee 6
      i64.store offset=24
      local.get 3
      i32.const 8
      i32.add
      local.get 4
      i32.store
      local.get 3
      local.get 6
      i64.store align=4
    end
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.tee 4
    local.get 3
    i32.const 8
    i32.add
    i32.load
    i32.store
    local.get 1
    i32.const 12
    i32.add
    i32.const 0
    i32.store
    local.get 3
    i64.load align=4
    local.set 6
    local.get 1
    i64.const 1
    i64.store offset=4 align=4
    i32.const 0
    i32.load8_u offset=1052213
    drop
    local.get 2
    local.get 6
    i64.store offset=8
    block  ;; label = @1
      i32.const 12
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 12
      call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
      unreachable
    end
    local.get 1
    local.get 2
    i64.load offset=8
    i64.store align=4
    local.get 1
    i32.const 8
    i32.add
    local.get 4
    i32.load
    i32.store
    local.get 0
    i32.const 1050724
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$::get::h842de63b55a43102 (type 2) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.add
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      br_if 0 (;@1;)
      local.get 1
      i32.load
      local.set 1
      local.get 2
      i32.const 20
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      i32.const 0
      i32.store
      local.get 2
      i64.const 1
      i64.store offset=20 align=4
      local.get 2
      i32.const 20
      i32.add
      i32.const 1049016
      local.get 1
      call $core::fmt::write::he742b579cc4461da
      drop
      local.get 2
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.load
      local.tee 1
      i32.store
      local.get 2
      local.get 2
      i64.load offset=20 align=4
      local.tee 5
      i64.store offset=8
      local.get 3
      i32.const 8
      i32.add
      local.get 1
      i32.store
      local.get 3
      local.get 5
      i64.store align=4
    end
    local.get 0
    i32.const 1050724
    i32.store offset=4
    local.get 0
    local.get 3
    i32.store
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$::take_box::h6cf8e9933504b06b (type 2) (param i32 i32)
    (local i32 i32)
    i32.const 0
    i32.load8_u offset=1052213
    drop
    local.get 1
    i32.load offset=4
    local.set 2
    local.get 1
    i32.load
    local.set 3
    block  ;; label = @1
      i32.const 8
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 8
      call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
      unreachable
    end
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store
    local.get 0
    i32.const 1050740
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$::get::h11feab045d226e6f (type 2) (param i32 i32)
    local.get 0
    i32.const 1050740
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $std::panicking::rust_panic_with_hook::h9180c29a90b6450d (type 11) (param i32 i32 i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 6
    global.set $__stack_pointer
    i32.const 0
    i32.const 0
    i32.load offset=1052280
    local.tee 7
    i32.const 1
    i32.add
    i32.store offset=1052280
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 7
                  i32.const 0
                  i32.lt_s
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.load8_u offset=1052300
                  br_if 1 (;@6;)
                  i32.const 0
                  i32.const 1
                  i32.store8 offset=1052300
                  i32.const 0
                  i32.const 0
                  i32.load offset=1052296
                  i32.const 1
                  i32.add
                  i32.store offset=1052296
                  local.get 6
                  local.get 5
                  i32.store8 offset=33
                  local.get 6
                  local.get 4
                  i32.store8 offset=32
                  local.get 6
                  local.get 3
                  i32.store offset=28
                  local.get 6
                  local.get 2
                  i32.store offset=24
                  local.get 6
                  i32.const 1050796
                  i32.store offset=20
                  local.get 6
                  i32.const 1048620
                  i32.store offset=16
                  i32.const 0
                  i32.load offset=1052264
                  local.tee 7
                  i32.const -1
                  i32.le_s
                  br_if 5 (;@2;)
                  i32.const 0
                  local.get 7
                  i32.const 1
                  i32.add
                  i32.store offset=1052264
                  i32.const 0
                  i32.load offset=1052272
                  local.set 7
                  local.get 6
                  local.get 0
                  local.get 1
                  i32.load offset=16
                  call_indirect (type 2)
                  local.get 6
                  local.get 6
                  i64.load
                  i64.store offset=16 align=4
                  local.get 7
                  i32.eqz
                  br_if 3 (;@4;)
                  i32.const 0
                  i32.load offset=1052272
                  local.get 6
                  i32.const 16
                  i32.add
                  i32.const 0
                  i32.load offset=1052276
                  i32.load offset=20
                  call_indirect (type 2)
                  br 4 (;@3;)
                end
                local.get 6
                local.get 5
                i32.store8 offset=33
                local.get 6
                local.get 4
                i32.store8 offset=32
                local.get 6
                local.get 3
                i32.store offset=28
                local.get 6
                local.get 2
                i32.store offset=24
                local.get 6
                i32.const 1050796
                i32.store offset=20
                local.get 6
                i32.const 1048620
                i32.store offset=16
                local.get 6
                i32.const 52
                i32.add
                i64.const 1
                i64.store align=4
                local.get 6
                i32.const 2
                i32.store offset=44
                local.get 6
                i32.const 1050864
                i32.store offset=40
                local.get 6
                i32.const 10
                i32.store offset=12
                local.get 6
                local.get 6
                i32.const 8
                i32.add
                i32.store offset=48
                local.get 6
                local.get 6
                i32.const 16
                i32.add
                i32.store offset=8
                local.get 6
                i32.const 4
                i32.store8 offset=64
                local.get 6
                local.get 6
                i32.const 8
                i32.add
                i32.store offset=72
                local.get 6
                i32.const 64
                i32.add
                i32.const 1049064
                local.get 6
                i32.const 40
                i32.add
                call $core::fmt::write::he742b579cc4461da
                local.set 4
                local.get 6
                i32.load8_u offset=64
                local.set 7
                block  ;; label = @7
                  local.get 4
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 7
                  i32.const 4
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 6
                  i32.load offset=68
                  local.set 7
                  block  ;; label = @8
                    local.get 6
                    i32.load8_u offset=64
                    local.tee 6
                    i32.const 4
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 6
                    i32.const 3
                    i32.ne
                    br_if 3 (;@5;)
                  end
                  local.get 7
                  i32.load
                  local.tee 4
                  local.get 7
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 6
                  i32.load
                  call_indirect (type 1)
                  block  ;; label = @8
                    local.get 6
                    i32.load offset=4
                    local.tee 5
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 4
                    local.get 5
                    local.get 6
                    i32.load offset=8
                    call $__rust_dealloc
                  end
                  local.get 7
                  i32.const 12
                  i32.const 4
                  call $__rust_dealloc
                  call $std::sys::wasi::abort_internal::h173ec7667b242253
                  unreachable
                end
                local.get 6
                i32.load offset=68
                local.set 6
                block  ;; label = @7
                  local.get 7
                  i32.const 4
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 7
                  i32.const 3
                  i32.ne
                  br_if 2 (;@5;)
                end
                local.get 6
                i32.load
                local.tee 4
                local.get 6
                i32.const 4
                i32.add
                i32.load
                local.tee 7
                i32.load
                call_indirect (type 1)
                block  ;; label = @7
                  local.get 7
                  i32.load offset=4
                  local.tee 5
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 5
                  local.get 7
                  i32.load offset=8
                  call $__rust_dealloc
                end
                local.get 6
                i32.const 12
                i32.const 4
                call $__rust_dealloc
                call $std::sys::wasi::abort_internal::h173ec7667b242253
                unreachable
              end
              local.get 6
              i32.const 52
              i32.add
              i64.const 0
              i64.store align=4
              local.get 6
              i32.const 1
              i32.store offset=44
              local.get 6
              i32.const 1050932
              i32.store offset=40
              local.get 6
              i32.const 1048620
              i32.store offset=48
              local.get 6
              i32.const 4
              i32.store8 offset=16
              local.get 6
              local.get 6
              i32.const 8
              i32.add
              i32.store offset=24
              local.get 6
              i32.const 16
              i32.add
              i32.const 1049064
              local.get 6
              i32.const 40
              i32.add
              call $core::fmt::write::he742b579cc4461da
              local.set 4
              local.get 6
              i32.load8_u offset=16
              local.set 7
              block  ;; label = @6
                local.get 4
                i32.eqz
                br_if 0 (;@6;)
                local.get 7
                i32.const 4
                i32.eq
                br_if 1 (;@5;)
                local.get 6
                i32.load offset=20
                local.set 7
                block  ;; label = @7
                  local.get 6
                  i32.load8_u offset=16
                  local.tee 6
                  i32.const 4
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 3
                  i32.ne
                  br_if 2 (;@5;)
                end
                local.get 7
                i32.load
                local.tee 4
                local.get 7
                i32.const 4
                i32.add
                i32.load
                local.tee 6
                i32.load
                call_indirect (type 1)
                block  ;; label = @7
                  local.get 6
                  i32.load offset=4
                  local.tee 5
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 5
                  local.get 6
                  i32.load offset=8
                  call $__rust_dealloc
                end
                local.get 7
                i32.const 12
                i32.const 4
                call $__rust_dealloc
                call $std::sys::wasi::abort_internal::h173ec7667b242253
                unreachable
              end
              local.get 6
              i32.load offset=20
              local.set 6
              block  ;; label = @6
                local.get 7
                i32.const 4
                i32.gt_u
                br_if 0 (;@6;)
                local.get 7
                i32.const 3
                i32.ne
                br_if 1 (;@5;)
              end
              local.get 6
              i32.load
              local.tee 4
              local.get 6
              i32.const 4
              i32.add
              i32.load
              local.tee 7
              i32.load
              call_indirect (type 1)
              block  ;; label = @6
                local.get 7
                i32.load offset=4
                local.tee 5
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                local.get 5
                local.get 7
                i32.load offset=8
                call $__rust_dealloc
              end
              local.get 6
              i32.const 12
              i32.const 4
              call $__rust_dealloc
            end
            call $std::sys::wasi::abort_internal::h173ec7667b242253
            unreachable
          end
          local.get 6
          i32.const 16
          i32.add
          call $std::panicking::default_hook::h5151d4f5a11faf85
        end
        i32.const 0
        i32.const 0
        i32.load offset=1052264
        i32.const -1
        i32.add
        i32.store offset=1052264
        i32.const 0
        i32.const 0
        i32.store8 offset=1052300
        local.get 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        call $rust_panic
        unreachable
      end
      local.get 6
      i32.const 52
      i32.add
      i64.const 0
      i64.store align=4
      local.get 6
      i32.const 1
      i32.store offset=44
      local.get 6
      i32.const 1051116
      i32.store offset=40
      local.get 6
      local.get 6
      i32.const 8
      i32.add
      i32.store offset=48
      local.get 6
      i32.const 64
      i32.add
      local.get 6
      i32.const 8
      i32.add
      local.get 6
      i32.const 40
      i32.add
      call $std::io::Write::write_fmt::h3862c0cb55a9e920
      local.get 6
      i32.load8_u offset=64
      local.get 6
      i32.load offset=68
      call $core::ptr::drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$::haebd22c8be51709e
      call $std::sys::wasi::abort_internal::h173ec7667b242253
      unreachable
    end
    local.get 6
    i32.const 52
    i32.add
    i64.const 0
    i64.store align=4
    local.get 6
    i32.const 1
    i32.store offset=44
    local.get 6
    i32.const 1050988
    i32.store offset=40
    local.get 6
    i32.const 1048620
    i32.store offset=48
    local.get 6
    i32.const 64
    i32.add
    local.get 6
    i32.const 8
    i32.add
    local.get 6
    i32.const 40
    i32.add
    call $std::io::Write::write_fmt::h3862c0cb55a9e920
    local.get 6
    i32.load8_u offset=64
    local.get 6
    i32.load offset=68
    call $core::ptr::drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$::haebd22c8be51709e
    call $std::sys::wasi::abort_internal::h173ec7667b242253
    unreachable)
  (func $rust_panic (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    local.get 1
    call $__rust_start_panic
    i32.store
    local.get 2
    i32.const 24
    i32.add
    i64.const 1
    i64.store align=4
    local.get 2
    i32.const 2
    i32.store offset=16
    local.get 2
    i32.const 1051052
    i32.store offset=12
    local.get 2
    i32.const 7
    i32.store offset=40
    local.get 2
    local.get 2
    i32.const 36
    i32.add
    i32.store offset=20
    local.get 2
    local.get 2
    i32.store offset=36
    local.get 2
    i32.const 4
    i32.add
    local.get 2
    i32.const 47
    i32.add
    local.get 2
    i32.const 12
    i32.add
    call $std::io::Write::write_fmt::h3862c0cb55a9e920
    local.get 2
    i32.load8_u offset=4
    local.get 2
    i32.load offset=8
    call $core::ptr::drop_in_place$LT$core..result..Result$LT$$LP$$RP$$C$std..io..error..Error$GT$$GT$::haebd22c8be51709e
    call $std::sys::wasi::abort_internal::h173ec7667b242253
    unreachable)
  (func $_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$::write::h9bcca047cf976e4d (type 9) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    local.get 3
    i32.store offset=4
    local.get 4
    local.get 2
    i32.store
    local.get 4
    i32.const 8
    i32.add
    i32.const 2
    local.get 4
    i32.const 1
    call $wasi::lib_generated::fd_write::h41f6a0177730a9fb
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.load16_u offset=8
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.load offset=12
        i32.store offset=4
        local.get 0
        i32.const 4
        i32.store8
        br 1 (;@1;)
      end
      local.get 0
      local.get 4
      i64.load16_u offset=10
      i64.const 32
      i64.shl
      i64.store align=4
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$::write_vectored::hb1fc5e85961a2bb6 (type 9) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 8
    i32.add
    i32.const 2
    local.get 2
    local.get 3
    call $wasi::lib_generated::fd_write::h41f6a0177730a9fb
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.load16_u offset=8
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.load offset=12
        i32.store offset=4
        local.get 0
        i32.const 4
        i32.store8
        br 1 (;@1;)
      end
      local.get 0
      local.get 4
      i64.load16_u offset=10
      i64.const 32
      i64.shl
      i64.store align=4
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$::is_write_vectored::h718bbac8dc691f53 (type 3) (param i32) (result i32)
    i32.const 1)
  (func $_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$::flush::ha766d64c92477a36 (type 2) (param i32 i32)
    local.get 0
    i32.const 4
    i32.store8)
  (func $std::alloc::rust_oom::hd23ba08bcdab3853 (type 2) (param i32 i32)
    (local i32)
    local.get 0
    local.get 1
    i32.const 0
    i32.load offset=1052260
    local.tee 2
    i32.const 11
    local.get 2
    select
    call_indirect (type 2)
    call $std::process::abort::ha5f94cae24ca7d6d
    unreachable)
  (func $__rg_oom (type 2) (param i32 i32)
    local.get 1
    local.get 0
    call $std::alloc::rust_oom::hd23ba08bcdab3853
    unreachable)
  (func $__rust_start_panic (type 6) (param i32 i32) (result i32)
    unreachable
    unreachable)
  (func $wasi::lib_generated::fd_write::h41f6a0177730a9fb (type 9) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 2
        local.get 3
        local.get 4
        i32.const 12
        i32.add
        call $wasi::lib_generated::wasi_snapshot_preview1::fd_write::h0b10c40574ebf28c
        local.tee 3
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.load offset=12
        i32.store offset=4
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      local.get 3
      i32.store16 offset=2
      i32.const 1
      local.set 3
    end
    local.get 0
    local.get 3
    i32.store16
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $malloc (type 3) (param i32) (result i32)
    local.get 0
    call $dlmalloc)
  (func $dlmalloc (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1052344
                            local.tee 2
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1052792
                              local.tee 3
                              br_if 0 (;@13;)
                              i32.const 0
                              i64.const -1
                              i64.store offset=1052804 align=4
                              i32.const 0
                              i64.const 281474976776192
                              i64.store offset=1052796 align=4
                              i32.const 0
                              local.get 1
                              i32.const 8
                              i32.add
                              i32.const -16
                              i32.and
                              i32.const 1431655768
                              i32.xor
                              local.tee 3
                              i32.store offset=1052792
                              i32.const 0
                              i32.const 0
                              i32.store offset=1052812
                              i32.const 0
                              i32.const 0
                              i32.store offset=1052764
                            end
                            i32.const 1114112
                            i32.const 1052832
                            i32.lt_u
                            br_if 1 (;@11;)
                            i32.const 0
                            local.set 2
                            i32.const 1114112
                            i32.const 1052832
                            i32.sub
                            i32.const 89
                            i32.lt_u
                            br_if 0 (;@12;)
                            i32.const 0
                            local.set 4
                            i32.const 0
                            i32.const 1052832
                            i32.store offset=1052768
                            i32.const 0
                            i32.const 1052832
                            i32.store offset=1052336
                            i32.const 0
                            local.get 3
                            i32.store offset=1052356
                            i32.const 0
                            i32.const -1
                            i32.store offset=1052352
                            i32.const 0
                            i32.const 1114112
                            i32.const 1052832
                            i32.sub
                            i32.store offset=1052772
                            loop  ;; label = @13
                              local.get 4
                              i32.const 1052380
                              i32.add
                              local.get 4
                              i32.const 1052368
                              i32.add
                              local.tee 3
                              i32.store
                              local.get 3
                              local.get 4
                              i32.const 1052360
                              i32.add
                              local.tee 5
                              i32.store
                              local.get 4
                              i32.const 1052372
                              i32.add
                              local.get 5
                              i32.store
                              local.get 4
                              i32.const 1052388
                              i32.add
                              local.get 4
                              i32.const 1052376
                              i32.add
                              local.tee 5
                              i32.store
                              local.get 5
                              local.get 3
                              i32.store
                              local.get 4
                              i32.const 1052396
                              i32.add
                              local.get 4
                              i32.const 1052384
                              i32.add
                              local.tee 3
                              i32.store
                              local.get 3
                              local.get 5
                              i32.store
                              local.get 4
                              i32.const 1052392
                              i32.add
                              local.get 3
                              i32.store
                              local.get 4
                              i32.const 32
                              i32.add
                              local.tee 4
                              i32.const 256
                              i32.ne
                              br_if 0 (;@13;)
                            end
                            i32.const 1052832
                            i32.const -8
                            i32.const 1052832
                            i32.sub
                            i32.const 15
                            i32.and
                            i32.const 0
                            i32.const 1052832
                            i32.const 8
                            i32.add
                            i32.const 15
                            i32.and
                            select
                            local.tee 4
                            i32.add
                            local.tee 2
                            i32.const 4
                            i32.add
                            i32.const 1114112
                            i32.const 1052832
                            i32.sub
                            i32.const -56
                            i32.add
                            local.tee 3
                            local.get 4
                            i32.sub
                            local.tee 4
                            i32.const 1
                            i32.or
                            i32.store
                            i32.const 0
                            i32.const 0
                            i32.load offset=1052808
                            i32.store offset=1052348
                            i32.const 0
                            local.get 4
                            i32.store offset=1052332
                            i32.const 0
                            local.get 2
                            i32.store offset=1052344
                            local.get 3
                            i32.const 1052832
                            i32.add
                            i32.const 4
                            i32.add
                            i32.const 56
                            i32.store
                          end
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 0
                              i32.const 236
                              i32.gt_u
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                i32.const 0
                                i32.load offset=1052320
                                local.tee 6
                                i32.const 16
                                local.get 0
                                i32.const 19
                                i32.add
                                i32.const -16
                                i32.and
                                local.get 0
                                i32.const 11
                                i32.lt_u
                                select
                                local.tee 7
                                i32.const 3
                                i32.shr_u
                                local.tee 3
                                i32.shr_u
                                local.tee 4
                                i32.const 3
                                i32.and
                                i32.eqz
                                br_if 0 (;@14;)
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 4
                                    i32.const 1
                                    i32.and
                                    local.get 3
                                    i32.or
                                    i32.const 1
                                    i32.xor
                                    local.tee 5
                                    i32.const 3
                                    i32.shl
                                    local.tee 3
                                    i32.const 1052360
                                    i32.add
                                    local.tee 4
                                    local.get 3
                                    i32.const 1052368
                                    i32.add
                                    i32.load
                                    local.tee 3
                                    i32.load offset=8
                                    local.tee 7
                                    i32.ne
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.get 6
                                    i32.const -2
                                    local.get 5
                                    i32.rotl
                                    i32.and
                                    i32.store offset=1052320
                                    br 1 (;@15;)
                                  end
                                  local.get 4
                                  local.get 7
                                  i32.store offset=8
                                  local.get 7
                                  local.get 4
                                  i32.store offset=12
                                end
                                local.get 3
                                i32.const 8
                                i32.add
                                local.set 4
                                local.get 3
                                local.get 5
                                i32.const 3
                                i32.shl
                                local.tee 5
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                local.get 3
                                local.get 5
                                i32.add
                                local.tee 3
                                local.get 3
                                i32.load offset=4
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                br 13 (;@1;)
                              end
                              local.get 7
                              i32.const 0
                              i32.load offset=1052328
                              local.tee 8
                              i32.le_u
                              br_if 1 (;@12;)
                              block  ;; label = @14
                                local.get 4
                                i32.eqz
                                br_if 0 (;@14;)
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 4
                                    local.get 3
                                    i32.shl
                                    i32.const 2
                                    local.get 3
                                    i32.shl
                                    local.tee 4
                                    i32.const 0
                                    local.get 4
                                    i32.sub
                                    i32.or
                                    i32.and
                                    local.tee 4
                                    i32.const 0
                                    local.get 4
                                    i32.sub
                                    i32.and
                                    i32.ctz
                                    local.tee 3
                                    i32.const 3
                                    i32.shl
                                    local.tee 4
                                    i32.const 1052360
                                    i32.add
                                    local.tee 5
                                    local.get 4
                                    i32.const 1052368
                                    i32.add
                                    i32.load
                                    local.tee 4
                                    i32.load offset=8
                                    local.tee 0
                                    i32.ne
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.get 6
                                    i32.const -2
                                    local.get 3
                                    i32.rotl
                                    i32.and
                                    local.tee 6
                                    i32.store offset=1052320
                                    br 1 (;@15;)
                                  end
                                  local.get 5
                                  local.get 0
                                  i32.store offset=8
                                  local.get 0
                                  local.get 5
                                  i32.store offset=12
                                end
                                local.get 4
                                local.get 7
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                local.get 4
                                local.get 3
                                i32.const 3
                                i32.shl
                                local.tee 3
                                i32.add
                                local.get 3
                                local.get 7
                                i32.sub
                                local.tee 5
                                i32.store
                                local.get 4
                                local.get 7
                                i32.add
                                local.tee 0
                                local.get 5
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                block  ;; label = @15
                                  local.get 8
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 8
                                  i32.const -8
                                  i32.and
                                  i32.const 1052360
                                  i32.add
                                  local.set 7
                                  i32.const 0
                                  i32.load offset=1052340
                                  local.set 3
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      local.get 6
                                      i32.const 1
                                      local.get 8
                                      i32.const 3
                                      i32.shr_u
                                      i32.shl
                                      local.tee 9
                                      i32.and
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.get 6
                                      local.get 9
                                      i32.or
                                      i32.store offset=1052320
                                      local.get 7
                                      local.set 9
                                      br 1 (;@16;)
                                    end
                                    local.get 7
                                    i32.load offset=8
                                    local.set 9
                                  end
                                  local.get 9
                                  local.get 3
                                  i32.store offset=12
                                  local.get 7
                                  local.get 3
                                  i32.store offset=8
                                  local.get 3
                                  local.get 7
                                  i32.store offset=12
                                  local.get 3
                                  local.get 9
                                  i32.store offset=8
                                end
                                local.get 4
                                i32.const 8
                                i32.add
                                local.set 4
                                i32.const 0
                                local.get 0
                                i32.store offset=1052340
                                i32.const 0
                                local.get 5
                                i32.store offset=1052328
                                br 13 (;@1;)
                              end
                              i32.const 0
                              i32.load offset=1052324
                              local.tee 10
                              i32.eqz
                              br_if 1 (;@12;)
                              local.get 10
                              i32.const 0
                              local.get 10
                              i32.sub
                              i32.and
                              i32.ctz
                              i32.const 2
                              i32.shl
                              i32.const 1052624
                              i32.add
                              i32.load
                              local.tee 0
                              i32.load offset=4
                              i32.const -8
                              i32.and
                              local.get 7
                              i32.sub
                              local.set 3
                              local.get 0
                              local.set 5
                              block  ;; label = @14
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    local.get 5
                                    i32.load offset=16
                                    local.tee 4
                                    br_if 0 (;@16;)
                                    local.get 5
                                    i32.const 20
                                    i32.add
                                    i32.load
                                    local.tee 4
                                    i32.eqz
                                    br_if 2 (;@14;)
                                  end
                                  local.get 4
                                  i32.load offset=4
                                  i32.const -8
                                  i32.and
                                  local.get 7
                                  i32.sub
                                  local.tee 5
                                  local.get 3
                                  local.get 5
                                  local.get 3
                                  i32.lt_u
                                  local.tee 5
                                  select
                                  local.set 3
                                  local.get 4
                                  local.get 0
                                  local.get 5
                                  select
                                  local.set 0
                                  local.get 4
                                  local.set 5
                                  br 0 (;@15;)
                                end
                              end
                              local.get 0
                              i32.load offset=24
                              local.set 11
                              block  ;; label = @14
                                local.get 0
                                i32.load offset=12
                                local.tee 9
                                local.get 0
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 0
                                i32.load offset=8
                                local.tee 4
                                i32.const 0
                                i32.load offset=1052336
                                i32.lt_u
                                drop
                                local.get 9
                                local.get 4
                                i32.store offset=8
                                local.get 4
                                local.get 9
                                i32.store offset=12
                                br 12 (;@2;)
                              end
                              block  ;; label = @14
                                local.get 0
                                i32.const 20
                                i32.add
                                local.tee 5
                                i32.load
                                local.tee 4
                                br_if 0 (;@14;)
                                local.get 0
                                i32.load offset=16
                                local.tee 4
                                i32.eqz
                                br_if 4 (;@10;)
                                local.get 0
                                i32.const 16
                                i32.add
                                local.set 5
                              end
                              loop  ;; label = @14
                                local.get 5
                                local.set 2
                                local.get 4
                                local.tee 9
                                i32.const 20
                                i32.add
                                local.tee 5
                                i32.load
                                local.tee 4
                                br_if 0 (;@14;)
                                local.get 9
                                i32.const 16
                                i32.add
                                local.set 5
                                local.get 9
                                i32.load offset=16
                                local.tee 4
                                br_if 0 (;@14;)
                              end
                              local.get 2
                              i32.const 0
                              i32.store
                              br 11 (;@2;)
                            end
                            i32.const -1
                            local.set 7
                            local.get 0
                            i32.const -65
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 19
                            i32.add
                            local.tee 4
                            i32.const -16
                            i32.and
                            local.set 7
                            i32.const 0
                            i32.load offset=1052324
                            local.tee 10
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 0
                            local.set 8
                            block  ;; label = @13
                              local.get 7
                              i32.const 256
                              i32.lt_u
                              br_if 0 (;@13;)
                              i32.const 31
                              local.set 8
                              local.get 7
                              i32.const 16777215
                              i32.gt_u
                              br_if 0 (;@13;)
                              local.get 7
                              i32.const 38
                              local.get 4
                              i32.const 8
                              i32.shr_u
                              i32.clz
                              local.tee 4
                              i32.sub
                              i32.shr_u
                              i32.const 1
                              i32.and
                              local.get 4
                              i32.const 1
                              i32.shl
                              i32.sub
                              i32.const 62
                              i32.add
                              local.set 8
                            end
                            i32.const 0
                            local.get 7
                            i32.sub
                            local.set 3
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 8
                                    i32.const 2
                                    i32.shl
                                    i32.const 1052624
                                    i32.add
                                    i32.load
                                    local.tee 5
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 4
                                    i32.const 0
                                    local.set 9
                                    br 1 (;@15;)
                                  end
                                  i32.const 0
                                  local.set 4
                                  local.get 7
                                  i32.const 0
                                  i32.const 25
                                  local.get 8
                                  i32.const 1
                                  i32.shr_u
                                  i32.sub
                                  local.get 8
                                  i32.const 31
                                  i32.eq
                                  select
                                  i32.shl
                                  local.set 0
                                  i32.const 0
                                  local.set 9
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 5
                                      i32.load offset=4
                                      i32.const -8
                                      i32.and
                                      local.get 7
                                      i32.sub
                                      local.tee 6
                                      local.get 3
                                      i32.ge_u
                                      br_if 0 (;@17;)
                                      local.get 6
                                      local.set 3
                                      local.get 5
                                      local.set 9
                                      local.get 6
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 3
                                      local.get 5
                                      local.set 9
                                      local.get 5
                                      local.set 4
                                      br 3 (;@14;)
                                    end
                                    local.get 4
                                    local.get 5
                                    i32.const 20
                                    i32.add
                                    i32.load
                                    local.tee 6
                                    local.get 6
                                    local.get 5
                                    local.get 0
                                    i32.const 29
                                    i32.shr_u
                                    i32.const 4
                                    i32.and
                                    i32.add
                                    i32.const 16
                                    i32.add
                                    i32.load
                                    local.tee 5
                                    i32.eq
                                    select
                                    local.get 4
                                    local.get 6
                                    select
                                    local.set 4
                                    local.get 0
                                    i32.const 1
                                    i32.shl
                                    local.set 0
                                    local.get 5
                                    br_if 0 (;@16;)
                                  end
                                end
                                block  ;; label = @15
                                  local.get 4
                                  local.get 9
                                  i32.or
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 9
                                  i32.const 2
                                  local.get 8
                                  i32.shl
                                  local.tee 4
                                  i32.const 0
                                  local.get 4
                                  i32.sub
                                  i32.or
                                  local.get 10
                                  i32.and
                                  local.tee 4
                                  i32.eqz
                                  br_if 3 (;@12;)
                                  local.get 4
                                  i32.const 0
                                  local.get 4
                                  i32.sub
                                  i32.and
                                  i32.ctz
                                  i32.const 2
                                  i32.shl
                                  i32.const 1052624
                                  i32.add
                                  i32.load
                                  local.set 4
                                end
                                local.get 4
                                i32.eqz
                                br_if 1 (;@13;)
                              end
                              loop  ;; label = @14
                                local.get 4
                                i32.load offset=4
                                i32.const -8
                                i32.and
                                local.get 7
                                i32.sub
                                local.tee 6
                                local.get 3
                                i32.lt_u
                                local.set 0
                                block  ;; label = @15
                                  local.get 4
                                  i32.load offset=16
                                  local.tee 5
                                  br_if 0 (;@15;)
                                  local.get 4
                                  i32.const 20
                                  i32.add
                                  i32.load
                                  local.set 5
                                end
                                local.get 6
                                local.get 3
                                local.get 0
                                select
                                local.set 3
                                local.get 4
                                local.get 9
                                local.get 0
                                select
                                local.set 9
                                local.get 5
                                local.set 4
                                local.get 5
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 9
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 3
                            i32.const 0
                            i32.load offset=1052328
                            local.get 7
                            i32.sub
                            i32.ge_u
                            br_if 0 (;@12;)
                            local.get 9
                            i32.load offset=24
                            local.set 2
                            block  ;; label = @13
                              local.get 9
                              i32.load offset=12
                              local.tee 0
                              local.get 9
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 9
                              i32.load offset=8
                              local.tee 4
                              i32.const 0
                              i32.load offset=1052336
                              i32.lt_u
                              drop
                              local.get 0
                              local.get 4
                              i32.store offset=8
                              local.get 4
                              local.get 0
                              i32.store offset=12
                              br 10 (;@3;)
                            end
                            block  ;; label = @13
                              local.get 9
                              i32.const 20
                              i32.add
                              local.tee 5
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 9
                              i32.load offset=16
                              local.tee 4
                              i32.eqz
                              br_if 4 (;@9;)
                              local.get 9
                              i32.const 16
                              i32.add
                              local.set 5
                            end
                            loop  ;; label = @13
                              local.get 5
                              local.set 6
                              local.get 4
                              local.tee 0
                              i32.const 20
                              i32.add
                              local.tee 5
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 16
                              i32.add
                              local.set 5
                              local.get 0
                              i32.load offset=16
                              local.tee 4
                              br_if 0 (;@13;)
                            end
                            local.get 6
                            i32.const 0
                            i32.store
                            br 9 (;@3;)
                          end
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1052328
                            local.tee 4
                            local.get 7
                            i32.lt_u
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.load offset=1052340
                            local.set 3
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 4
                                local.get 7
                                i32.sub
                                local.tee 5
                                i32.const 16
                                i32.lt_u
                                br_if 0 (;@14;)
                                local.get 3
                                local.get 7
                                i32.add
                                local.tee 0
                                local.get 5
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                local.get 3
                                local.get 4
                                i32.add
                                local.get 5
                                i32.store
                                local.get 3
                                local.get 7
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                br 1 (;@13;)
                              end
                              local.get 3
                              local.get 4
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 3
                              local.get 4
                              i32.add
                              local.tee 4
                              local.get 4
                              i32.load offset=4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              i32.const 0
                              local.set 0
                              i32.const 0
                              local.set 5
                            end
                            i32.const 0
                            local.get 5
                            i32.store offset=1052328
                            i32.const 0
                            local.get 0
                            i32.store offset=1052340
                            local.get 3
                            i32.const 8
                            i32.add
                            local.set 4
                            br 11 (;@1;)
                          end
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1052332
                            local.tee 5
                            local.get 7
                            i32.le_u
                            br_if 0 (;@12;)
                            local.get 2
                            local.get 7
                            i32.add
                            local.tee 4
                            local.get 5
                            local.get 7
                            i32.sub
                            local.tee 3
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 0
                            local.get 4
                            i32.store offset=1052344
                            i32.const 0
                            local.get 3
                            i32.store offset=1052332
                            local.get 2
                            local.get 7
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 2
                            i32.const 8
                            i32.add
                            local.set 4
                            br 11 (;@1;)
                          end
                          block  ;; label = @12
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1052792
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.load offset=1052800
                              local.set 3
                              br 1 (;@12;)
                            end
                            i32.const 0
                            i64.const -1
                            i64.store offset=1052804 align=4
                            i32.const 0
                            i64.const 281474976776192
                            i64.store offset=1052796 align=4
                            i32.const 0
                            local.get 1
                            i32.const 12
                            i32.add
                            i32.const -16
                            i32.and
                            i32.const 1431655768
                            i32.xor
                            i32.store offset=1052792
                            i32.const 0
                            i32.const 0
                            i32.store offset=1052812
                            i32.const 0
                            i32.const 0
                            i32.store offset=1052764
                            i32.const 65536
                            local.set 3
                          end
                          i32.const 0
                          local.set 4
                          block  ;; label = @12
                            local.get 3
                            local.get 7
                            i32.const 71
                            i32.add
                            local.tee 8
                            i32.add
                            local.tee 0
                            i32.const 0
                            local.get 3
                            i32.sub
                            local.tee 6
                            i32.and
                            local.tee 9
                            local.get 7
                            i32.gt_u
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.const 48
                            i32.store offset=1052816
                            br 11 (;@1;)
                          end
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1052760
                            local.tee 4
                            i32.eqz
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1052752
                              local.tee 3
                              local.get 9
                              i32.add
                              local.tee 10
                              local.get 3
                              i32.le_u
                              br_if 0 (;@13;)
                              local.get 10
                              local.get 4
                              i32.le_u
                              br_if 1 (;@12;)
                            end
                            i32.const 0
                            local.set 4
                            i32.const 0
                            i32.const 48
                            i32.store offset=1052816
                            br 11 (;@1;)
                          end
                          i32.const 0
                          i32.load8_u offset=1052764
                          i32.const 4
                          i32.and
                          br_if 5 (;@6;)
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 2
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 1052768
                                local.set 4
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load
                                    local.tee 3
                                    local.get 2
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                    local.get 3
                                    local.get 4
                                    i32.load offset=4
                                    i32.add
                                    local.get 2
                                    i32.gt_u
                                    br_if 3 (;@13;)
                                  end
                                  local.get 4
                                  i32.load offset=8
                                  local.tee 4
                                  br_if 0 (;@15;)
                                end
                              end
                              i32.const 0
                              call $sbrk
                              local.tee 0
                              i32.const -1
                              i32.eq
                              br_if 6 (;@7;)
                              local.get 9
                              local.set 6
                              block  ;; label = @14
                                i32.const 0
                                i32.load offset=1052796
                                local.tee 4
                                i32.const -1
                                i32.add
                                local.tee 3
                                local.get 0
                                i32.and
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 9
                                local.get 0
                                i32.sub
                                local.get 3
                                local.get 0
                                i32.add
                                i32.const 0
                                local.get 4
                                i32.sub
                                i32.and
                                i32.add
                                local.set 6
                              end
                              local.get 6
                              local.get 7
                              i32.le_u
                              br_if 6 (;@7;)
                              local.get 6
                              i32.const 2147483646
                              i32.gt_u
                              br_if 6 (;@7;)
                              block  ;; label = @14
                                i32.const 0
                                i32.load offset=1052760
                                local.tee 4
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                i32.load offset=1052752
                                local.tee 3
                                local.get 6
                                i32.add
                                local.tee 5
                                local.get 3
                                i32.le_u
                                br_if 7 (;@7;)
                                local.get 5
                                local.get 4
                                i32.gt_u
                                br_if 7 (;@7;)
                              end
                              local.get 6
                              call $sbrk
                              local.tee 4
                              local.get 0
                              i32.ne
                              br_if 1 (;@12;)
                              br 8 (;@5;)
                            end
                            local.get 0
                            local.get 5
                            i32.sub
                            local.get 6
                            i32.and
                            local.tee 6
                            i32.const 2147483646
                            i32.gt_u
                            br_if 5 (;@7;)
                            local.get 6
                            call $sbrk
                            local.tee 0
                            local.get 4
                            i32.load
                            local.get 4
                            i32.load offset=4
                            i32.add
                            i32.eq
                            br_if 4 (;@8;)
                            local.get 0
                            local.set 4
                          end
                          block  ;; label = @12
                            local.get 4
                            i32.const -1
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 7
                            i32.const 72
                            i32.add
                            local.get 6
                            i32.le_u
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              local.get 8
                              local.get 6
                              i32.sub
                              i32.const 0
                              i32.load offset=1052800
                              local.tee 3
                              i32.add
                              i32.const 0
                              local.get 3
                              i32.sub
                              i32.and
                              local.tee 3
                              i32.const 2147483646
                              i32.le_u
                              br_if 0 (;@13;)
                              local.get 4
                              local.set 0
                              br 8 (;@5;)
                            end
                            block  ;; label = @13
                              local.get 3
                              call $sbrk
                              i32.const -1
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 3
                              local.get 6
                              i32.add
                              local.set 6
                              local.get 4
                              local.set 0
                              br 8 (;@5;)
                            end
                            i32.const 0
                            local.get 6
                            i32.sub
                            call $sbrk
                            drop
                            br 5 (;@7;)
                          end
                          local.get 4
                          local.set 0
                          local.get 4
                          i32.const -1
                          i32.ne
                          br_if 6 (;@5;)
                          br 4 (;@7;)
                        end
                        unreachable
                        unreachable
                      end
                      i32.const 0
                      local.set 9
                      br 7 (;@2;)
                    end
                    i32.const 0
                    local.set 0
                    br 5 (;@3;)
                  end
                  local.get 0
                  i32.const -1
                  i32.ne
                  br_if 2 (;@5;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=1052764
                i32.const 4
                i32.or
                i32.store offset=1052764
              end
              local.get 9
              i32.const 2147483646
              i32.gt_u
              br_if 1 (;@4;)
              local.get 9
              call $sbrk
              local.set 0
              i32.const 0
              call $sbrk
              local.set 4
              local.get 0
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              local.get 4
              i32.ge_u
              br_if 1 (;@4;)
              local.get 4
              local.get 0
              i32.sub
              local.tee 6
              local.get 7
              i32.const 56
              i32.add
              i32.le_u
              br_if 1 (;@4;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=1052752
            local.get 6
            i32.add
            local.tee 4
            i32.store offset=1052752
            block  ;; label = @5
              local.get 4
              i32.const 0
              i32.load offset=1052756
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.get 4
              i32.store offset=1052756
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1052344
                    local.tee 3
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 1052768
                    local.set 4
                    loop  ;; label = @9
                      local.get 0
                      local.get 4
                      i32.load
                      local.tee 5
                      local.get 4
                      i32.load offset=4
                      local.tee 9
                      i32.add
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 4
                      i32.load offset=8
                      local.tee 4
                      br_if 0 (;@9;)
                      br 3 (;@6;)
                    end
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1052336
                      local.tee 4
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 4
                      i32.ge_u
                      br_if 1 (;@8;)
                    end
                    i32.const 0
                    local.get 0
                    i32.store offset=1052336
                  end
                  i32.const 0
                  local.set 4
                  i32.const 0
                  local.get 6
                  i32.store offset=1052772
                  i32.const 0
                  local.get 0
                  i32.store offset=1052768
                  i32.const 0
                  i32.const -1
                  i32.store offset=1052352
                  i32.const 0
                  i32.const 0
                  i32.load offset=1052792
                  i32.store offset=1052356
                  i32.const 0
                  i32.const 0
                  i32.store offset=1052780
                  loop  ;; label = @8
                    local.get 4
                    i32.const 1052380
                    i32.add
                    local.get 4
                    i32.const 1052368
                    i32.add
                    local.tee 3
                    i32.store
                    local.get 3
                    local.get 4
                    i32.const 1052360
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 4
                    i32.const 1052372
                    i32.add
                    local.get 5
                    i32.store
                    local.get 4
                    i32.const 1052388
                    i32.add
                    local.get 4
                    i32.const 1052376
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 5
                    local.get 3
                    i32.store
                    local.get 4
                    i32.const 1052396
                    i32.add
                    local.get 4
                    i32.const 1052384
                    i32.add
                    local.tee 3
                    i32.store
                    local.get 3
                    local.get 5
                    i32.store
                    local.get 4
                    i32.const 1052392
                    i32.add
                    local.get 3
                    i32.store
                    local.get 4
                    i32.const 32
                    i32.add
                    local.tee 4
                    i32.const 256
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 0
                  i32.const -8
                  local.get 0
                  i32.sub
                  i32.const 15
                  i32.and
                  i32.const 0
                  local.get 0
                  i32.const 8
                  i32.add
                  i32.const 15
                  i32.and
                  select
                  local.tee 4
                  i32.add
                  local.tee 3
                  local.get 6
                  i32.const -56
                  i32.add
                  local.tee 5
                  local.get 4
                  i32.sub
                  local.tee 4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  i32.const 0
                  i32.const 0
                  i32.load offset=1052808
                  i32.store offset=1052348
                  i32.const 0
                  local.get 4
                  i32.store offset=1052332
                  i32.const 0
                  local.get 3
                  i32.store offset=1052344
                  local.get 0
                  local.get 5
                  i32.add
                  i32.const 56
                  i32.store offset=4
                  br 2 (;@5;)
                end
                local.get 4
                i32.load8_u offset=12
                i32.const 8
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.get 5
                i32.lt_u
                br_if 0 (;@6;)
                local.get 3
                local.get 0
                i32.ge_u
                br_if 0 (;@6;)
                local.get 3
                i32.const -8
                local.get 3
                i32.sub
                i32.const 15
                i32.and
                i32.const 0
                local.get 3
                i32.const 8
                i32.add
                i32.const 15
                i32.and
                select
                local.tee 5
                i32.add
                local.tee 0
                i32.const 0
                i32.load offset=1052332
                local.get 6
                i32.add
                local.tee 2
                local.get 5
                i32.sub
                local.tee 5
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 4
                local.get 9
                local.get 6
                i32.add
                i32.store offset=4
                i32.const 0
                i32.const 0
                i32.load offset=1052808
                i32.store offset=1052348
                i32.const 0
                local.get 5
                i32.store offset=1052332
                i32.const 0
                local.get 0
                i32.store offset=1052344
                local.get 3
                local.get 2
                i32.add
                i32.const 56
                i32.store offset=4
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 0
                i32.const 0
                i32.load offset=1052336
                local.tee 9
                i32.ge_u
                br_if 0 (;@6;)
                i32.const 0
                local.get 0
                i32.store offset=1052336
                local.get 0
                local.set 9
              end
              local.get 0
              local.get 6
              i32.add
              local.set 5
              i32.const 1052768
              local.set 4
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            loop  ;; label = @13
                              local.get 4
                              i32.load
                              local.get 5
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 4
                              i32.load offset=8
                              local.tee 4
                              br_if 0 (;@13;)
                              br 2 (;@11;)
                            end
                          end
                          local.get 4
                          i32.load8_u offset=12
                          i32.const 8
                          i32.and
                          i32.eqz
                          br_if 1 (;@10;)
                        end
                        i32.const 1052768
                        local.set 4
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 4
                            i32.load
                            local.tee 5
                            local.get 3
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 5
                            local.get 4
                            i32.load offset=4
                            i32.add
                            local.tee 5
                            local.get 3
                            i32.gt_u
                            br_if 3 (;@9;)
                          end
                          local.get 4
                          i32.load offset=8
                          local.set 4
                          br 0 (;@11;)
                        end
                      end
                      local.get 4
                      local.get 0
                      i32.store
                      local.get 4
                      local.get 4
                      i32.load offset=4
                      local.get 6
                      i32.add
                      i32.store offset=4
                      local.get 0
                      i32.const -8
                      local.get 0
                      i32.sub
                      i32.const 15
                      i32.and
                      i32.const 0
                      local.get 0
                      i32.const 8
                      i32.add
                      i32.const 15
                      i32.and
                      select
                      i32.add
                      local.tee 2
                      local.get 7
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 5
                      i32.const -8
                      local.get 5
                      i32.sub
                      i32.const 15
                      i32.and
                      i32.const 0
                      local.get 5
                      i32.const 8
                      i32.add
                      i32.const 15
                      i32.and
                      select
                      i32.add
                      local.tee 6
                      local.get 2
                      local.get 7
                      i32.add
                      local.tee 7
                      i32.sub
                      local.set 4
                      block  ;; label = @10
                        local.get 6
                        local.get 3
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 7
                        i32.store offset=1052344
                        i32.const 0
                        i32.const 0
                        i32.load offset=1052332
                        local.get 4
                        i32.add
                        local.tee 4
                        i32.store offset=1052332
                        local.get 7
                        local.get 4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        local.get 6
                        i32.const 0
                        i32.load offset=1052340
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 7
                        i32.store offset=1052340
                        i32.const 0
                        i32.const 0
                        i32.load offset=1052328
                        local.get 4
                        i32.add
                        local.tee 4
                        i32.store offset=1052328
                        local.get 7
                        local.get 4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 7
                        local.get 4
                        i32.add
                        local.get 4
                        i32.store
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        local.get 6
                        i32.load offset=4
                        local.tee 3
                        i32.const 3
                        i32.and
                        i32.const 1
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 3
                        i32.const -8
                        i32.and
                        local.set 8
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 3
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 6
                            i32.load offset=8
                            local.tee 5
                            local.get 3
                            i32.const 3
                            i32.shr_u
                            local.tee 9
                            i32.const 3
                            i32.shl
                            i32.const 1052360
                            i32.add
                            local.tee 0
                            i32.eq
                            drop
                            block  ;; label = @13
                              local.get 6
                              i32.load offset=12
                              local.tee 3
                              local.get 5
                              i32.ne
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=1052320
                              i32.const -2
                              local.get 9
                              i32.rotl
                              i32.and
                              i32.store offset=1052320
                              br 2 (;@11;)
                            end
                            local.get 3
                            local.get 0
                            i32.eq
                            drop
                            local.get 3
                            local.get 5
                            i32.store offset=8
                            local.get 5
                            local.get 3
                            i32.store offset=12
                            br 1 (;@11;)
                          end
                          local.get 6
                          i32.load offset=24
                          local.set 10
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 6
                              i32.load offset=12
                              local.tee 0
                              local.get 6
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 6
                              i32.load offset=8
                              local.tee 3
                              local.get 9
                              i32.lt_u
                              drop
                              local.get 0
                              local.get 3
                              i32.store offset=8
                              local.get 3
                              local.get 0
                              i32.store offset=12
                              br 1 (;@12;)
                            end
                            block  ;; label = @13
                              local.get 6
                              i32.const 20
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 5
                              br_if 0 (;@13;)
                              local.get 6
                              i32.const 16
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 5
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 0
                              br 1 (;@12;)
                            end
                            loop  ;; label = @13
                              local.get 3
                              local.set 9
                              local.get 5
                              local.tee 0
                              i32.const 20
                              i32.add
                              local.tee 3
                              i32.load
                              local.tee 5
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 16
                              i32.add
                              local.set 3
                              local.get 0
                              i32.load offset=16
                              local.tee 5
                              br_if 0 (;@13;)
                            end
                            local.get 9
                            i32.const 0
                            i32.store
                          end
                          local.get 10
                          i32.eqz
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 6
                              local.get 6
                              i32.load offset=28
                              local.tee 5
                              i32.const 2
                              i32.shl
                              i32.const 1052624
                              i32.add
                              local.tee 3
                              i32.load
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 3
                              local.get 0
                              i32.store
                              local.get 0
                              br_if 1 (;@12;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=1052324
                              i32.const -2
                              local.get 5
                              i32.rotl
                              i32.and
                              i32.store offset=1052324
                              br 2 (;@11;)
                            end
                            local.get 10
                            i32.const 16
                            i32.const 20
                            local.get 10
                            i32.load offset=16
                            local.get 6
                            i32.eq
                            select
                            i32.add
                            local.get 0
                            i32.store
                            local.get 0
                            i32.eqz
                            br_if 1 (;@11;)
                          end
                          local.get 0
                          local.get 10
                          i32.store offset=24
                          block  ;; label = @12
                            local.get 6
                            i32.load offset=16
                            local.tee 3
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 3
                            i32.store offset=16
                            local.get 3
                            local.get 0
                            i32.store offset=24
                          end
                          local.get 6
                          i32.load offset=20
                          local.tee 3
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 20
                          i32.add
                          local.get 3
                          i32.store
                          local.get 3
                          local.get 0
                          i32.store offset=24
                        end
                        local.get 8
                        local.get 4
                        i32.add
                        local.set 4
                        local.get 6
                        local.get 8
                        i32.add
                        local.tee 6
                        i32.load offset=4
                        local.set 3
                      end
                      local.get 6
                      local.get 3
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get 7
                      local.get 4
                      i32.add
                      local.get 4
                      i32.store
                      local.get 7
                      local.get 4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      block  ;; label = @10
                        local.get 4
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const -8
                        i32.and
                        i32.const 1052360
                        i32.add
                        local.set 3
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1052320
                            local.tee 5
                            i32.const 1
                            local.get 4
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 4
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 5
                            local.get 4
                            i32.or
                            i32.store offset=1052320
                            local.get 3
                            local.set 4
                            br 1 (;@11;)
                          end
                          local.get 3
                          i32.load offset=8
                          local.set 4
                        end
                        local.get 4
                        local.get 7
                        i32.store offset=12
                        local.get 3
                        local.get 7
                        i32.store offset=8
                        local.get 7
                        local.get 3
                        i32.store offset=12
                        local.get 7
                        local.get 4
                        i32.store offset=8
                        br 3 (;@7;)
                      end
                      i32.const 31
                      local.set 3
                      block  ;; label = @10
                        local.get 4
                        i32.const 16777215
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const 38
                        local.get 4
                        i32.const 8
                        i32.shr_u
                        i32.clz
                        local.tee 3
                        i32.sub
                        i32.shr_u
                        i32.const 1
                        i32.and
                        local.get 3
                        i32.const 1
                        i32.shl
                        i32.sub
                        i32.const 62
                        i32.add
                        local.set 3
                      end
                      local.get 7
                      local.get 3
                      i32.store offset=28
                      local.get 7
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 3
                      i32.const 2
                      i32.shl
                      i32.const 1052624
                      i32.add
                      local.set 5
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1052324
                        local.tee 0
                        i32.const 1
                        local.get 3
                        i32.shl
                        local.tee 9
                        i32.and
                        br_if 0 (;@10;)
                        local.get 5
                        local.get 7
                        i32.store
                        i32.const 0
                        local.get 0
                        local.get 9
                        i32.or
                        i32.store offset=1052324
                        local.get 7
                        local.get 5
                        i32.store offset=24
                        local.get 7
                        local.get 7
                        i32.store offset=8
                        local.get 7
                        local.get 7
                        i32.store offset=12
                        br 3 (;@7;)
                      end
                      local.get 4
                      i32.const 0
                      i32.const 25
                      local.get 3
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 3
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 3
                      local.get 5
                      i32.load
                      local.set 0
                      loop  ;; label = @10
                        local.get 0
                        local.tee 5
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 4
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 3
                        i32.const 29
                        i32.shr_u
                        local.set 0
                        local.get 3
                        i32.const 1
                        i32.shl
                        local.set 3
                        local.get 5
                        local.get 0
                        i32.const 4
                        i32.and
                        i32.add
                        i32.const 16
                        i32.add
                        local.tee 9
                        i32.load
                        local.tee 0
                        br_if 0 (;@10;)
                      end
                      local.get 9
                      local.get 7
                      i32.store
                      local.get 7
                      local.get 5
                      i32.store offset=24
                      local.get 7
                      local.get 7
                      i32.store offset=12
                      local.get 7
                      local.get 7
                      i32.store offset=8
                      br 2 (;@7;)
                    end
                    local.get 0
                    i32.const -8
                    local.get 0
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.const 0
                    local.get 0
                    i32.const 8
                    i32.add
                    i32.const 15
                    i32.and
                    select
                    local.tee 4
                    i32.add
                    local.tee 2
                    local.get 6
                    i32.const -56
                    i32.add
                    local.tee 9
                    local.get 4
                    i32.sub
                    local.tee 4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 9
                    i32.add
                    i32.const 56
                    i32.store offset=4
                    local.get 3
                    local.get 5
                    i32.const 55
                    local.get 5
                    i32.sub
                    i32.const 15
                    i32.and
                    i32.const 0
                    local.get 5
                    i32.const -55
                    i32.add
                    i32.const 15
                    i32.and
                    select
                    i32.add
                    i32.const -63
                    i32.add
                    local.tee 9
                    local.get 9
                    local.get 3
                    i32.const 16
                    i32.add
                    i32.lt_u
                    select
                    local.tee 9
                    i32.const 35
                    i32.store offset=4
                    i32.const 0
                    i32.const 0
                    i32.load offset=1052808
                    i32.store offset=1052348
                    i32.const 0
                    local.get 4
                    i32.store offset=1052332
                    i32.const 0
                    local.get 2
                    i32.store offset=1052344
                    local.get 9
                    i32.const 16
                    i32.add
                    i32.const 0
                    i64.load offset=1052776 align=4
                    i64.store align=4
                    local.get 9
                    i32.const 0
                    i64.load offset=1052768 align=4
                    i64.store offset=8 align=4
                    i32.const 0
                    local.get 9
                    i32.const 8
                    i32.add
                    i32.store offset=1052776
                    i32.const 0
                    local.get 6
                    i32.store offset=1052772
                    i32.const 0
                    local.get 0
                    i32.store offset=1052768
                    i32.const 0
                    i32.const 0
                    i32.store offset=1052780
                    local.get 9
                    i32.const 36
                    i32.add
                    local.set 4
                    loop  ;; label = @9
                      local.get 4
                      i32.const 7
                      i32.store
                      local.get 4
                      i32.const 4
                      i32.add
                      local.tee 4
                      local.get 5
                      i32.lt_u
                      br_if 0 (;@9;)
                    end
                    local.get 9
                    local.get 3
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 9
                    local.get 9
                    i32.load offset=4
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 9
                    local.get 9
                    local.get 3
                    i32.sub
                    local.tee 0
                    i32.store
                    local.get 3
                    local.get 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    block  ;; label = @9
                      local.get 0
                      i32.const 255
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const -8
                      i32.and
                      i32.const 1052360
                      i32.add
                      local.set 4
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1052320
                          local.tee 5
                          i32.const 1
                          local.get 0
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee 0
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 0
                          local.get 5
                          local.get 0
                          i32.or
                          i32.store offset=1052320
                          local.get 4
                          local.set 5
                          br 1 (;@10;)
                        end
                        local.get 4
                        i32.load offset=8
                        local.set 5
                      end
                      local.get 5
                      local.get 3
                      i32.store offset=12
                      local.get 4
                      local.get 3
                      i32.store offset=8
                      local.get 3
                      local.get 4
                      i32.store offset=12
                      local.get 3
                      local.get 5
                      i32.store offset=8
                      br 4 (;@5;)
                    end
                    i32.const 31
                    local.set 4
                    block  ;; label = @9
                      local.get 0
                      i32.const 16777215
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 38
                      local.get 0
                      i32.const 8
                      i32.shr_u
                      i32.clz
                      local.tee 4
                      i32.sub
                      i32.shr_u
                      i32.const 1
                      i32.and
                      local.get 4
                      i32.const 1
                      i32.shl
                      i32.sub
                      i32.const 62
                      i32.add
                      local.set 4
                    end
                    local.get 3
                    local.get 4
                    i32.store offset=28
                    local.get 3
                    i64.const 0
                    i64.store offset=16 align=4
                    local.get 4
                    i32.const 2
                    i32.shl
                    i32.const 1052624
                    i32.add
                    local.set 5
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1052324
                      local.tee 9
                      i32.const 1
                      local.get 4
                      i32.shl
                      local.tee 6
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      local.get 3
                      i32.store
                      i32.const 0
                      local.get 9
                      local.get 6
                      i32.or
                      i32.store offset=1052324
                      local.get 3
                      local.get 5
                      i32.store offset=24
                      local.get 3
                      local.get 3
                      i32.store offset=8
                      local.get 3
                      local.get 3
                      i32.store offset=12
                      br 4 (;@5;)
                    end
                    local.get 0
                    i32.const 0
                    i32.const 25
                    local.get 4
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 4
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 4
                    local.get 5
                    i32.load
                    local.set 9
                    loop  ;; label = @9
                      local.get 9
                      local.tee 5
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.get 0
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 4
                      i32.const 29
                      i32.shr_u
                      local.set 9
                      local.get 4
                      i32.const 1
                      i32.shl
                      local.set 4
                      local.get 5
                      local.get 9
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      local.tee 6
                      i32.load
                      local.tee 9
                      br_if 0 (;@9;)
                    end
                    local.get 6
                    local.get 3
                    i32.store
                    local.get 3
                    local.get 5
                    i32.store offset=24
                    local.get 3
                    local.get 3
                    i32.store offset=12
                    local.get 3
                    local.get 3
                    i32.store offset=8
                    br 3 (;@5;)
                  end
                  local.get 5
                  i32.load offset=8
                  local.tee 4
                  local.get 7
                  i32.store offset=12
                  local.get 5
                  local.get 7
                  i32.store offset=8
                  local.get 7
                  i32.const 0
                  i32.store offset=24
                  local.get 7
                  local.get 5
                  i32.store offset=12
                  local.get 7
                  local.get 4
                  i32.store offset=8
                end
                local.get 2
                i32.const 8
                i32.add
                local.set 4
                br 5 (;@1;)
              end
              local.get 5
              i32.load offset=8
              local.tee 4
              local.get 3
              i32.store offset=12
              local.get 5
              local.get 3
              i32.store offset=8
              local.get 3
              i32.const 0
              i32.store offset=24
              local.get 3
              local.get 5
              i32.store offset=12
              local.get 3
              local.get 4
              i32.store offset=8
            end
            i32.const 0
            i32.load offset=1052332
            local.tee 4
            local.get 7
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=1052344
            local.tee 3
            local.get 7
            i32.add
            local.tee 5
            local.get 4
            local.get 7
            i32.sub
            local.tee 4
            i32.const 1
            i32.or
            i32.store offset=4
            i32.const 0
            local.get 4
            i32.store offset=1052332
            i32.const 0
            local.get 5
            i32.store offset=1052344
            local.get 3
            local.get 7
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 3
            i32.const 8
            i32.add
            local.set 4
            br 3 (;@1;)
          end
          i32.const 0
          local.set 4
          i32.const 0
          i32.const 48
          i32.store offset=1052816
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 2
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 9
              local.get 9
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 1052624
              i32.add
              local.tee 4
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              local.get 0
              i32.store
              local.get 0
              br_if 1 (;@4;)
              i32.const 0
              local.get 10
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              local.tee 10
              i32.store offset=1052324
              br 2 (;@3;)
            end
            local.get 2
            i32.const 16
            i32.const 20
            local.get 2
            i32.load offset=16
            local.get 9
            i32.eq
            select
            i32.add
            local.get 0
            i32.store
            local.get 0
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 2
          i32.store offset=24
          block  ;; label = @4
            local.get 9
            i32.load offset=16
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 4
            i32.store offset=16
            local.get 4
            local.get 0
            i32.store offset=24
          end
          local.get 9
          i32.const 20
          i32.add
          i32.load
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 20
          i32.add
          local.get 4
          i32.store
          local.get 4
          local.get 0
          i32.store offset=24
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
            local.get 9
            local.get 3
            local.get 7
            i32.add
            local.tee 4
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 9
            local.get 4
            i32.add
            local.tee 4
            local.get 4
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 9
          local.get 7
          i32.add
          local.tee 0
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 9
          local.get 7
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 3
          i32.store
          block  ;; label = @4
            local.get 3
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const -8
            i32.and
            i32.const 1052360
            i32.add
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1052320
                local.tee 5
                i32.const 1
                local.get 3
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 3
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 5
                local.get 3
                i32.or
                i32.store offset=1052320
                local.get 4
                local.set 3
                br 1 (;@5;)
              end
              local.get 4
              i32.load offset=8
              local.set 3
            end
            local.get 3
            local.get 0
            i32.store offset=12
            local.get 4
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 4
            i32.store offset=12
            local.get 0
            local.get 3
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 4
          block  ;; label = @4
            local.get 3
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const 38
            local.get 3
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 4
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 4
            i32.const 1
            i32.shl
            i32.sub
            i32.const 62
            i32.add
            local.set 4
          end
          local.get 0
          local.get 4
          i32.store offset=28
          local.get 0
          i64.const 0
          i64.store offset=16 align=4
          local.get 4
          i32.const 2
          i32.shl
          i32.const 1052624
          i32.add
          local.set 5
          block  ;; label = @4
            local.get 10
            i32.const 1
            local.get 4
            i32.shl
            local.tee 7
            i32.and
            br_if 0 (;@4;)
            local.get 5
            local.get 0
            i32.store
            i32.const 0
            local.get 10
            local.get 7
            i32.or
            i32.store offset=1052324
            local.get 0
            local.get 5
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 0
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.const 25
          local.get 4
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 4
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 4
          local.get 5
          i32.load
          local.set 7
          block  ;; label = @4
            loop  ;; label = @5
              local.get 7
              local.tee 5
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 3
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const 29
              i32.shr_u
              local.set 7
              local.get 4
              i32.const 1
              i32.shl
              local.set 4
              local.get 5
              local.get 7
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 6
              i32.load
              local.tee 7
              br_if 0 (;@5;)
            end
            local.get 6
            local.get 0
            i32.store
            local.get 0
            local.get 5
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=12
            local.get 0
            local.get 0
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 5
          i32.load offset=8
          local.tee 4
          local.get 0
          i32.store offset=12
          local.get 5
          local.get 0
          i32.store offset=8
          local.get 0
          i32.const 0
          i32.store offset=24
          local.get 0
          local.get 5
          i32.store offset=12
          local.get 0
          local.get 4
          i32.store offset=8
        end
        local.get 9
        i32.const 8
        i32.add
        local.set 4
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 11
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 0
            i32.load offset=28
            local.tee 5
            i32.const 2
            i32.shl
            i32.const 1052624
            i32.add
            local.tee 4
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 4
            local.get 9
            i32.store
            local.get 9
            br_if 1 (;@3;)
            i32.const 0
            local.get 10
            i32.const -2
            local.get 5
            i32.rotl
            i32.and
            i32.store offset=1052324
            br 2 (;@2;)
          end
          local.get 11
          i32.const 16
          i32.const 20
          local.get 11
          i32.load offset=16
          local.get 0
          i32.eq
          select
          i32.add
          local.get 9
          i32.store
          local.get 9
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 9
        local.get 11
        i32.store offset=24
        block  ;; label = @3
          local.get 0
          i32.load offset=16
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 9
          local.get 4
          i32.store offset=16
          local.get 4
          local.get 9
          i32.store offset=24
        end
        local.get 0
        i32.const 20
        i32.add
        i32.load
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 9
        i32.const 20
        i32.add
        local.get 4
        i32.store
        local.get 4
        local.get 9
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          local.get 7
          i32.add
          local.tee 4
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 4
          i32.add
          local.tee 4
          local.get 4
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 0
        local.get 7
        i32.add
        local.tee 5
        local.get 3
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        local.get 7
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 5
        local.get 3
        i32.add
        local.get 3
        i32.store
        block  ;; label = @3
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.const -8
          i32.and
          i32.const 1052360
          i32.add
          local.set 7
          i32.const 0
          i32.load offset=1052340
          local.set 4
          block  ;; label = @4
            block  ;; label = @5
              i32.const 1
              local.get 8
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 9
              local.get 6
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 9
              local.get 6
              i32.or
              i32.store offset=1052320
              local.get 7
              local.set 9
              br 1 (;@4;)
            end
            local.get 7
            i32.load offset=8
            local.set 9
          end
          local.get 9
          local.get 4
          i32.store offset=12
          local.get 7
          local.get 4
          i32.store offset=8
          local.get 4
          local.get 7
          i32.store offset=12
          local.get 4
          local.get 9
          i32.store offset=8
        end
        i32.const 0
        local.get 5
        i32.store offset=1052340
        i32.const 0
        local.get 3
        i32.store offset=1052328
      end
      local.get 0
      i32.const 8
      i32.add
      local.set 4
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $free (type 1) (param i32)
    local.get 0
    call $dlfree)
  (func $dlfree (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -8
      i32.add
      local.tee 1
      local.get 0
      i32.const -4
      i32.add
      i32.load
      local.tee 2
      i32.const -8
      i32.and
      local.tee 0
      i32.add
      local.set 3
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 1
        i32.load
        local.tee 2
        i32.sub
        local.tee 1
        i32.const 0
        i32.load offset=1052336
        local.tee 4
        i32.lt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.add
        local.set 0
        block  ;; label = @3
          local.get 1
          i32.const 0
          i32.load offset=1052340
          i32.eq
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 2
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=8
            local.tee 4
            local.get 2
            i32.const 3
            i32.shr_u
            local.tee 5
            i32.const 3
            i32.shl
            i32.const 1052360
            i32.add
            local.tee 6
            i32.eq
            drop
            block  ;; label = @5
              local.get 1
              i32.load offset=12
              local.tee 2
              local.get 4
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=1052320
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1052320
              br 3 (;@2;)
            end
            local.get 2
            local.get 6
            i32.eq
            drop
            local.get 2
            local.get 4
            i32.store offset=8
            local.get 4
            local.get 2
            i32.store offset=12
            br 2 (;@2;)
          end
          local.get 1
          i32.load offset=24
          local.set 7
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=12
              local.tee 6
              local.get 1
              i32.eq
              br_if 0 (;@5;)
              local.get 1
              i32.load offset=8
              local.tee 2
              local.get 4
              i32.lt_u
              drop
              local.get 6
              local.get 2
              i32.store offset=8
              local.get 2
              local.get 6
              i32.store offset=12
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 1
              i32.const 20
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              local.get 1
              i32.const 16
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              br 1 (;@4;)
            end
            loop  ;; label = @5
              local.get 2
              local.set 5
              local.get 4
              local.tee 6
              i32.const 20
              i32.add
              local.tee 2
              i32.load
              local.tee 4
              br_if 0 (;@5;)
              local.get 6
              i32.const 16
              i32.add
              local.set 2
              local.get 6
              i32.load offset=16
              local.tee 4
              br_if 0 (;@5;)
            end
            local.get 5
            i32.const 0
            i32.store
          end
          local.get 7
          i32.eqz
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              local.get 1
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 1052624
              i32.add
              local.tee 2
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              local.get 6
              i32.store
              local.get 6
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=1052324
              i32.const -2
              local.get 4
              i32.rotl
              i32.and
              i32.store offset=1052324
              br 3 (;@2;)
            end
            local.get 7
            i32.const 16
            i32.const 20
            local.get 7
            i32.load offset=16
            local.get 1
            i32.eq
            select
            i32.add
            local.get 6
            i32.store
            local.get 6
            i32.eqz
            br_if 2 (;@2;)
          end
          local.get 6
          local.get 7
          i32.store offset=24
          block  ;; label = @4
            local.get 1
            i32.load offset=16
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 2
            i32.store offset=16
            local.get 2
            local.get 6
            i32.store offset=24
          end
          local.get 1
          i32.load offset=20
          local.tee 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 6
          i32.const 20
          i32.add
          local.get 2
          i32.store
          local.get 2
          local.get 6
          i32.store offset=24
          br 1 (;@2;)
        end
        local.get 3
        i32.load offset=4
        local.tee 2
        i32.const 3
        i32.and
        i32.const 3
        i32.ne
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.const -2
        i32.and
        i32.store offset=4
        i32.const 0
        local.get 0
        i32.store offset=1052328
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
        return
      end
      local.get 1
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=4
      local.tee 2
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 3
            i32.const 0
            i32.load offset=1052344
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=1052344
            i32.const 0
            i32.const 0
            i32.load offset=1052332
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=1052332
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            i32.const 0
            i32.load offset=1052340
            i32.ne
            br_if 3 (;@1;)
            i32.const 0
            i32.const 0
            i32.store offset=1052328
            i32.const 0
            i32.const 0
            i32.store offset=1052340
            return
          end
          block  ;; label = @4
            local.get 3
            i32.const 0
            i32.load offset=1052340
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            i32.store offset=1052340
            i32.const 0
            i32.const 0
            i32.load offset=1052328
            local.get 0
            i32.add
            local.tee 0
            i32.store offset=1052328
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 0
            i32.add
            local.get 0
            i32.store
            return
          end
          local.get 2
          i32.const -8
          i32.and
          local.get 0
          i32.add
          local.set 0
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 3
              i32.load offset=8
              local.tee 4
              local.get 2
              i32.const 3
              i32.shr_u
              local.tee 5
              i32.const 3
              i32.shl
              i32.const 1052360
              i32.add
              local.tee 6
              i32.eq
              drop
              block  ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 2
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 0
                i32.load offset=1052320
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=1052320
                br 2 (;@4;)
              end
              local.get 2
              local.get 6
              i32.eq
              drop
              local.get 2
              local.get 4
              i32.store offset=8
              local.get 4
              local.get 2
              i32.store offset=12
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=24
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 6
                local.get 3
                i32.eq
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=8
                local.tee 2
                i32.const 0
                i32.load offset=1052336
                i32.lt_u
                drop
                local.get 6
                local.get 2
                i32.store offset=8
                local.get 2
                local.get 6
                i32.store offset=12
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 3
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 3
                i32.const 16
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 2
                local.set 5
                local.get 4
                local.tee 6
                i32.const 20
                i32.add
                local.tee 2
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 2
                local.get 6
                i32.load offset=16
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                local.get 3
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 1052624
                i32.add
                local.tee 2
                i32.load
                i32.ne
                br_if 0 (;@6;)
                local.get 2
                local.get 6
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=1052324
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=1052324
                br 2 (;@4;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 3
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 6
            local.get 7
            i32.store offset=24
            block  ;; label = @5
              local.get 3
              i32.load offset=16
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 2
              i32.store offset=16
              local.get 2
              local.get 6
              i32.store offset=24
            end
            local.get 3
            i32.load offset=20
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.const 20
            i32.add
            local.get 2
            i32.store
            local.get 2
            local.get 6
            i32.store offset=24
          end
          local.get 1
          local.get 0
          i32.add
          local.get 0
          i32.store
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          i32.const 0
          i32.load offset=1052340
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 0
          i32.store offset=1052328
          return
        end
        local.get 3
        local.get 2
        i32.const -2
        i32.and
        i32.store offset=4
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
      end
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.and
        i32.const 1052360
        i32.add
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1052320
            local.tee 4
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 0
            i32.or
            i32.store offset=1052320
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.set 0
        end
        local.get 0
        local.get 1
        i32.store offset=12
        local.get 2
        local.get 1
        i32.store offset=8
        local.get 1
        local.get 2
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 2
      block  ;; label = @2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 38
        local.get 0
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 2
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 2
      end
      local.get 1
      local.get 2
      i32.store offset=28
      local.get 1
      i64.const 0
      i64.store offset=16 align=4
      local.get 2
      i32.const 2
      i32.shl
      i32.const 1052624
      i32.add
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1052324
          local.tee 6
          i32.const 1
          local.get 2
          i32.shl
          local.tee 3
          i32.and
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.store
          i32.const 0
          local.get 6
          local.get 3
          i32.or
          i32.store offset=1052324
          local.get 1
          local.get 4
          i32.store offset=24
          local.get 1
          local.get 1
          i32.store offset=8
          local.get 1
          local.get 1
          i32.store offset=12
          br 1 (;@2;)
        end
        local.get 0
        i32.const 0
        i32.const 25
        local.get 2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get 2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set 2
        local.get 4
        i32.load
        local.set 6
        block  ;; label = @3
          loop  ;; label = @4
            local.get 6
            local.tee 4
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 0
            i32.eq
            br_if 1 (;@3;)
            local.get 2
            i32.const 29
            i32.shr_u
            local.set 6
            local.get 2
            i32.const 1
            i32.shl
            local.set 2
            local.get 4
            local.get 6
            i32.const 4
            i32.and
            i32.add
            i32.const 16
            i32.add
            local.tee 3
            i32.load
            local.tee 6
            br_if 0 (;@4;)
          end
          local.get 3
          local.get 1
          i32.store
          local.get 1
          local.get 4
          i32.store offset=24
          local.get 1
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 1
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=8
        local.tee 0
        local.get 1
        i32.store offset=12
        local.get 4
        local.get 1
        i32.store offset=8
        local.get 1
        i32.const 0
        i32.store offset=24
        local.get 1
        local.get 4
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
      end
      i32.const 0
      i32.const 0
      i32.load offset=1052352
      i32.const -1
      i32.add
      local.tee 1
      i32.const -1
      local.get 1
      select
      i32.store offset=1052352
    end)
  (func $calloc (type 6) (param i32 i32) (result i32)
    (local i32 i64)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      i64.extend_i32_u
      local.get 1
      i64.extend_i32_u
      i64.mul
      local.tee 3
      i32.wrap_i64
      local.set 2
      local.get 1
      local.get 0
      i32.or
      i32.const 65536
      i32.lt_u
      br_if 0 (;@1;)
      i32.const -1
      local.get 2
      local.get 3
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      i32.const 0
      i32.ne
      select
      local.set 2
    end
    block  ;; label = @1
      local.get 2
      call $dlmalloc
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -4
      i32.add
      i32.load8_u
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 2
      call $memset
      drop
    end
    local.get 0)
  (func $realloc (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      local.get 1
      call $dlmalloc
      return
    end
    block  ;; label = @1
      local.get 1
      i32.const -64
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 48
      i32.store offset=1052816
      i32.const 0
      return
    end
    i32.const 16
    local.get 1
    i32.const 19
    i32.add
    i32.const -16
    i32.and
    local.get 1
    i32.const 11
    i32.lt_u
    select
    local.set 2
    local.get 0
    i32.const -4
    i32.add
    local.tee 3
    i32.load
    local.tee 4
    i32.const -8
    i32.and
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 2
          i32.const 256
          i32.lt_u
          br_if 1 (;@2;)
          local.get 5
          local.get 2
          i32.const 4
          i32.or
          i32.lt_u
          br_if 1 (;@2;)
          local.get 5
          local.get 2
          i32.sub
          i32.const 0
          i32.load offset=1052800
          i32.const 1
          i32.shl
          i32.le_u
          br_if 2 (;@1;)
          br 1 (;@2;)
        end
        local.get 0
        i32.const -8
        i32.add
        local.tee 6
        local.get 5
        i32.add
        local.set 7
        block  ;; label = @3
          local.get 5
          local.get 2
          i32.lt_u
          br_if 0 (;@3;)
          local.get 5
          local.get 2
          i32.sub
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 2 (;@1;)
          local.get 3
          local.get 2
          local.get 4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 6
          local.get 2
          i32.add
          local.tee 2
          local.get 1
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 7
          local.get 7
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 1
          call $dispose_chunk
          local.get 0
          return
        end
        block  ;; label = @3
          local.get 7
          i32.const 0
          i32.load offset=1052344
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1052332
          local.get 5
          i32.add
          local.tee 5
          local.get 2
          i32.le_u
          br_if 1 (;@2;)
          local.get 3
          local.get 2
          local.get 4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          i32.const 0
          local.get 6
          local.get 2
          i32.add
          local.tee 1
          i32.store offset=1052344
          i32.const 0
          local.get 5
          local.get 2
          i32.sub
          local.tee 2
          i32.store offset=1052332
          local.get 1
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          return
        end
        block  ;; label = @3
          local.get 7
          i32.const 0
          i32.load offset=1052340
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1052328
          local.get 5
          i32.add
          local.tee 5
          local.get 2
          i32.lt_u
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 5
              local.get 2
              i32.sub
              local.tee 1
              i32.const 16
              i32.lt_u
              br_if 0 (;@5;)
              local.get 3
              local.get 2
              local.get 4
              i32.const 1
              i32.and
              i32.or
              i32.const 2
              i32.or
              i32.store
              local.get 6
              local.get 2
              i32.add
              local.tee 2
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 6
              local.get 5
              i32.add
              local.tee 5
              local.get 1
              i32.store
              local.get 5
              local.get 5
              i32.load offset=4
              i32.const -2
              i32.and
              i32.store offset=4
              br 1 (;@4;)
            end
            local.get 3
            local.get 4
            i32.const 1
            i32.and
            local.get 5
            i32.or
            i32.const 2
            i32.or
            i32.store
            local.get 6
            local.get 5
            i32.add
            local.tee 1
            local.get 1
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            i32.const 0
            local.set 1
            i32.const 0
            local.set 2
          end
          i32.const 0
          local.get 2
          i32.store offset=1052340
          i32.const 0
          local.get 1
          i32.store offset=1052328
          local.get 0
          return
        end
        local.get 7
        i32.load offset=4
        local.tee 8
        i32.const 2
        i32.and
        br_if 0 (;@2;)
        local.get 8
        i32.const -8
        i32.and
        local.get 5
        i32.add
        local.tee 9
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 9
        local.get 2
        i32.sub
        local.set 10
        block  ;; label = @3
          block  ;; label = @4
            local.get 8
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 7
            i32.load offset=8
            local.tee 1
            local.get 8
            i32.const 3
            i32.shr_u
            local.tee 11
            i32.const 3
            i32.shl
            i32.const 1052360
            i32.add
            local.tee 8
            i32.eq
            drop
            block  ;; label = @5
              local.get 7
              i32.load offset=12
              local.tee 5
              local.get 1
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=1052320
              i32.const -2
              local.get 11
              i32.rotl
              i32.and
              i32.store offset=1052320
              br 2 (;@3;)
            end
            local.get 5
            local.get 8
            i32.eq
            drop
            local.get 5
            local.get 1
            i32.store offset=8
            local.get 1
            local.get 5
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 7
          i32.load offset=24
          local.set 12
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.load offset=12
              local.tee 8
              local.get 7
              i32.eq
              br_if 0 (;@5;)
              local.get 7
              i32.load offset=8
              local.tee 1
              i32.const 0
              i32.load offset=1052336
              i32.lt_u
              drop
              local.get 8
              local.get 1
              i32.store offset=8
              local.get 1
              local.get 8
              i32.store offset=12
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 7
              i32.const 20
              i32.add
              local.tee 1
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              local.get 7
              i32.const 16
              i32.add
              local.tee 1
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              i32.const 0
              local.set 8
              br 1 (;@4;)
            end
            loop  ;; label = @5
              local.get 1
              local.set 11
              local.get 5
              local.tee 8
              i32.const 20
              i32.add
              local.tee 1
              i32.load
              local.tee 5
              br_if 0 (;@5;)
              local.get 8
              i32.const 16
              i32.add
              local.set 1
              local.get 8
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
            end
            local.get 11
            i32.const 0
            i32.store
          end
          local.get 12
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              local.get 7
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 1052624
              i32.add
              local.tee 1
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 1
              local.get 8
              i32.store
              local.get 8
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=1052324
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1052324
              br 2 (;@3;)
            end
            local.get 12
            i32.const 16
            i32.const 20
            local.get 12
            i32.load offset=16
            local.get 7
            i32.eq
            select
            i32.add
            local.get 8
            i32.store
            local.get 8
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 8
          local.get 12
          i32.store offset=24
          block  ;; label = @4
            local.get 7
            i32.load offset=16
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 8
            local.get 1
            i32.store offset=16
            local.get 1
            local.get 8
            i32.store offset=24
          end
          local.get 7
          i32.load offset=20
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.const 20
          i32.add
          local.get 1
          i32.store
          local.get 1
          local.get 8
          i32.store offset=24
        end
        block  ;; label = @3
          local.get 10
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 3
          local.get 4
          i32.const 1
          i32.and
          local.get 9
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 6
          local.get 9
          i32.add
          local.tee 1
          local.get 1
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          return
        end
        local.get 3
        local.get 2
        local.get 4
        i32.const 1
        i32.and
        i32.or
        i32.const 2
        i32.or
        i32.store
        local.get 6
        local.get 2
        i32.add
        local.tee 1
        local.get 10
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 6
        local.get 9
        i32.add
        local.tee 2
        local.get 2
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 10
        call $dispose_chunk
        local.get 0
        return
      end
      block  ;; label = @2
        local.get 1
        call $dlmalloc
        local.tee 2
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 2
      local.get 0
      i32.const -4
      i32.const -8
      local.get 3
      i32.load
      local.tee 5
      i32.const 3
      i32.and
      select
      local.get 5
      i32.const -8
      i32.and
      i32.add
      local.tee 5
      local.get 1
      local.get 5
      local.get 1
      i32.lt_u
      select
      call $memcpy
      local.set 1
      local.get 0
      call $dlfree
      local.get 1
      local.set 0
    end
    local.get 0)
  (func $dispose_chunk (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.add
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        i32.add
        local.set 1
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 3
            i32.sub
            local.tee 0
            i32.const 0
            i32.load offset=1052340
            i32.eq
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 3
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=8
              local.tee 4
              local.get 3
              i32.const 3
              i32.shr_u
              local.tee 5
              i32.const 3
              i32.shl
              i32.const 1052360
              i32.add
              local.tee 6
              i32.eq
              drop
              local.get 0
              i32.load offset=12
              local.tee 3
              local.get 4
              i32.ne
              br_if 2 (;@3;)
              i32.const 0
              i32.const 0
              i32.load offset=1052320
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=1052320
              br 3 (;@2;)
            end
            local.get 0
            i32.load offset=24
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=12
                local.tee 6
                local.get 0
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                i32.load offset=8
                local.tee 3
                i32.const 0
                i32.load offset=1052336
                i32.lt_u
                drop
                local.get 6
                local.get 3
                i32.store offset=8
                local.get 3
                local.get 6
                i32.store offset=12
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 0
                i32.const 20
                i32.add
                local.tee 3
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 0
                i32.const 16
                i32.add
                local.tee 3
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 3
                local.set 5
                local.get 4
                local.tee 6
                i32.const 20
                i32.add
                local.tee 3
                i32.load
                local.tee 4
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 3
                local.get 6
                i32.load offset=16
                local.tee 4
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                local.get 0
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 1052624
                i32.add
                local.tee 3
                i32.load
                i32.ne
                br_if 0 (;@6;)
                local.get 3
                local.get 6
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=1052324
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=1052324
                br 4 (;@2;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 0
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              i32.eqz
              br_if 3 (;@2;)
            end
            local.get 6
            local.get 7
            i32.store offset=24
            block  ;; label = @5
              local.get 0
              i32.load offset=16
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 3
              i32.store offset=16
              local.get 3
              local.get 6
              i32.store offset=24
            end
            local.get 0
            i32.load offset=20
            local.tee 3
            i32.eqz
            br_if 2 (;@2;)
            local.get 6
            i32.const 20
            i32.add
            local.get 3
            i32.store
            local.get 3
            local.get 6
            i32.store offset=24
            br 2 (;@2;)
          end
          local.get 2
          i32.load offset=4
          local.tee 3
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          local.get 2
          local.get 3
          i32.const -2
          i32.and
          i32.store offset=4
          i32.const 0
          local.get 1
          i32.store offset=1052328
          local.get 2
          local.get 1
          i32.store
          local.get 0
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          return
        end
        local.get 3
        local.get 6
        i32.eq
        drop
        local.get 3
        local.get 4
        i32.store offset=8
        local.get 4
        local.get 3
        i32.store offset=12
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.load offset=4
          local.tee 3
          i32.const 2
          i32.and
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 2
            i32.const 0
            i32.load offset=1052344
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            i32.store offset=1052344
            i32.const 0
            i32.const 0
            i32.load offset=1052332
            local.get 1
            i32.add
            local.tee 1
            i32.store offset=1052332
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.load offset=1052340
            i32.ne
            br_if 3 (;@1;)
            i32.const 0
            i32.const 0
            i32.store offset=1052328
            i32.const 0
            i32.const 0
            i32.store offset=1052340
            return
          end
          block  ;; label = @4
            local.get 2
            i32.const 0
            i32.load offset=1052340
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.get 0
            i32.store offset=1052340
            i32.const 0
            i32.const 0
            i32.load offset=1052328
            local.get 1
            i32.add
            local.tee 1
            i32.store offset=1052328
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 1
            i32.add
            local.get 1
            i32.store
            return
          end
          local.get 3
          i32.const -8
          i32.and
          local.get 1
          i32.add
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=8
              local.tee 4
              local.get 3
              i32.const 3
              i32.shr_u
              local.tee 5
              i32.const 3
              i32.shl
              i32.const 1052360
              i32.add
              local.tee 6
              i32.eq
              drop
              block  ;; label = @6
                local.get 2
                i32.load offset=12
                local.tee 3
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.const 0
                i32.load offset=1052320
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=1052320
                br 2 (;@4;)
              end
              local.get 3
              local.get 6
              i32.eq
              drop
              local.get 3
              local.get 4
              i32.store offset=8
              local.get 4
              local.get 3
              i32.store offset=12
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=24
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.load offset=12
                local.tee 6
                local.get 2
                i32.eq
                br_if 0 (;@6;)
                local.get 2
                i32.load offset=8
                local.tee 3
                i32.const 0
                i32.load offset=1052336
                i32.lt_u
                drop
                local.get 6
                local.get 3
                i32.store offset=8
                local.get 3
                local.get 6
                i32.store offset=12
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 2
                i32.const 20
                i32.add
                local.tee 4
                i32.load
                local.tee 3
                br_if 0 (;@6;)
                local.get 2
                i32.const 16
                i32.add
                local.tee 4
                i32.load
                local.tee 3
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 4
                local.set 5
                local.get 3
                local.tee 6
                i32.const 20
                i32.add
                local.tee 4
                i32.load
                local.tee 3
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 4
                local.get 6
                i32.load offset=16
                local.tee 3
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
            end
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                local.get 2
                i32.load offset=28
                local.tee 4
                i32.const 2
                i32.shl
                i32.const 1052624
                i32.add
                local.tee 3
                i32.load
                i32.ne
                br_if 0 (;@6;)
                local.get 3
                local.get 6
                i32.store
                local.get 6
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=1052324
                i32.const -2
                local.get 4
                i32.rotl
                i32.and
                i32.store offset=1052324
                br 2 (;@4;)
              end
              local.get 7
              i32.const 16
              i32.const 20
              local.get 7
              i32.load offset=16
              local.get 2
              i32.eq
              select
              i32.add
              local.get 6
              i32.store
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 6
            local.get 7
            i32.store offset=24
            block  ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 3
              i32.store offset=16
              local.get 3
              local.get 6
              i32.store offset=24
            end
            local.get 2
            i32.load offset=20
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.const 20
            i32.add
            local.get 3
            i32.store
            local.get 3
            local.get 6
            i32.store offset=24
          end
          local.get 0
          local.get 1
          i32.add
          local.get 1
          i32.store
          local.get 0
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          i32.const 0
          i32.load offset=1052340
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 1
          i32.store offset=1052328
          return
        end
        local.get 2
        local.get 3
        i32.const -2
        i32.and
        i32.store offset=4
        local.get 0
        local.get 1
        i32.add
        local.get 1
        i32.store
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
      end
      block  ;; label = @2
        local.get 1
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const -8
        i32.and
        i32.const 1052360
        i32.add
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=1052320
            local.tee 4
            i32.const 1
            local.get 1
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 1
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 1
            i32.or
            i32.store offset=1052320
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 3
          i32.load offset=8
          local.set 1
        end
        local.get 1
        local.get 0
        i32.store offset=12
        local.get 3
        local.get 0
        i32.store offset=8
        local.get 0
        local.get 3
        i32.store offset=12
        local.get 0
        local.get 1
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 3
      block  ;; label = @2
        local.get 1
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 38
        local.get 1
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 3
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 3
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 3
      end
      local.get 0
      local.get 3
      i32.store offset=28
      local.get 0
      i64.const 0
      i64.store offset=16 align=4
      local.get 3
      i32.const 2
      i32.shl
      i32.const 1052624
      i32.add
      local.set 4
      block  ;; label = @2
        i32.const 0
        i32.load offset=1052324
        local.tee 6
        i32.const 1
        local.get 3
        i32.shl
        local.tee 2
        i32.and
        br_if 0 (;@2;)
        local.get 4
        local.get 0
        i32.store
        i32.const 0
        local.get 6
        local.get 2
        i32.or
        i32.store offset=1052324
        local.get 0
        local.get 4
        i32.store offset=24
        local.get 0
        local.get 0
        i32.store offset=8
        local.get 0
        local.get 0
        i32.store offset=12
        return
      end
      local.get 1
      i32.const 0
      i32.const 25
      local.get 3
      i32.const 1
      i32.shr_u
      i32.sub
      local.get 3
      i32.const 31
      i32.eq
      select
      i32.shl
      local.set 3
      local.get 4
      i32.load
      local.set 6
      block  ;; label = @2
        loop  ;; label = @3
          local.get 6
          local.tee 4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 3
          i32.const 29
          i32.shr_u
          local.set 6
          local.get 3
          i32.const 1
          i32.shl
          local.set 3
          local.get 4
          local.get 6
          i32.const 4
          i32.and
          i32.add
          i32.const 16
          i32.add
          local.tee 2
          i32.load
          local.tee 6
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        i32.store
        local.get 0
        local.get 4
        i32.store offset=24
        local.get 0
        local.get 0
        i32.store offset=12
        local.get 0
        local.get 0
        i32.store offset=8
        return
      end
      local.get 4
      i32.load offset=8
      local.tee 1
      local.get 0
      i32.store offset=12
      local.get 4
      local.get 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 0
      local.get 4
      i32.store offset=12
      local.get 0
      local.get 1
      i32.store offset=8
    end)
  (func $internal_memalign (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 16
        local.get 0
        i32.const 16
        i32.gt_u
        select
        local.tee 2
        local.get 2
        i32.const -1
        i32.add
        i32.and
        br_if 0 (;@2;)
        local.get 2
        local.set 0
        br 1 (;@1;)
      end
      i32.const 32
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.tee 0
        i32.const 1
        i32.shl
        local.set 3
        local.get 0
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      i32.const -64
      local.get 0
      i32.sub
      local.get 1
      i32.gt_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 48
      i32.store offset=1052816
      i32.const 0
      return
    end
    block  ;; label = @1
      local.get 0
      i32.const 16
      local.get 1
      i32.const 19
      i32.add
      i32.const -16
      i32.and
      local.get 1
      i32.const 11
      i32.lt_u
      select
      local.tee 1
      i32.add
      i32.const 12
      i32.add
      call $dlmalloc
      local.tee 3
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 3
    i32.const -8
    i32.add
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const -1
        i32.add
        local.get 3
        i32.and
        br_if 0 (;@2;)
        local.get 2
        local.set 0
        br 1 (;@1;)
      end
      local.get 3
      i32.const -4
      i32.add
      local.tee 4
      i32.load
      local.tee 5
      i32.const -8
      i32.and
      local.get 3
      local.get 0
      i32.add
      i32.const -1
      i32.add
      i32.const 0
      local.get 0
      i32.sub
      i32.and
      i32.const -8
      i32.add
      local.tee 3
      i32.const 0
      local.get 0
      local.get 3
      local.get 2
      i32.sub
      i32.const 15
      i32.gt_u
      select
      i32.add
      local.tee 0
      local.get 2
      i32.sub
      local.tee 3
      i32.sub
      local.set 6
      block  ;; label = @2
        local.get 5
        i32.const 3
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 6
        i32.store offset=4
        local.get 0
        local.get 2
        i32.load
        local.get 3
        i32.add
        i32.store
        br 1 (;@1;)
      end
      local.get 0
      local.get 6
      local.get 0
      i32.load offset=4
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 6
      i32.add
      local.tee 6
      local.get 6
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 4
      local.get 3
      local.get 4
      i32.load
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store
      local.get 2
      local.get 3
      i32.add
      local.tee 6
      local.get 6
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 2
      local.get 3
      call $dispose_chunk
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 3
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const -8
      i32.and
      local.tee 2
      local.get 1
      i32.const 16
      i32.add
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 3
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 1
      i32.add
      local.tee 3
      local.get 2
      local.get 1
      i32.sub
      local.tee 1
      i32.const 3
      i32.or
      i32.store offset=4
      local.get 0
      local.get 2
      i32.add
      local.tee 2
      local.get 2
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 3
      local.get 1
      call $dispose_chunk
    end
    local.get 0
    i32.const 8
    i32.add)
  (func $aligned_alloc (type 6) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const 16
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      call $dlmalloc
      return
    end
    local.get 0
    local.get 1
    call $internal_memalign)
  (func $_Exit (type 1) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $__wasilibc_ensure_environ (type 0)
    block  ;; label = @1
      i32.const 0
      i32.load offset=1052196
      i32.const -1
      i32.ne
      br_if 0 (;@1;)
      call $__wasilibc_initialize_environ
    end)
  (func $__wasilibc_initialize_environ (type 0)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 12
        i32.add
        local.get 0
        i32.const 8
        i32.add
        call $__wasi_environ_sizes_get
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          i32.load offset=12
          local.tee 1
          br_if 0 (;@3;)
          i32.const 1052820
          local.set 1
          br 2 (;@1;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=8
            call $malloc
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 4
            call $calloc
            local.tee 1
            br_if 1 (;@3;)
            local.get 2
            call $free
          end
          i32.const 70
          call $_Exit
          unreachable
        end
        local.get 1
        local.get 2
        call $__wasi_environ_get
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        call $free
        local.get 1
        call $free
      end
      i32.const 71
      call $_Exit
      unreachable
    end
    i32.const 0
    local.get 1
    i32.store offset=1052196
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $__wasi_environ_get (type 6) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_environ_get
    i32.const 65535
    i32.and)
  (func $__wasi_environ_sizes_get (type 6) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_environ_sizes_get
    i32.const 65535
    i32.and)
  (func $__wasi_proc_exit (type 1) (param i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_proc_exit
    unreachable)
  (func $abort (type 0)
    unreachable
    unreachable)
  (func $getcwd (type 6) (param i32 i32) (result i32)
    (local i32)
    i32.const 0
    i32.load offset=1052200
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        local.get 2
        call $strdup
        local.tee 0
        br_if 1 (;@1;)
        i32.const 0
        i32.const 48
        i32.store offset=1052816
        i32.const 0
        return
      end
      block  ;; label = @2
        local.get 2
        call $strlen
        i32.const 1
        i32.add
        local.get 1
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 2
        call $strcpy
        return
      end
      i32.const 0
      local.set 0
      i32.const 0
      i32.const 68
      i32.store offset=1052816
    end
    local.get 0)
  (func $sbrk (type 3) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      memory.size
      i32.const 16
      i32.shl
      return
    end
    block  ;; label = @1
      local.get 0
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 0
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 48
        i32.store offset=1052816
        i32.const -1
        return
      end
      local.get 0
      i32.const 16
      i32.shl
      return
    end
    call $abort
    unreachable)
  (func $getenv (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    call $__wasilibc_ensure_environ
    block  ;; label = @1
      local.get 0
      i32.const 61
      call $__strchrnul
      local.tee 1
      local.get 0
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 0
      local.get 1
      local.get 0
      i32.sub
      local.tee 3
      i32.add
      i32.load8_u
      br_if 0 (;@1;)
      i32.const 0
      i32.load offset=1052196
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 4
      i32.add
      local.set 4
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 1
            local.get 3
            call $strncmp
            br_if 0 (;@4;)
            local.get 1
            local.get 3
            i32.add
            local.tee 1
            i32.load8_u
            i32.const 61
            i32.eq
            br_if 2 (;@2;)
          end
          local.get 4
          i32.load
          local.set 1
          local.get 4
          i32.const 4
          i32.add
          local.set 4
          local.get 1
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 2
    end
    local.get 2)
  (func $dummy (type 0))
  (func $__wasm_call_dtors (type 0)
    call $dummy
    call $dummy)
  (func $memcmp (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 4
          local.get 1
          i32.load8_u
          local.tee 5
          i32.ne
          br_if 1 (;@2;)
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 2
          i32.const -1
          i32.add
          local.tee 2
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 4
      local.get 5
      i32.sub
      local.set 3
    end
    local.get 3)
  (func $memcpy (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 32
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          local.get 1
          i32.load8_u
          i32.store8
          local.get 2
          i32.const -1
          i32.add
          local.set 3
          local.get 0
          i32.const 1
          i32.add
          local.set 4
          local.get 1
          i32.const 1
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 2
          i32.const -2
          i32.add
          local.set 3
          local.get 0
          i32.const 2
          i32.add
          local.set 4
          local.get 1
          i32.const 2
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=2
          i32.store8 offset=2
          local.get 2
          i32.const -3
          i32.add
          local.set 3
          local.get 0
          i32.const 3
          i32.add
          local.set 4
          local.get 1
          i32.const 3
          i32.add
          local.tee 5
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=3
          i32.store8 offset=3
          local.get 2
          i32.const -4
          i32.add
          local.set 3
          local.get 0
          i32.const 4
          i32.add
          local.set 4
          local.get 1
          i32.const 4
          i32.add
          local.set 5
          br 2 (;@1;)
        end
        local.get 0
        local.get 1
        local.get 2
        memory.copy
        local.get 0
        return
      end
      local.get 2
      local.set 3
      local.get 0
      local.set 4
      local.get 1
      local.set 5
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.const 3
        i32.and
        local.tee 2
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 16
            i32.ge_u
            br_if 0 (;@4;)
            local.get 3
            local.set 2
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 3
            i32.const -16
            i32.add
            local.tee 2
            i32.const 16
            i32.and
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 5
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            i32.const 16
            i32.add
            local.set 4
            local.get 5
            i32.const 16
            i32.add
            local.set 5
            local.get 2
            local.set 3
          end
          local.get 2
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 3
          local.set 2
          loop  ;; label = @4
            local.get 4
            local.get 5
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 5
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            local.get 5
            i64.load offset=16 align=4
            i64.store offset=16 align=4
            local.get 4
            local.get 5
            i64.load offset=24 align=4
            i64.store offset=24 align=4
            local.get 4
            i32.const 32
            i32.add
            local.set 4
            local.get 5
            i32.const 32
            i32.add
            local.set 5
            local.get 2
            i32.const -32
            i32.add
            local.tee 2
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          local.get 2
          i32.const 8
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i64.load align=4
          i64.store align=4
          local.get 5
          i32.const 8
          i32.add
          local.set 5
          local.get 4
          i32.const 8
          i32.add
          local.set 4
        end
        block  ;; label = @3
          local.get 2
          i32.const 4
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load
          i32.store
          local.get 5
          i32.const 4
          i32.add
          local.set 5
          local.get 4
          i32.const 4
          i32.add
          local.set 4
        end
        block  ;; label = @3
          local.get 2
          i32.const 2
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load16_u align=1
          i32.store16 align=1
          local.get 4
          i32.const 2
          i32.add
          local.set 4
          local.get 5
          i32.const 2
          i32.add
          local.set 5
        end
        local.get 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 5
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.const 32
                i32.lt_u
                br_if 0 (;@6;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    i32.const -1
                    i32.add
                    br_table 3 (;@5;) 0 (;@8;) 1 (;@7;) 7 (;@1;)
                  end
                  local.get 4
                  local.get 5
                  i32.load
                  i32.store16 align=1
                  local.get 4
                  local.get 5
                  i32.const 2
                  i32.add
                  i32.load align=2
                  i32.store offset=2
                  local.get 4
                  local.get 5
                  i32.const 6
                  i32.add
                  i64.load align=2
                  i64.store offset=6 align=4
                  local.get 4
                  i32.const 18
                  i32.add
                  local.set 2
                  local.get 5
                  i32.const 18
                  i32.add
                  local.set 1
                  i32.const 14
                  local.set 6
                  local.get 5
                  i32.const 14
                  i32.add
                  i32.load align=2
                  local.set 5
                  i32.const 14
                  local.set 3
                  br 3 (;@4;)
                end
                local.get 4
                local.get 5
                i32.load
                i32.store8
                local.get 4
                local.get 5
                i32.const 1
                i32.add
                i32.load align=1
                i32.store offset=1
                local.get 4
                local.get 5
                i32.const 5
                i32.add
                i64.load align=1
                i64.store offset=5 align=4
                local.get 4
                i32.const 17
                i32.add
                local.set 2
                local.get 5
                i32.const 17
                i32.add
                local.set 1
                i32.const 13
                local.set 6
                local.get 5
                i32.const 13
                i32.add
                i32.load align=1
                local.set 5
                i32.const 15
                local.set 3
                br 2 (;@4;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.const 16
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 4
                  local.set 2
                  local.get 5
                  local.set 1
                  br 1 (;@6;)
                end
                local.get 4
                local.get 5
                i32.load8_u
                i32.store8
                local.get 4
                local.get 5
                i32.load offset=1 align=1
                i32.store offset=1 align=1
                local.get 4
                local.get 5
                i64.load offset=5 align=1
                i64.store offset=5 align=1
                local.get 4
                local.get 5
                i32.load16_u offset=13 align=1
                i32.store16 offset=13 align=1
                local.get 4
                local.get 5
                i32.load8_u offset=15
                i32.store8 offset=15
                local.get 4
                i32.const 16
                i32.add
                local.set 2
                local.get 5
                i32.const 16
                i32.add
                local.set 1
              end
              local.get 3
              i32.const 8
              i32.and
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            local.get 4
            local.get 5
            i32.load
            local.tee 2
            i32.store8
            local.get 4
            local.get 2
            i32.const 16
            i32.shr_u
            i32.store8 offset=2
            local.get 4
            local.get 2
            i32.const 8
            i32.shr_u
            i32.store8 offset=1
            local.get 4
            local.get 5
            i32.const 3
            i32.add
            i32.load align=1
            i32.store offset=3
            local.get 4
            local.get 5
            i32.const 7
            i32.add
            i64.load align=1
            i64.store offset=7 align=4
            local.get 4
            i32.const 19
            i32.add
            local.set 2
            local.get 5
            i32.const 19
            i32.add
            local.set 1
            i32.const 15
            local.set 6
            local.get 5
            i32.const 15
            i32.add
            i32.load align=1
            local.set 5
            i32.const 13
            local.set 3
          end
          local.get 4
          local.get 6
          i32.add
          local.get 5
          i32.store
        end
        local.get 2
        local.get 1
        i64.load align=1
        i64.store align=1
        local.get 2
        i32.const 8
        i32.add
        local.set 2
        local.get 1
        i32.const 8
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 3
        i32.const 4
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.load align=1
        i32.store align=1
        local.get 2
        i32.const 4
        i32.add
        local.set 2
        local.get 1
        i32.const 4
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 3
        i32.const 2
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.load16_u align=1
        i32.store16 align=1
        local.get 2
        i32.const 2
        i32.add
        local.set 2
        local.get 1
        i32.const 2
        i32.add
        local.set 1
      end
      local.get 3
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.load8_u
      i32.store8
    end
    local.get 0)
  (func $memmove (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 33
          i32.ge_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.eq
          br_if 2 (;@1;)
          local.get 1
          local.get 0
          local.get 2
          i32.add
          local.tee 3
          i32.sub
          i32.const 0
          local.get 2
          i32.const 1
          i32.shl
          i32.sub
          i32.gt_u
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 1
        local.get 2
        memory.copy
        br 1 (;@1;)
      end
      local.get 1
      local.get 0
      i32.xor
      i32.const 3
      i32.and
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 1
            i32.ge_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.set 5
              local.get 0
              local.set 3
              br 3 (;@2;)
            end
            block  ;; label = @5
              local.get 0
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 2
              local.set 5
              local.get 0
              local.set 3
              br 2 (;@3;)
            end
            local.get 2
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u
            i32.store8
            local.get 2
            i32.const -1
            i32.add
            local.set 5
            block  ;; label = @5
              local.get 0
              i32.const 1
              i32.add
              local.tee 3
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 1
              i32.const 1
              i32.add
              local.set 1
              br 2 (;@3;)
            end
            local.get 5
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u offset=1
            i32.store8 offset=1
            local.get 2
            i32.const -2
            i32.add
            local.set 5
            block  ;; label = @5
              local.get 0
              i32.const 2
              i32.add
              local.tee 3
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 1
              i32.const 2
              i32.add
              local.set 1
              br 2 (;@3;)
            end
            local.get 5
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u offset=2
            i32.store8 offset=2
            local.get 2
            i32.const -3
            i32.add
            local.set 5
            block  ;; label = @5
              local.get 0
              i32.const 3
              i32.add
              local.tee 3
              i32.const 3
              i32.and
              br_if 0 (;@5;)
              local.get 1
              i32.const 3
              i32.add
              local.set 1
              br 2 (;@3;)
            end
            local.get 5
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            local.get 1
            i32.load8_u offset=3
            i32.store8 offset=3
            local.get 0
            i32.const 4
            i32.add
            local.set 3
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 2
            i32.const -4
            i32.add
            local.set 5
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 4
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 3
              i32.const 3
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -1
              i32.add
              local.tee 3
              i32.add
              local.tee 4
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              i32.store8
              block  ;; label = @6
                local.get 4
                i32.const 3
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.set 2
                br 1 (;@5;)
              end
              local.get 3
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -2
              i32.add
              local.tee 3
              i32.add
              local.tee 4
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              i32.store8
              block  ;; label = @6
                local.get 4
                i32.const 3
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.set 2
                br 1 (;@5;)
              end
              local.get 3
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -3
              i32.add
              local.tee 3
              i32.add
              local.tee 4
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              i32.store8
              block  ;; label = @6
                local.get 4
                i32.const 3
                i32.and
                br_if 0 (;@6;)
                local.get 3
                local.set 2
                br 1 (;@5;)
              end
              local.get 3
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              local.get 2
              i32.const -4
              i32.add
              local.tee 2
              i32.add
              local.get 1
              local.get 2
              i32.add
              i32.load8_u
              i32.store8
            end
            local.get 2
            i32.const 4
            i32.lt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 2
              i32.const -4
              i32.add
              local.tee 6
              i32.const 2
              i32.shr_u
              i32.const 1
              i32.add
              i32.const 3
              i32.and
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.const -4
              i32.add
              local.set 4
              local.get 0
              i32.const -4
              i32.add
              local.set 5
              loop  ;; label = @6
                local.get 5
                local.get 2
                i32.add
                local.get 4
                local.get 2
                i32.add
                i32.load
                i32.store
                local.get 2
                i32.const -4
                i32.add
                local.set 2
                local.get 3
                i32.const -1
                i32.add
                local.tee 3
                br_if 0 (;@6;)
              end
            end
            local.get 6
            i32.const 12
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const -16
            i32.add
            local.set 5
            local.get 0
            i32.const -16
            i32.add
            local.set 6
            loop  ;; label = @5
              local.get 6
              local.get 2
              i32.add
              local.tee 3
              i32.const 12
              i32.add
              local.get 5
              local.get 2
              i32.add
              local.tee 4
              i32.const 12
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 8
              i32.add
              local.get 4
              i32.const 8
              i32.add
              i32.load
              i32.store
              local.get 3
              i32.const 4
              i32.add
              local.get 4
              i32.const 4
              i32.add
              i32.load
              i32.store
              local.get 3
              local.get 4
              i32.load
              i32.store
              local.get 2
              i32.const -16
              i32.add
              local.tee 2
              i32.const 3
              i32.gt_u
              br_if 0 (;@5;)
            end
          end
          local.get 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 2
          local.set 3
          block  ;; label = @4
            local.get 2
            i32.const 3
            i32.and
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const -1
            i32.add
            local.set 5
            local.get 0
            i32.const -1
            i32.add
            local.set 6
            local.get 2
            local.set 3
            loop  ;; label = @5
              local.get 6
              local.get 3
              i32.add
              local.get 5
              local.get 3
              i32.add
              i32.load8_u
              i32.store8
              local.get 3
              i32.const -1
              i32.add
              local.set 3
              local.get 4
              i32.const -1
              i32.add
              local.tee 4
              br_if 0 (;@5;)
            end
          end
          local.get 2
          i32.const 4
          i32.lt_u
          br_if 2 (;@1;)
          local.get 1
          i32.const -4
          i32.add
          local.set 4
          local.get 0
          i32.const -4
          i32.add
          local.set 5
          loop  ;; label = @4
            local.get 5
            local.get 3
            i32.add
            local.tee 1
            i32.const 3
            i32.add
            local.get 4
            local.get 3
            i32.add
            local.tee 2
            i32.const 3
            i32.add
            i32.load8_u
            i32.store8
            local.get 1
            i32.const 2
            i32.add
            local.get 2
            i32.const 2
            i32.add
            i32.load8_u
            i32.store8
            local.get 1
            i32.const 1
            i32.add
            local.get 2
            i32.const 1
            i32.add
            i32.load8_u
            i32.store8
            local.get 1
            local.get 2
            i32.load8_u
            i32.store8
            local.get 3
            i32.const -4
            i32.add
            local.tee 3
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 5
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 5
          i32.const -4
          i32.add
          local.tee 4
          i32.const 2
          i32.shr_u
          i32.const 1
          i32.add
          i32.const 7
          i32.and
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 3
            local.get 1
            i32.load
            i32.store
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 3
            i32.const 4
            i32.add
            local.set 3
            local.get 5
            i32.const -4
            i32.add
            local.set 5
            local.get 2
            i32.const -1
            i32.add
            local.tee 2
            br_if 0 (;@4;)
          end
        end
        local.get 4
        i32.const 28
        i32.lt_u
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.load
          i32.store
          local.get 3
          local.get 1
          i32.load offset=4
          i32.store offset=4
          local.get 3
          local.get 1
          i32.load offset=8
          i32.store offset=8
          local.get 3
          local.get 1
          i32.load offset=12
          i32.store offset=12
          local.get 3
          local.get 1
          i32.load offset=16
          i32.store offset=16
          local.get 3
          local.get 1
          i32.load offset=20
          i32.store offset=20
          local.get 3
          local.get 1
          i32.load offset=24
          i32.store offset=24
          local.get 3
          local.get 1
          i32.load offset=28
          i32.store offset=28
          local.get 1
          i32.const 32
          i32.add
          local.set 1
          local.get 3
          i32.const 32
          i32.add
          local.set 3
          local.get 5
          i32.const -32
          i32.add
          local.tee 5
          i32.const 3
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.const 7
          i32.and
          local.tee 4
          br_if 0 (;@3;)
          local.get 5
          local.set 2
          br 1 (;@2;)
        end
        local.get 5
        local.set 2
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 2
          i32.const -1
          i32.add
          local.set 2
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 4
          i32.const -1
          i32.add
          local.tee 4
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 8
      i32.lt_u
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 3
        local.get 1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 3
        local.get 1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 3
        local.get 1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get 3
        local.get 1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get 3
        local.get 1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get 3
        local.get 1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        local.get 1
        i32.const 8
        i32.add
        local.set 1
        local.get 2
        i32.const -8
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $memset (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    block  ;; label = @1
      local.get 2
      i32.const 33
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      memory.fill
      local.get 0
      return
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 2
      local.get 0
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 5
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 3
      i32.store
      local.get 5
      local.get 2
      local.get 4
      i32.sub
      i32.const -4
      i32.and
      local.tee 1
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=8
      local.get 5
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=24
      local.get 5
      local.get 3
      i32.store offset=20
      local.get 5
      local.get 3
      i32.store offset=16
      local.get 5
      local.get 3
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 2
      i32.sub
      local.tee 1
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i64.extend_i32_u
      i64.const 4294967297
      i64.mul
      local.set 6
      local.get 5
      local.get 2
      i32.add
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 6
        i64.store offset=24
        local.get 2
        local.get 6
        i64.store offset=16
        local.get 2
        local.get 6
        i64.store offset=8
        local.get 2
        local.get 6
        i64.store
        local.get 2
        i32.const 32
        i32.add
        local.set 2
        local.get 1
        i32.const -32
        i32.add
        local.tee 1
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $__strchrnul (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 255
            i32.and
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              local.get 0
              i32.load8_u
              local.tee 3
              br_if 0 (;@5;)
              local.get 0
              return
            end
            local.get 3
            local.get 1
            i32.const 255
            i32.and
            i32.ne
            br_if 1 (;@3;)
            local.get 0
            return
          end
          local.get 0
          local.get 0
          call $strlen
          i32.add
          return
        end
        block  ;; label = @3
          local.get 0
          i32.const 1
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 0
          i32.const 2
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 0
          i32.const 3
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load8_u
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.set 0
      end
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        i32.const -1
        i32.xor
        local.get 3
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 16843009
        i32.mul
        local.set 2
        loop  ;; label = @3
          local.get 3
          local.get 2
          i32.xor
          local.tee 3
          i32.const -1
          i32.xor
          local.get 3
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          br_if 1 (;@2;)
          local.get 0
          i32.const 4
          i32.add
          local.tee 0
          i32.load
          local.tee 3
          i32.const -1
          i32.xor
          local.get 3
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.const -1
      i32.add
      local.set 3
      loop  ;; label = @2
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.load8_u
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.const 255
        i32.and
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 3)
  (func $__stpcpy (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          local.get 0
          i32.xor
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load8_u
          local.set 2
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.load8_u
          local.tee 2
          i32.store8
          block  ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            local.get 0
            return
          end
          local.get 0
          i32.const 1
          i32.add
          local.set 2
          block  ;; label = @4
            local.get 1
            i32.const 1
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 2
            local.set 0
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.load8_u
          local.tee 3
          i32.store8
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          i32.const 2
          i32.add
          local.set 2
          block  ;; label = @4
            local.get 1
            i32.const 2
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 2
            local.set 0
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.load8_u
          local.tee 3
          i32.store8
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          i32.const 3
          i32.add
          local.set 2
          block  ;; label = @4
            local.get 1
            i32.const 3
            i32.add
            local.tee 3
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 2
            local.set 0
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.load8_u
          local.tee 3
          i32.store8
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.const 4
          i32.add
          local.set 1
        end
        local.get 1
        i32.load
        local.tee 2
        i32.const -1
        i32.xor
        local.get 2
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 0
          local.get 2
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.const 4
          i32.add
          local.tee 1
          i32.load
          local.tee 2
          i32.const -1
          i32.xor
          local.get 2
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 2
      i32.store8
      block  ;; label = @2
        local.get 2
        i32.const 255
        i32.and
        br_if 0 (;@2;)
        local.get 0
        return
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 1
        i32.load8_u
        local.tee 0
        i32.store8 offset=1
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        local.get 0
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func $strcpy (type 6) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__stpcpy
    drop
    local.get 0)
  (func $strdup (type 3) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      call $strlen
      i32.const 1
      i32.add
      local.tee 1
      call $malloc
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      local.get 1
      call $memcpy
      drop
    end
    local.get 2)
  (func $strlen (type 3) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.set 1
        local.get 0
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 1
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 2
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 3
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.set 1
      end
      local.get 1
      i32.const -5
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.const 5
        i32.add
        local.set 2
        local.get 1
        i32.const 4
        i32.add
        local.set 1
        local.get 2
        i32.load
        local.tee 2
        i32.const -1
        i32.xor
        local.get 2
        i32.const -16843009
        i32.add
        i32.and
        i32.const -2139062144
        i32.and
        i32.eqz
        br_if 0 (;@2;)
      end
      loop  ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.load8_u
        br_if 0 (;@2;)
      end
    end
    local.get 1
    local.get 0
    i32.sub)
  (func $strncmp (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 2
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.load8_u
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 2
      i32.const -1
      i32.add
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load8_u
          local.tee 5
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 4
          i32.const 255
          i32.and
          local.get 5
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        i32.const -1
        i32.add
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 0
        i32.load8_u
        local.set 4
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 4
        br_if 0 (;@2;)
      end
    end
    local.get 3
    i32.const 255
    i32.and
    local.get 1
    i32.load8_u
    i32.sub)
  (func $core::ptr::drop_in_place$LT$core..fmt..Error$GT$::hbe1420f69b62f51b (type 1) (param i32))
  (func $_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$::fmt::h706bf782e098b50d (type 6) (param i32 i32) (result i32)
    local.get 1
    i32.const 1051244
    i32.const 11
    call $core::fmt::Formatter::write_str::hd832a14d3ebc1619)
  (func $alloc::raw_vec::finish_grow::h0e181f8cb78bb1c4 (type 9) (param i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const -1
        i32.le_s
        br_if 1 (;@1;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.const 8
                  i32.add
                  i32.load
                  local.tee 1
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 1
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1052213
                  drop
                  local.get 2
                  i32.const 1
                  call $__rust_alloc
                  local.set 1
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 1
                i32.const 1
                local.get 2
                call $__rust_realloc
                local.set 1
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 1
                local.set 1
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1052213
              drop
              local.get 2
              i32.const 1
              call $__rust_alloc
              local.set 1
            end
            local.get 1
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 1
          i32.store offset=4
          local.get 0
          i32.const 8
          i32.add
          local.get 2
          i32.store
          local.get 0
          i32.const 0
          i32.store
          return
        end
        local.get 0
        i32.const 1
        i32.store offset=4
        local.get 0
        i32.const 8
        i32.add
        local.get 2
        i32.store
        local.get 0
        i32.const 1
        i32.store
        return
      end
      local.get 0
      i32.const 0
      i32.store offset=4
      local.get 0
      i32.const 8
      i32.add
      local.get 2
      i32.store
      local.get 0
      i32.const 1
      i32.store
      return
    end
    local.get 0
    i32.const 0
    i32.store offset=4
    local.get 0
    i32.const 1
    i32.store)
  (func $alloc::alloc::handle_alloc_error::h65bcaee229518e24 (type 2) (param i32 i32)
    local.get 1
    local.get 0
    call $__rust_alloc_error_handler
    unreachable)
  (func $alloc::raw_vec::capacity_overflow::h504ef83d06198b94 (type 0)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 20
    i32.add
    i64.const 0
    i64.store align=4
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1051300
    i32.store offset=8
    local.get 0
    i32.const 1051244
    i32.store offset=16
    local.get 0
    i32.const 8
    i32.add
    i32.const 1051308
    call $core::panicking::panic_fmt::h5318dfeccdd30466
    unreachable)
  (func $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve_for_push::he6f975d5c311a5ec (type 2) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.const 1
        i32.shl
        local.tee 4
        local.get 1
        local.get 4
        local.get 1
        i32.gt_u
        select
        local.tee 1
        i32.const 8
        local.get 1
        i32.const 8
        i32.gt_u
        select
        local.tee 1
        i32.const -1
        i32.xor
        i32.const 31
        i32.shr_u
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=24
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.store offset=28
          local.get 2
          i32.const 1
          i32.store offset=24
          local.get 2
          local.get 0
          i32.load
          i32.store offset=20
        end
        local.get 2
        i32.const 8
        i32.add
        local.get 4
        local.get 1
        local.get 2
        i32.const 20
        i32.add
        call $alloc::raw_vec::finish_grow::h0e181f8cb78bb1c4
        local.get 2
        i32.load offset=12
        local.set 3
        block  ;; label = @3
          local.get 2
          i32.load offset=8
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.store offset=4
          local.get 0
          local.get 3
          i32.store
          br 2 (;@1;)
        end
        local.get 3
        i32.const -2147483647
        i32.eq
        br_if 1 (;@1;)
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.const 16
        i32.add
        i32.load
        call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
        unreachable
      end
      call $alloc::raw_vec::capacity_overflow::h504ef83d06198b94
      unreachable
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_$LT$$RF$str$u20$as$u20$alloc..ffi..c_str..CString..new..SpecNewImpl$GT$::spec_new_impl::haf5611f48815a534 (type 4) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 1
              i32.add
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              i32.const -1
              i32.le_s
              br_if 1 (;@4;)
              i32.const 0
              i32.load8_u offset=1052213
              drop
              local.get 4
              i32.const 1
              call $__rust_alloc
              local.tee 5
              i32.eqz
              br_if 2 (;@3;)
              local.get 5
              local.get 1
              local.get 2
              call $memcpy
              local.set 6
              block  ;; label = @6
                local.get 2
                i32.const 8
                i32.lt_u
                br_if 0 (;@6;)
                local.get 3
                i32.const 8
                i32.add
                i32.const 0
                local.get 1
                local.get 2
                call $core::slice::memchr::memchr_aligned::h3af965063b51a756
                local.get 3
                i32.load offset=12
                local.set 7
                local.get 3
                i32.load offset=8
                local.set 8
                br 5 (;@1;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 0
                local.set 7
                i32.const 0
                local.set 8
                br 5 (;@1;)
              end
              block  ;; label = @6
                local.get 1
                i32.load8_u
                br_if 0 (;@6;)
                i32.const 1
                local.set 8
                i32.const 0
                local.set 7
                br 5 (;@1;)
              end
              i32.const 1
              local.set 8
              local.get 2
              i32.const 1
              i32.eq
              br_if 3 (;@2;)
              block  ;; label = @6
                local.get 1
                i32.load8_u offset=1
                br_if 0 (;@6;)
                i32.const 1
                local.set 7
                br 5 (;@1;)
              end
              i32.const 2
              local.set 7
              local.get 2
              i32.const 2
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=2
              i32.eqz
              br_if 4 (;@1;)
              i32.const 3
              local.set 7
              local.get 2
              i32.const 3
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=3
              i32.eqz
              br_if 4 (;@1;)
              i32.const 4
              local.set 7
              local.get 2
              i32.const 4
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=4
              i32.eqz
              br_if 4 (;@1;)
              i32.const 5
              local.set 7
              local.get 2
              i32.const 5
              i32.eq
              br_if 3 (;@2;)
              local.get 1
              i32.load8_u offset=5
              i32.eqz
              br_if 4 (;@1;)
              local.get 2
              local.set 7
              i32.const 0
              local.set 8
              local.get 2
              i32.const 6
              i32.eq
              br_if 4 (;@1;)
              local.get 2
              i32.const 6
              local.get 1
              i32.load8_u offset=6
              local.tee 1
              select
              local.set 7
              local.get 1
              i32.eqz
              local.set 8
              br 4 (;@1;)
            end
            i32.const 1051324
            i32.const 43
            i32.const 1051400
            call $core::panicking::panic::h9910a7377b663c09
            unreachable
          end
          call $alloc::raw_vec::capacity_overflow::h504ef83d06198b94
          unreachable
        end
        i32.const 1
        local.get 4
        call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
        unreachable
      end
      local.get 2
      local.set 7
      i32.const 0
      local.set 8
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 8
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.store offset=28
        local.get 3
        local.get 4
        i32.store offset=24
        local.get 3
        local.get 6
        i32.store offset=20
        local.get 3
        local.get 3
        i32.const 20
        i32.add
        call $alloc::ffi::c_str::CString::_from_vec_unchecked::h6d883466e69771e3
        local.get 0
        local.get 3
        i64.load
        i64.store offset=4 align=4
        i32.const 0
        local.set 5
        br 1 (;@1;)
      end
      local.get 0
      local.get 2
      i32.store offset=8
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 0
      local.get 7
      i32.store offset=12
    end
    local.get 0
    local.get 5
    i32.store
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $alloc::ffi::c_str::CString::_from_vec_unchecked::h6d883466e69771e3 (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      local.tee 3
      local.get 1
      i32.load offset=8
      local.tee 4
      i32.sub
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 4
        i32.const 1
        i32.add
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.const -1
        i32.xor
        i32.const 31
        i32.shr_u
        local.set 6
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=24
            br 1 (;@3;)
          end
          local.get 2
          local.get 3
          i32.store offset=28
          local.get 2
          i32.const 1
          i32.store offset=24
          local.get 2
          local.get 1
          i32.load
          i32.store offset=20
        end
        local.get 2
        i32.const 8
        i32.add
        local.get 6
        local.get 5
        local.get 2
        i32.const 20
        i32.add
        call $alloc::raw_vec::finish_grow::h0e181f8cb78bb1c4
        local.get 2
        i32.load offset=12
        local.set 6
        block  ;; label = @3
          local.get 2
          i32.load offset=8
          br_if 0 (;@3;)
          local.get 1
          local.get 5
          i32.store offset=4
          local.get 1
          local.get 6
          i32.store
          local.get 5
          local.set 3
          br 2 (;@1;)
        end
        local.get 6
        i32.const -2147483647
        i32.eq
        br_if 1 (;@1;)
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        local.get 2
        i32.const 16
        i32.add
        i32.load
        call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
        unreachable
      end
      call $alloc::raw_vec::capacity_overflow::h504ef83d06198b94
      unreachable
    end
    block  ;; label = @1
      local.get 4
      local.get 3
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      local.get 4
      call $alloc::raw_vec::RawVec$LT$T$C$A$GT$::reserve_for_push::he6f975d5c311a5ec
      local.get 1
      i32.load offset=4
      local.set 3
      local.get 1
      i32.load offset=8
      local.set 4
    end
    local.get 1
    local.get 4
    i32.const 1
    i32.add
    local.tee 5
    i32.store offset=8
    local.get 1
    i32.load
    local.tee 1
    local.get 4
    i32.add
    i32.const 0
    i32.store8
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          local.get 5
          i32.gt_u
          br_if 0 (;@3;)
          local.get 1
          local.set 4
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          i32.const 1
          local.set 4
          local.get 1
          local.get 3
          i32.const 1
          call $__rust_dealloc
          br 1 (;@2;)
        end
        local.get 1
        local.get 3
        i32.const 1
        local.get 5
        call $__rust_realloc
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 5
      i32.store offset=4
      local.get 0
      local.get 4
      i32.store
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1
    local.get 5
    call $alloc::alloc::handle_alloc_error::h65bcaee229518e24
    unreachable)
  (func $alloc::sync::arcinner_layout_for_value_layout::hbef0101ab1060e75 (type 4) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.const 7
      i32.add
      i32.const 0
      local.get 1
      i32.sub
      i32.and
      local.tee 4
      local.get 4
      i32.const -8
      i32.add
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      local.get 2
      i32.add
      local.tee 2
      local.get 4
      i32.lt_u
      br_if 0 (;@1;)
      local.get 2
      i32.const -2147483648
      local.get 1
      i32.const 4
      local.get 1
      i32.const 4
      i32.gt_u
      select
      local.tee 1
      i32.sub
      i32.gt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 1
      local.get 2
      i32.add
      i32.const -1
      i32.add
      i32.const 0
      local.get 1
      i32.sub
      i32.and
      i32.store offset=4
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1051416
    i32.const 43
    local.get 3
    i32.const 15
    i32.add
    i32.const 1051460
    i32.const 1051504
    call $core::result::unwrap_failed::hc7fc3acc4adf7bf6
    unreachable)
  (func $core::ops::function::FnOnce::call_once::h2313a80f63b698ab (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.load
    drop
    loop (result i32)  ;; label = @1
      br 0 (;@1;)
    end)
  (func $core::ptr::drop_in_place$LT$char$GT$::h23e8884b5441f9e8 (type 1) (param i32))
  (func $core::ptr::drop_in_place$LT$core..fmt..Error$GT$::hab6e5eeb4d3b664e (type 1) (param i32))
  (func $core::panicking::panic_fmt::h5318dfeccdd30466 (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1
    i32.store16 offset=28
    local.get 2
    local.get 1
    i32.store offset=24
    local.get 2
    local.get 0
    i32.store offset=20
    local.get 2
    i32.const 1051616
    i32.store offset=16
    local.get 2
    i32.const 1051520
    i32.store offset=12
    local.get 2
    i32.const 12
    i32.add
    call $rust_begin_unwind
    unreachable)
  (func $core::slice::index::slice_start_index_len_fail::hfb1719074a270fbd (type 4) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    i32.const 8
    i32.add
    i32.const 12
    i32.add
    i64.const 2
    i64.store align=4
    local.get 3
    i32.const 32
    i32.add
    i32.const 12
    i32.add
    i32.const 7
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1052144
    i32.store offset=8
    local.get 3
    i32.const 7
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $core::panicking::panic_fmt::h5318dfeccdd30466
    unreachable)
  (func $core::slice::index::slice_end_index_len_fail::h1772581b926ea523 (type 4) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    i32.const 8
    i32.add
    i32.const 12
    i32.add
    i64.const 2
    i64.store align=4
    local.get 3
    i32.const 32
    i32.add
    i32.const 12
    i32.add
    i32.const 7
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1052176
    i32.store offset=8
    local.get 3
    i32.const 7
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $core::panicking::panic_fmt::h5318dfeccdd30466
    unreachable)
  (func $core::fmt::Formatter::pad::hdb5d5c683ab6fe77 (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 3
      local.get 0
      i32.load offset=8
      local.tee 4
      i32.or
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.add
        local.set 5
        local.get 0
        i32.const 12
        i32.add
        i32.load
        i32.const 1
        i32.add
        local.set 6
        i32.const 0
        local.set 7
        local.get 1
        local.set 8
        block  ;; label = @3
          loop  ;; label = @4
            local.get 8
            local.set 4
            local.get 6
            i32.const -1
            i32.add
            local.tee 6
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            local.get 5
            i32.eq
            br_if 2 (;@2;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.load8_s
                local.tee 9
                i32.const -1
                i32.le_s
                br_if 0 (;@6;)
                local.get 4
                i32.const 1
                i32.add
                local.set 8
                local.get 9
                i32.const 255
                i32.and
                local.set 9
                br 1 (;@5;)
              end
              local.get 4
              i32.load8_u offset=1
              i32.const 63
              i32.and
              local.set 10
              local.get 9
              i32.const 31
              i32.and
              local.set 8
              block  ;; label = @6
                local.get 9
                i32.const -33
                i32.gt_u
                br_if 0 (;@6;)
                local.get 8
                i32.const 6
                i32.shl
                local.get 10
                i32.or
                local.set 9
                local.get 4
                i32.const 2
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              local.get 10
              i32.const 6
              i32.shl
              local.get 4
              i32.load8_u offset=2
              i32.const 63
              i32.and
              i32.or
              local.set 10
              block  ;; label = @6
                local.get 9
                i32.const -16
                i32.ge_u
                br_if 0 (;@6;)
                local.get 10
                local.get 8
                i32.const 12
                i32.shl
                i32.or
                local.set 9
                local.get 4
                i32.const 3
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              local.get 10
              i32.const 6
              i32.shl
              local.get 4
              i32.load8_u offset=3
              i32.const 63
              i32.and
              i32.or
              local.get 8
              i32.const 18
              i32.shl
              i32.const 1835008
              i32.and
              i32.or
              local.tee 9
              i32.const 1114112
              i32.eq
              br_if 3 (;@2;)
              local.get 4
              i32.const 4
              i32.add
              local.set 8
            end
            local.get 7
            local.get 4
            i32.sub
            local.get 8
            i32.add
            local.set 7
            local.get 9
            i32.const 1114112
            i32.ne
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 4
        local.get 5
        i32.eq
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 4
          i32.load8_s
          local.tee 8
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 8
          i32.const -32
          i32.lt_u
          br_if 0 (;@3;)
          local.get 8
          i32.const -16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          i32.load8_u offset=2
          i32.const 63
          i32.and
          i32.const 6
          i32.shl
          local.get 4
          i32.load8_u offset=1
          i32.const 63
          i32.and
          i32.const 12
          i32.shl
          i32.or
          local.get 4
          i32.load8_u offset=3
          i32.const 63
          i32.and
          i32.or
          local.get 8
          i32.const 255
          i32.and
          i32.const 18
          i32.shl
          i32.const 1835008
          i32.and
          i32.or
          i32.const 1114112
          i32.eq
          br_if 1 (;@2;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 7
              local.get 2
              i32.lt_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 4
              local.get 7
              local.get 2
              i32.eq
              br_if 1 (;@4;)
              br 2 (;@3;)
            end
            i32.const 0
            local.set 4
            local.get 1
            local.get 7
            i32.add
            i32.load8_s
            i32.const -64
            i32.lt_s
            br_if 1 (;@3;)
          end
          local.get 1
          local.set 4
        end
        local.get 7
        local.get 2
        local.get 4
        select
        local.set 2
        local.get 4
        local.get 1
        local.get 4
        select
        local.set 1
      end
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 0
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      local.get 0
      i32.load offset=4
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          local.get 2
          call $core::str::count::do_count_chars::h4ac0b6b94227293b
          local.set 4
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 2
        i32.const 3
        i32.and
        local.set 6
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 4
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 4
            i32.const 0
            local.set 9
            br 1 (;@3;)
          end
          local.get 2
          i32.const -4
          i32.and
          local.set 7
          i32.const 0
          local.set 4
          i32.const 0
          local.set 9
          loop  ;; label = @4
            local.get 4
            local.get 1
            local.get 9
            i32.add
            local.tee 8
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 4
            local.get 7
            local.get 9
            i32.const 4
            i32.add
            local.tee 9
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 9
        i32.add
        local.set 8
        loop  ;; label = @3
          local.get 4
          local.get 8
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 4
          local.get 8
          i32.const 1
          i32.add
          local.set 8
          local.get 6
          i32.const -1
          i32.add
          local.tee 6
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          local.get 4
          i32.le_u
          br_if 0 (;@3;)
          local.get 5
          local.get 4
          i32.sub
          local.set 7
          i32.const 0
          local.set 4
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load8_u offset=32
                br_table 2 (;@4;) 0 (;@6;) 1 (;@5;) 2 (;@4;) 2 (;@4;)
              end
              local.get 7
              local.set 4
              i32.const 0
              local.set 7
              br 1 (;@4;)
            end
            local.get 7
            i32.const 1
            i32.shr_u
            local.set 4
            local.get 7
            i32.const 1
            i32.add
            i32.const 1
            i32.shr_u
            local.set 7
          end
          local.get 4
          i32.const 1
          i32.add
          local.set 4
          local.get 0
          i32.const 24
          i32.add
          i32.load
          local.set 8
          local.get 0
          i32.load offset=16
          local.set 6
          local.get 0
          i32.load offset=20
          local.set 9
          loop  ;; label = @4
            local.get 4
            i32.const -1
            i32.add
            local.tee 4
            i32.eqz
            br_if 2 (;@2;)
            local.get 9
            local.get 6
            local.get 8
            i32.load offset=16
            call_indirect (type 6)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        local.get 0
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 0
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      i32.const 1
      local.set 4
      block  ;; label = @2
        local.get 9
        local.get 1
        local.get 2
        local.get 8
        i32.load offset=12
        call_indirect (type 5)
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        block  ;; label = @3
          loop  ;; label = @4
            block  ;; label = @5
              local.get 7
              local.get 4
              i32.ne
              br_if 0 (;@5;)
              local.get 7
              local.set 4
              br 2 (;@3;)
            end
            local.get 4
            i32.const 1
            i32.add
            local.set 4
            local.get 9
            local.get 6
            local.get 8
            i32.load offset=16
            call_indirect (type 6)
            i32.eqz
            br_if 0 (;@4;)
          end
          local.get 4
          i32.const -1
          i32.add
          local.set 4
        end
        local.get 4
        local.get 7
        i32.lt_u
        local.set 4
      end
      local.get 4
      return
    end
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 5))
  (func $core::panicking::panic::h9910a7377b663c09 (type 4) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 12
    i32.add
    i64.const 0
    i64.store align=4
    local.get 3
    i32.const 1
    i32.store offset=4
    local.get 3
    i32.const 1051520
    i32.store offset=8
    local.get 3
    local.get 1
    i32.store offset=28
    local.get 3
    local.get 0
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 24
    i32.add
    i32.store
    local.get 3
    local.get 2
    call $core::panicking::panic_fmt::h5318dfeccdd30466
    unreachable)
  (func $core::fmt::num::imp::_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$::fmt::h29fb969253e3cd7f (type 6) (param i32 i32) (result i32)
    local.get 0
    i64.load32_u
    i32.const 1
    local.get 1
    call $core::fmt::num::imp::fmt_u64::hea2c1a751e95b920)
  (func $core::fmt::write::he742b579cc4461da (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 36
    i32.add
    local.get 1
    i32.store
    local.get 3
    i32.const 3
    i32.store8 offset=44
    local.get 3
    i32.const 32
    i32.store offset=28
    i32.const 0
    local.set 4
    local.get 3
    i32.const 0
    i32.store offset=40
    local.get 3
    local.get 0
    i32.store offset=32
    local.get 3
    i32.const 0
    i32.store offset=20
    local.get 3
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
              local.get 2
              i32.const 12
              i32.add
              i32.load
              local.tee 0
              i32.eqz
              br_if 1 (;@4;)
              local.get 2
              i32.load offset=8
              local.tee 1
              local.get 0
              i32.const 3
              i32.shl
              i32.add
              local.set 6
              local.get 0
              i32.const -1
              i32.add
              i32.const 536870911
              i32.and
              i32.const 1
              i32.add
              local.set 4
              local.get 2
              i32.load
              local.set 0
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 7
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=32
                  local.get 0
                  i32.load
                  local.get 7
                  local.get 3
                  i32.load offset=36
                  i32.load offset=12
                  call_indirect (type 5)
                  br_if 4 (;@3;)
                end
                local.get 1
                i32.load
                local.get 3
                i32.const 12
                i32.add
                local.get 1
                i32.const 4
                i32.add
                i32.load
                call_indirect (type 6)
                br_if 3 (;@3;)
                local.get 0
                i32.const 8
                i32.add
                local.set 0
                local.get 1
                i32.const 8
                i32.add
                local.tee 1
                local.get 6
                i32.ne
                br_if 0 (;@6;)
                br 2 (;@4;)
              end
            end
            local.get 2
            i32.const 20
            i32.add
            i32.load
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 5
            i32.shl
            local.set 8
            local.get 1
            i32.const -1
            i32.add
            i32.const 134217727
            i32.and
            i32.const 1
            i32.add
            local.set 4
            local.get 2
            i32.load offset=8
            local.set 9
            local.get 2
            i32.load
            local.set 0
            i32.const 0
            local.set 7
            loop  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=32
                local.get 0
                i32.load
                local.get 1
                local.get 3
                i32.load offset=36
                i32.load offset=12
                call_indirect (type 5)
                br_if 3 (;@3;)
              end
              local.get 3
              local.get 5
              local.get 7
              i32.add
              local.tee 1
              i32.const 16
              i32.add
              i32.load
              i32.store offset=28
              local.get 3
              local.get 1
              i32.const 28
              i32.add
              i32.load8_u
              i32.store8 offset=44
              local.get 3
              local.get 1
              i32.const 24
              i32.add
              i32.load
              i32.store offset=40
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.set 10
              i32.const 0
              local.set 11
              i32.const 0
              local.set 6
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.const 8
                    i32.add
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 10
                  i32.const 3
                  i32.shl
                  local.set 12
                  i32.const 0
                  local.set 6
                  local.get 9
                  local.get 12
                  i32.add
                  local.tee 12
                  i32.load offset=4
                  i32.const 56
                  i32.ne
                  br_if 1 (;@6;)
                  local.get 12
                  i32.load
                  i32.load
                  local.set 10
                end
                i32.const 1
                local.set 6
              end
              local.get 3
              local.get 10
              i32.store offset=16
              local.get 3
              local.get 6
              i32.store offset=12
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.set 6
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 6
                  i32.const 3
                  i32.shl
                  local.set 10
                  local.get 9
                  local.get 10
                  i32.add
                  local.tee 10
                  i32.load offset=4
                  i32.const 56
                  i32.ne
                  br_if 1 (;@6;)
                  local.get 10
                  i32.load
                  i32.load
                  local.set 6
                end
                i32.const 1
                local.set 11
              end
              local.get 3
              local.get 6
              i32.store offset=24
              local.get 3
              local.get 11
              i32.store offset=20
              local.get 9
              local.get 1
              i32.const 20
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              local.tee 1
              i32.load
              local.get 3
              i32.const 12
              i32.add
              local.get 1
              i32.const 4
              i32.add
              i32.load
              call_indirect (type 6)
              br_if 2 (;@3;)
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 8
              local.get 7
              i32.const 32
              i32.add
              local.tee 7
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 4
          local.get 2
          i32.load offset=4
          i32.ge_u
          br_if 1 (;@2;)
          local.get 3
          i32.load offset=32
          local.get 2
          i32.load
          local.get 4
          i32.const 3
          i32.shl
          i32.add
          local.tee 1
          i32.load
          local.get 1
          i32.load offset=4
          local.get 3
          i32.load offset=36
          i32.load offset=12
          call_indirect (type 5)
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      local.set 1
    end
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_$LT$T$u20$as$u20$core..any..Any$GT$::type_id::h505136ea61780c6b (type 2) (param i32 i32)
    local.get 0
    i64.const -1100274326188739332
    i64.store offset=8
    local.get 0
    i64.const -5303373566618544236
    i64.store)
  (func $_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$::fmt::hc84b356e3c18c4b5 (type 6) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    i32.const 1051521
    i32.const 14
    local.get 1
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 5))
  (func $core::cell::panic_already_borrowed::hba1b9dd1c7238586 (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 24
    i32.add
    i64.const 1
    i64.store align=4
    local.get 1
    i32.const 1
    i32.store offset=16
    local.get 1
    i32.const 1051556
    i32.store offset=12
    local.get 1
    i32.const 57
    i32.store offset=40
    local.get 1
    local.get 1
    i32.const 36
    i32.add
    i32.store offset=20
    local.get 1
    local.get 1
    i32.const 47
    i32.add
    i32.store offset=36
    local.get 1
    i32.const 12
    i32.add
    local.get 0
    call $core::panicking::panic_fmt::h5318dfeccdd30466
    unreachable)
  (func $core::ffi::c_str::CStr::from_bytes_with_nul::he6d3eb8b4b0547ea (type 4) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  i32.const 8
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 3
                  i32.add
                  i32.const -4
                  i32.and
                  local.tee 3
                  local.get 1
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 3
                  local.get 1
                  i32.sub
                  local.tee 3
                  i32.eqz
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 4
                  loop  ;; label = @8
                    local.get 1
                    local.get 4
                    i32.add
                    i32.load8_u
                    i32.eqz
                    br_if 5 (;@3;)
                    local.get 3
                    local.get 4
                    i32.const 1
                    i32.add
                    local.tee 4
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 3
                  local.get 2
                  i32.const -8
                  i32.add
                  local.tee 5
                  i32.gt_u
                  br_if 3 (;@4;)
                  br 2 (;@5;)
                end
                local.get 2
                i32.eqz
                br_if 4 (;@2;)
                block  ;; label = @7
                  local.get 1
                  i32.load8_u
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 4
                  br 4 (;@3;)
                end
                i32.const 1
                local.set 4
                local.get 2
                i32.const 1
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=1
                i32.eqz
                br_if 3 (;@3;)
                i32.const 2
                local.set 4
                local.get 2
                i32.const 2
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=2
                i32.eqz
                br_if 3 (;@3;)
                i32.const 3
                local.set 4
                local.get 2
                i32.const 3
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=3
                i32.eqz
                br_if 3 (;@3;)
                i32.const 4
                local.set 4
                local.get 2
                i32.const 4
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=4
                i32.eqz
                br_if 3 (;@3;)
                i32.const 5
                local.set 4
                local.get 2
                i32.const 5
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=5
                i32.eqz
                br_if 3 (;@3;)
                i32.const 6
                local.set 4
                local.get 2
                i32.const 6
                i32.eq
                br_if 4 (;@2;)
                local.get 1
                i32.load8_u offset=6
                i32.eqz
                br_if 3 (;@3;)
                br 4 (;@2;)
              end
              local.get 2
              i32.const -8
              i32.add
              local.set 5
              i32.const 0
              local.set 3
            end
            loop  ;; label = @5
              local.get 1
              local.get 3
              i32.add
              local.tee 4
              i32.const 4
              i32.add
              i32.load
              local.tee 6
              i32.const -16843009
              i32.add
              local.get 6
              i32.const -1
              i32.xor
              i32.and
              local.get 4
              i32.load
              local.tee 4
              i32.const -16843009
              i32.add
              local.get 4
              i32.const -1
              i32.xor
              i32.and
              i32.or
              i32.const -2139062144
              i32.and
              br_if 1 (;@4;)
              local.get 3
              i32.const 8
              i32.add
              local.tee 3
              local.get 5
              i32.le_u
              br_if 0 (;@5;)
            end
          end
          local.get 3
          local.get 2
          i32.eq
          br_if 1 (;@2;)
          loop  ;; label = @4
            block  ;; label = @5
              local.get 1
              local.get 3
              i32.add
              i32.load8_u
              br_if 0 (;@5;)
              local.get 3
              local.set 4
              br 2 (;@3;)
            end
            local.get 2
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            i32.ne
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 4
        i32.const 1
        i32.add
        local.get 2
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        i32.const 0
        i32.store offset=4
        local.get 0
        i32.const 8
        i32.add
        local.get 4
        i32.store
        local.get 0
        i32.const 1
        i32.store
        return
      end
      local.get 0
      i32.const 1
      i32.store offset=4
      local.get 0
      i32.const 1
      i32.store
      return
    end
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    i32.const 8
    i32.add
    local.get 2
    i32.store
    local.get 0
    i32.const 0
    i32.store)
  (func $core::fmt::num::imp::_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$::fmt::ha027f6e8cdd18387 (type 6) (param i32 i32) (result i32)
    local.get 0
    i64.load8_u
    i32.const 1
    local.get 1
    call $core::fmt::num::imp::fmt_u64::hea2c1a751e95b920)
  (func $core::result::unwrap_failed::hc7fc3acc4adf7bf6 (type 12) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=12
    local.get 5
    local.get 0
    i32.store offset=8
    local.get 5
    local.get 3
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=16
    local.get 5
    i32.const 24
    i32.add
    i32.const 12
    i32.add
    i64.const 2
    i64.store align=4
    local.get 5
    i32.const 48
    i32.add
    i32.const 12
    i32.add
    i32.const 58
    i32.store
    local.get 5
    i32.const 2
    i32.store offset=28
    local.get 5
    i32.const 1051780
    i32.store offset=24
    local.get 5
    i32.const 59
    i32.store offset=52
    local.get 5
    local.get 5
    i32.const 48
    i32.add
    i32.store offset=32
    local.get 5
    local.get 5
    i32.const 16
    i32.add
    i32.store offset=56
    local.get 5
    local.get 5
    i32.const 8
    i32.add
    i32.store offset=48
    local.get 5
    i32.const 24
    i32.add
    local.get 4
    call $core::panicking::panic_fmt::h5318dfeccdd30466
    unreachable)
  (func $core::option::expect_failed::h90e12276ee96550c (type 4) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 28
    i32.add
    i64.const 1
    i64.store align=4
    local.get 3
    i32.const 1
    i32.store offset=20
    local.get 3
    i32.const 1051564
    i32.store offset=16
    local.get 3
    i32.const 59
    i32.store offset=44
    local.get 3
    local.get 3
    i32.const 40
    i32.add
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 8
    i32.add
    i32.store offset=40
    local.get 3
    i32.const 16
    i32.add
    local.get 2
    call $core::panicking::panic_fmt::h5318dfeccdd30466
    unreachable)
  (func $_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$::fmt::hd3ecc17832c1aeff (type 6) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $core::fmt::Formatter::pad::hdb5d5c683ab6fe77)
  (func $_$LT$core..panic..location..Location$u20$as$u20$core..fmt..Display$GT$::fmt::h1dfad41ac74fe89f (type 6) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 44
    i32.add
    i32.const 7
    i32.store
    local.get 2
    i32.const 24
    i32.add
    i32.const 12
    i32.add
    i32.const 7
    i32.store
    local.get 2
    i32.const 12
    i32.add
    i64.const 3
    i64.store align=4
    local.get 2
    i32.const 3
    i32.store offset=4
    local.get 2
    i32.const 1051576
    i32.store
    local.get 2
    i32.const 59
    i32.store offset=28
    local.get 2
    local.get 0
    i32.store offset=24
    local.get 2
    local.get 0
    i32.const 12
    i32.add
    i32.store offset=40
    local.get 2
    local.get 0
    i32.const 8
    i32.add
    i32.store offset=32
    local.get 1
    i32.const 24
    i32.add
    i32.load
    local.set 0
    local.get 2
    local.get 2
    i32.const 24
    i32.add
    i32.store offset=8
    local.get 1
    i32.load offset=20
    local.get 0
    local.get 2
    call $core::fmt::write::he742b579cc4461da
    local.set 0
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_$LT$core..panic..panic_info..PanicInfo$u20$as$u20$core..fmt..Display$GT$::fmt::hf12053b4edf2a592 (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 1
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=20
      local.tee 4
      i32.const 1051600
      i32.const 12
      local.get 1
      i32.const 24
      i32.add
      i32.load
      local.tee 5
      i32.load offset=12
      local.tee 6
      call_indirect (type 5)
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=12
      local.set 1
      local.get 2
      i32.const 16
      i32.add
      i32.const 12
      i32.add
      i64.const 3
      i64.store align=4
      local.get 2
      i32.const 60
      i32.add
      i32.const 7
      i32.store
      local.get 2
      i32.const 40
      i32.add
      i32.const 12
      i32.add
      i32.const 7
      i32.store
      local.get 2
      i32.const 3
      i32.store offset=20
      local.get 2
      i32.const 1051576
      i32.store offset=16
      local.get 2
      local.get 1
      i32.const 12
      i32.add
      i32.store offset=56
      local.get 2
      local.get 1
      i32.const 8
      i32.add
      i32.store offset=48
      local.get 2
      i32.const 59
      i32.store offset=44
      local.get 2
      local.get 1
      i32.store offset=40
      local.get 2
      local.get 2
      i32.const 40
      i32.add
      i32.store offset=24
      local.get 4
      local.get 5
      local.get 2
      i32.const 16
      i32.add
      call $core::fmt::write::he742b579cc4461da
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=8
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.const 1051612
          i32.const 2
          local.get 6
          call_indirect (type 5)
          br_if 2 (;@1;)
          local.get 2
          i32.const 40
          i32.add
          i32.const 16
          i32.add
          local.get 1
          i32.const 16
          i32.add
          i64.load align=4
          i64.store
          local.get 2
          i32.const 40
          i32.add
          i32.const 8
          i32.add
          local.get 1
          i32.const 8
          i32.add
          i64.load align=4
          i64.store
          local.get 2
          local.get 1
          i64.load align=4
          i64.store offset=40
          local.get 4
          local.get 5
          local.get 2
          i32.const 40
          i32.add
          call $core::fmt::write::he742b579cc4461da
          br_if 2 (;@1;)
          br 1 (;@2;)
        end
        local.get 2
        local.get 0
        i32.load
        local.tee 1
        local.get 0
        i32.load offset=4
        i32.const 12
        i32.add
        i32.load
        call_indirect (type 2)
        local.get 2
        i64.load
        i64.const -4493808902380553279
        i64.xor
        local.get 2
        i32.const 8
        i32.add
        i64.load
        i64.const -163230743173927068
        i64.xor
        i64.or
        i64.eqz
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.const 1051612
        i32.const 2
        local.get 6
        call_indirect (type 5)
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.load
        local.get 1
        i32.load offset=4
        local.get 6
        call_indirect (type 5)
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 3
    end
    local.get 2
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $core::fmt::num::_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$::fmt::h8c09e6cb62ff79fe (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    i32.const 0
    local.set 3
    loop  ;; label = @1
      local.get 2
      local.get 3
      i32.add
      i32.const 127
      i32.add
      i32.const 48
      i32.const 87
      local.get 0
      i32.const 15
      i32.and
      local.tee 4
      i32.const 10
      i32.lt_u
      select
      local.get 4
      i32.add
      i32.store8
      local.get 3
      i32.const -1
      i32.add
      local.set 3
      local.get 0
      i32.const 16
      i32.lt_u
      local.set 4
      local.get 0
      i32.const 4
      i32.shr_u
      local.set 0
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 3
      i32.const 128
      i32.add
      local.tee 0
      i32.const 128
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 128
      i32.const 1051864
      call $core::slice::index::slice_start_index_len_fail::hfb1719074a270fbd
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1051880
    i32.const 2
    local.get 2
    local.get 3
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 3
    i32.sub
    call $core::fmt::Formatter::pad_integral::hab92dcedbfbc15fa
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $core::panicking::assert_failed_inner::h610911f03d5e9020 (type 13) (param i32 i32 i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee 7
    global.set $__stack_pointer
    local.get 7
    local.get 2
    i32.store offset=12
    local.get 7
    local.get 1
    i32.store offset=8
    local.get 7
    local.get 4
    i32.store offset=20
    local.get 7
    local.get 3
    i32.store offset=16
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const 255
            i32.and
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;) 0 (;@4;)
          end
          local.get 7
          i32.const 1051632
          i32.store offset=24
          i32.const 2
          local.set 2
          br 2 (;@1;)
        end
        local.get 7
        i32.const 1051634
        i32.store offset=24
        i32.const 2
        local.set 2
        br 1 (;@1;)
      end
      local.get 7
      i32.const 1051636
      i32.store offset=24
      i32.const 7
      local.set 2
    end
    local.get 7
    local.get 2
    i32.store offset=28
    block  ;; label = @1
      local.get 5
      i32.load
      br_if 0 (;@1;)
      local.get 7
      i32.const 76
      i32.add
      i32.const 58
      i32.store
      local.get 7
      i32.const 56
      i32.add
      i32.const 12
      i32.add
      i32.const 58
      i32.store
      local.get 7
      i32.const 88
      i32.add
      i32.const 12
      i32.add
      i64.const 3
      i64.store align=4
      local.get 7
      i32.const 3
      i32.store offset=92
      local.get 7
      i32.const 1051692
      i32.store offset=88
      local.get 7
      i32.const 59
      i32.store offset=60
      local.get 7
      local.get 7
      i32.const 56
      i32.add
      i32.store offset=96
      local.get 7
      local.get 7
      i32.const 16
      i32.add
      i32.store offset=72
      local.get 7
      local.get 7
      i32.const 8
      i32.add
      i32.store offset=64
      local.get 7
      local.get 7
      i32.const 24
      i32.add
      i32.store offset=56
      local.get 7
      i32.const 88
      i32.add
      local.get 6
      call $core::panicking::panic_fmt::h5318dfeccdd30466
      unreachable
    end
    local.get 7
    i32.const 32
    i32.add
    i32.const 16
    i32.add
    local.get 5
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 7
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    local.get 5
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 7
    local.get 5
    i64.load align=4
    i64.store offset=32
    local.get 7
    i32.const 88
    i32.add
    i32.const 12
    i32.add
    i64.const 4
    i64.store align=4
    local.get 7
    i32.const 84
    i32.add
    i32.const 58
    i32.store
    local.get 7
    i32.const 76
    i32.add
    i32.const 58
    i32.store
    local.get 7
    i32.const 56
    i32.add
    i32.const 12
    i32.add
    i32.const 60
    i32.store
    local.get 7
    i32.const 4
    i32.store offset=92
    local.get 7
    i32.const 1051744
    i32.store offset=88
    local.get 7
    i32.const 59
    i32.store offset=60
    local.get 7
    local.get 7
    i32.const 56
    i32.add
    i32.store offset=96
    local.get 7
    local.get 7
    i32.const 16
    i32.add
    i32.store offset=80
    local.get 7
    local.get 7
    i32.const 8
    i32.add
    i32.store offset=72
    local.get 7
    local.get 7
    i32.const 32
    i32.add
    i32.store offset=64
    local.get 7
    local.get 7
    i32.const 24
    i32.add
    i32.store offset=56
    local.get 7
    i32.const 88
    i32.add
    local.get 6
    call $core::panicking::panic_fmt::h5318dfeccdd30466
    unreachable)
  (func $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h3a7f5fe5a7973e6c (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 6))
  (func $_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$::fmt::hebe8eb43e9f38a0d (type 6) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    local.get 1
    i32.const 24
    i32.add
    i32.load
    local.get 0
    call $core::fmt::write::he742b579cc4461da)
  (func $_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$::write_str::h8970ea6f78cef791 (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 3
    local.get 0
    i32.load
    local.set 4
    local.get 0
    i32.load offset=8
    local.set 5
    i32.const 0
    local.set 6
    i32.const 0
    local.set 7
    i32.const 0
    local.set 8
    i32.const 0
    local.set 9
    block  ;; label = @1
      loop  ;; label = @2
        local.get 9
        i32.const 255
        i32.and
        br_if 1 (;@1;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 8
            local.get 2
            i32.gt_u
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 1
              local.get 8
              i32.add
              local.set 10
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 2
                        local.get 8
                        i32.sub
                        local.tee 11
                        i32.const 8
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 10
                        i32.const 3
                        i32.add
                        i32.const -4
                        i32.and
                        local.tee 0
                        local.get 10
                        i32.eq
                        br_if 1 (;@9;)
                        local.get 0
                        local.get 10
                        i32.sub
                        local.tee 0
                        i32.eqz
                        br_if 1 (;@9;)
                        i32.const 0
                        local.set 12
                        loop  ;; label = @11
                          local.get 10
                          local.get 12
                          i32.add
                          i32.load8_u
                          i32.const 10
                          i32.eq
                          br_if 5 (;@6;)
                          local.get 0
                          local.get 12
                          i32.const 1
                          i32.add
                          local.tee 12
                          i32.ne
                          br_if 0 (;@11;)
                        end
                        local.get 0
                        local.get 11
                        i32.const -8
                        i32.add
                        local.tee 13
                        i32.gt_u
                        br_if 3 (;@7;)
                        br 2 (;@8;)
                      end
                      block  ;; label = @10
                        local.get 2
                        local.get 8
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 2
                        local.set 8
                        br 6 (;@4;)
                      end
                      i32.const 0
                      local.set 12
                      loop  ;; label = @10
                        local.get 10
                        local.get 12
                        i32.add
                        i32.load8_u
                        i32.const 10
                        i32.eq
                        br_if 4 (;@6;)
                        local.get 11
                        local.get 12
                        i32.const 1
                        i32.add
                        local.tee 12
                        i32.ne
                        br_if 0 (;@10;)
                      end
                      local.get 2
                      local.set 8
                      br 5 (;@4;)
                    end
                    local.get 11
                    i32.const -8
                    i32.add
                    local.set 13
                    i32.const 0
                    local.set 0
                  end
                  loop  ;; label = @8
                    local.get 10
                    local.get 0
                    i32.add
                    local.tee 12
                    i32.const 4
                    i32.add
                    i32.load
                    local.tee 9
                    i32.const 168430090
                    i32.xor
                    i32.const -16843009
                    i32.add
                    local.get 9
                    i32.const -1
                    i32.xor
                    i32.and
                    local.get 12
                    i32.load
                    local.tee 12
                    i32.const 168430090
                    i32.xor
                    i32.const -16843009
                    i32.add
                    local.get 12
                    i32.const -1
                    i32.xor
                    i32.and
                    i32.or
                    i32.const -2139062144
                    i32.and
                    br_if 1 (;@7;)
                    local.get 0
                    i32.const 8
                    i32.add
                    local.tee 0
                    local.get 13
                    i32.le_u
                    br_if 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  local.get 0
                  local.get 11
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 2
                  local.set 8
                  br 3 (;@4;)
                end
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 10
                    local.get 0
                    i32.add
                    i32.load8_u
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 0
                    local.set 12
                    br 2 (;@6;)
                  end
                  local.get 11
                  local.get 0
                  i32.const 1
                  i32.add
                  local.tee 0
                  i32.ne
                  br_if 0 (;@7;)
                end
                local.get 2
                local.set 8
                br 2 (;@4;)
              end
              local.get 8
              local.get 12
              i32.add
              local.tee 0
              i32.const 1
              i32.add
              local.set 8
              block  ;; label = @6
                local.get 0
                local.get 2
                i32.ge_u
                br_if 0 (;@6;)
                local.get 1
                local.get 0
                i32.add
                i32.load8_u
                i32.const 10
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                local.set 9
                local.get 8
                local.set 13
                local.get 8
                local.set 0
                br 3 (;@3;)
              end
              local.get 8
              local.get 2
              i32.le_u
              br_if 0 (;@5;)
            end
          end
          i32.const 1
          local.set 9
          local.get 7
          local.set 13
          local.get 2
          local.set 0
          local.get 7
          local.get 2
          i32.eq
          br_if 2 (;@1;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 5
            i32.load8_u
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.const 1051820
            i32.const 4
            local.get 3
            i32.load offset=12
            call_indirect (type 5)
            br_if 1 (;@3;)
          end
          local.get 1
          local.get 7
          i32.add
          local.set 12
          local.get 0
          local.get 7
          i32.sub
          local.set 10
          i32.const 0
          local.set 11
          block  ;; label = @4
            local.get 0
            local.get 7
            i32.eq
            br_if 0 (;@4;)
            local.get 10
            local.get 12
            i32.add
            i32.const -1
            i32.add
            i32.load8_u
            i32.const 10
            i32.eq
            local.set 11
          end
          local.get 5
          local.get 11
          i32.store8
          local.get 13
          local.set 7
          local.get 4
          local.get 12
          local.get 10
          local.get 3
          i32.load offset=12
          call_indirect (type 5)
          i32.eqz
          br_if 1 (;@2;)
        end
      end
      i32.const 1
      local.set 6
    end
    local.get 6)
  (func $_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$::write_char::hf0c9319e0dc6cbfa (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load offset=4
    local.set 2
    local.get 0
    i32.load
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 1051820
      i32.const 4
      local.get 2
      i32.load offset=12
      call_indirect (type 5)
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      return
    end
    local.get 0
    local.get 1
    i32.const 10
    i32.eq
    i32.store8
    local.get 3
    local.get 1
    local.get 2
    i32.load offset=16
    call_indirect (type 6))
  (func $core::fmt::builders::DebugTuple::field::h28db56cf383cbbe9 (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 4
    i32.const 1
    local.set 5
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=8
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 6
        i32.load offset=28
        local.tee 7
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 5
        local.get 6
        i32.load offset=20
        i32.const 1051824
        i32.const 1051828
        local.get 4
        select
        i32.const 2
        i32.const 1
        local.get 4
        select
        local.get 6
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
        local.get 1
        local.get 6
        local.get 2
        i32.load offset=12
        call_indirect (type 6)
        local.set 5
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        i32.const 1
        local.set 5
        local.get 6
        i32.load offset=20
        i32.const 1051829
        i32.const 2
        local.get 6
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
        local.get 6
        i32.load offset=28
        local.set 7
      end
      i32.const 1
      local.set 5
      local.get 3
      i32.const 1
      i32.store8 offset=27
      local.get 3
      i32.const 52
      i32.add
      i32.const 1051796
      i32.store
      local.get 3
      local.get 6
      i64.load offset=20 align=4
      i64.store offset=12 align=4
      local.get 3
      local.get 3
      i32.const 27
      i32.add
      i32.store offset=20
      local.get 3
      local.get 6
      i64.load offset=8 align=4
      i64.store offset=36 align=4
      local.get 6
      i64.load align=4
      local.set 8
      local.get 3
      local.get 7
      i32.store offset=56
      local.get 3
      local.get 6
      i32.load offset=16
      i32.store offset=44
      local.get 3
      local.get 6
      i32.load8_u offset=32
      i32.store8 offset=60
      local.get 3
      local.get 8
      i64.store offset=28 align=4
      local.get 3
      local.get 3
      i32.const 12
      i32.add
      i32.store offset=48
      local.get 1
      local.get 3
      i32.const 28
      i32.add
      local.get 2
      i32.load offset=12
      call_indirect (type 6)
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=48
      i32.const 1051826
      i32.const 2
      local.get 3
      i32.load offset=52
      i32.load offset=12
      call_indirect (type 5)
      local.set 5
    end
    local.get 0
    local.get 5
    i32.store8 offset=8
    local.get 0
    local.get 4
    i32.const 1
    i32.add
    i32.store
    local.get 3
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $core::fmt::builders::DebugSet::entry::h5325a031c885a89f (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 1
    local.set 4
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load8_u offset=5
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 5
          i32.load offset=28
          local.tee 6
          i32.const 4
          i32.and
          br_if 0 (;@3;)
          local.get 4
          i32.const 255
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          i32.const 1
          local.set 4
          local.get 5
          i32.load offset=20
          i32.const 1051824
          i32.const 2
          local.get 5
          i32.const 24
          i32.add
          i32.load
          i32.load offset=12
          call_indirect (type 5)
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 4
          i32.const 255
          i32.and
          br_if 0 (;@3;)
          i32.const 1
          local.set 4
          local.get 5
          i32.load offset=20
          i32.const 1051832
          i32.const 1
          local.get 5
          i32.const 24
          i32.add
          i32.load
          i32.load offset=12
          call_indirect (type 5)
          br_if 2 (;@1;)
          local.get 5
          i32.load offset=28
          local.set 6
        end
        i32.const 1
        local.set 4
        local.get 3
        i32.const 1
        i32.store8 offset=27
        local.get 3
        i32.const 52
        i32.add
        i32.const 1051796
        i32.store
        local.get 3
        local.get 5
        i64.load offset=20 align=4
        i64.store offset=12 align=4
        local.get 3
        local.get 3
        i32.const 27
        i32.add
        i32.store offset=20
        local.get 3
        local.get 5
        i64.load offset=8 align=4
        i64.store offset=36 align=4
        local.get 5
        i64.load align=4
        local.set 7
        local.get 3
        local.get 6
        i32.store offset=56
        local.get 3
        local.get 5
        i32.load offset=16
        i32.store offset=44
        local.get 3
        local.get 5
        i32.load8_u offset=32
        i32.store8 offset=60
        local.get 3
        local.get 7
        i64.store offset=28 align=4
        local.get 3
        local.get 3
        i32.const 12
        i32.add
        i32.store offset=48
        local.get 1
        local.get 3
        i32.const 28
        i32.add
        local.get 2
        i32.load offset=12
        call_indirect (type 6)
        br_if 1 (;@1;)
        local.get 3
        i32.load offset=48
        i32.const 1051826
        i32.const 2
        local.get 3
        i32.load offset=52
        i32.load offset=12
        call_indirect (type 5)
        local.set 4
        br 1 (;@1;)
      end
      local.get 1
      local.get 5
      local.get 2
      i32.load offset=12
      call_indirect (type 6)
      local.set 4
    end
    local.get 0
    i32.const 1
    i32.store8 offset=5
    local.get 0
    local.get 4
    i32.store8 offset=4
    local.get 3
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $core::fmt::builders::DebugList::finish::he438d931749ecb0a (type 3) (param i32) (result i32)
    (local i32)
    i32.const 1
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 0
      i32.load offset=20
      i32.const 1051833
      i32.const 1
      local.get 0
      i32.const 24
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 5)
      local.set 1
    end
    local.get 1)
  (func $core::fmt::Formatter::pad_integral::hab92dcedbfbc15fa (type 14) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 5
        i32.const 1
        i32.add
        local.set 6
        local.get 0
        i32.load offset=28
        local.set 7
        i32.const 45
        local.set 8
        br 1 (;@1;)
      end
      i32.const 43
      i32.const 1114112
      local.get 0
      i32.load offset=28
      local.tee 7
      i32.const 1
      i32.and
      local.tee 1
      select
      local.set 8
      local.get 1
      local.get 5
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 7
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          call $core::str::count::do_count_chars::h4ac0b6b94227293b
          local.set 1
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          br 1 (;@2;)
        end
        local.get 3
        i32.const 3
        i32.and
        local.set 9
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 4
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            i32.const 0
            local.set 10
            br 1 (;@3;)
          end
          local.get 3
          i32.const -4
          i32.and
          local.set 11
          i32.const 0
          local.set 1
          i32.const 0
          local.set 10
          loop  ;; label = @4
            local.get 1
            local.get 2
            local.get 10
            i32.add
            local.tee 12
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 11
            local.get 10
            i32.const 4
            i32.add
            local.tee 10
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 10
        i32.add
        local.set 12
        loop  ;; label = @3
          local.get 1
          local.get 12
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 1
          local.get 12
          i32.const 1
          i32.add
          local.set 12
          local.get 9
          i32.const -1
          i32.add
          local.tee 9
          br_if 0 (;@3;)
        end
      end
      local.get 1
      local.get 6
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $core::fmt::Formatter::pad_integral::write_prefix::hd1b830501ca319e2
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 9
        local.get 6
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $core::fmt::Formatter::pad_integral::write_prefix::hd1b830501ca319e2
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      block  ;; label = @2
        local.get 7
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=16
        local.set 11
        local.get 0
        i32.const 48
        i32.store offset=16
        local.get 0
        i32.load8_u offset=32
        local.set 7
        i32.const 1
        local.set 1
        local.get 0
        i32.const 1
        i32.store8 offset=32
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $core::fmt::Formatter::pad_integral::write_prefix::hd1b830501ca319e2
        br_if 1 (;@1;)
        local.get 9
        local.get 6
        i32.sub
        i32.const 1
        i32.add
        local.set 1
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i32.const -1
            i32.add
            local.tee 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 12
            i32.const 48
            local.get 10
            i32.load offset=16
            call_indirect (type 6)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        i32.const 1
        local.set 1
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
        local.get 0
        local.get 7
        i32.store8 offset=32
        local.get 0
        local.get 11
        i32.store offset=16
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 9
      local.get 6
      i32.sub
      local.set 6
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u offset=32
            local.tee 1
            br_table 2 (;@2;) 0 (;@4;) 1 (;@3;) 0 (;@4;) 2 (;@2;)
          end
          local.get 6
          local.set 1
          i32.const 0
          local.set 6
          br 1 (;@2;)
        end
        local.get 6
        i32.const 1
        i32.shr_u
        local.set 1
        local.get 6
        i32.const 1
        i32.add
        i32.const 1
        i32.shr_u
        local.set 6
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      i32.const 24
      i32.add
      i32.load
      local.set 12
      local.get 0
      i32.load offset=16
      local.set 9
      local.get 0
      i32.load offset=20
      local.set 10
      block  ;; label = @2
        loop  ;; label = @3
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
          local.get 10
          local.get 9
          local.get 12
          i32.load offset=16
          call_indirect (type 6)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        return
      end
      i32.const 1
      local.set 1
      local.get 10
      local.get 12
      local.get 8
      local.get 2
      local.get 3
      call $core::fmt::Formatter::pad_integral::write_prefix::hd1b830501ca319e2
      br_if 0 (;@1;)
      local.get 10
      local.get 4
      local.get 5
      local.get 12
      i32.load offset=12
      call_indirect (type 5)
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 6
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 6
          local.get 6
          i32.lt_u
          return
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 10
        local.get 9
        local.get 12
        i32.load offset=16
        call_indirect (type 6)
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const -1
      i32.add
      local.get 6
      i32.lt_u
      return
    end
    local.get 1)
  (func $core::fmt::Write::write_fmt::h38bd53c8e9e9338f (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.const 1051796
    local.get 1
    call $core::fmt::write::he742b579cc4461da)
  (func $core::str::count::do_count_chars::h4ac0b6b94227293b (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 0
        i32.const 3
        i32.add
        i32.const -4
        i32.and
        local.tee 2
        local.get 0
        i32.sub
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.sub
        local.tee 4
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        i32.const 3
        i32.and
        local.set 5
        i32.const 0
        local.set 6
        i32.const 0
        local.set 1
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.eq
          local.tee 7
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              local.get 0
              i32.const -1
              i32.xor
              i32.add
              i32.const 3
              i32.ge_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 8
              br 1 (;@4;)
            end
            i32.const 0
            local.set 8
            loop  ;; label = @5
              local.get 1
              local.get 0
              local.get 8
              i32.add
              local.tee 9
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 9
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 9
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 9
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 1
              local.get 8
              i32.const 4
              i32.add
              local.tee 8
              br_if 0 (;@5;)
            end
          end
          local.get 7
          br_if 0 (;@3;)
          local.get 0
          local.get 2
          i32.sub
          local.set 2
          local.get 0
          local.get 8
          i32.add
          local.set 9
          loop  ;; label = @4
            local.get 1
            local.get 9
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 9
            i32.const 1
            i32.add
            local.set 9
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            br_if 0 (;@4;)
          end
        end
        local.get 0
        local.get 3
        i32.add
        local.set 8
        block  ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          local.get 4
          i32.const -4
          i32.and
          i32.add
          local.tee 9
          i32.load8_s
          i32.const -65
          i32.gt_s
          local.set 6
          local.get 5
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 9
          i32.load8_s offset=1
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
          local.get 5
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 9
          i32.load8_s offset=2
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
        end
        local.get 4
        i32.const 2
        i32.shr_u
        local.set 3
        local.get 6
        local.get 1
        i32.add
        local.set 2
        loop  ;; label = @3
          local.get 8
          local.set 6
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 192
          local.get 3
          i32.const 192
          i32.lt_u
          select
          local.tee 4
          i32.const 3
          i32.and
          local.set 7
          local.get 4
          i32.const 2
          i32.shl
          local.set 5
          i32.const 0
          local.set 9
          block  ;; label = @4
            local.get 4
            i32.const 4
            i32.lt_u
            br_if 0 (;@4;)
            local.get 6
            local.get 5
            i32.const 1008
            i32.and
            i32.add
            local.set 0
            i32.const 0
            local.set 9
            local.get 6
            local.set 1
            loop  ;; label = @5
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.tee 8
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 8
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.const 8
              i32.add
              i32.load
              local.tee 8
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 8
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.tee 8
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 8
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.load
              local.tee 8
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 8
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 9
              i32.add
              i32.add
              i32.add
              i32.add
              local.set 9
              local.get 1
              i32.const 16
              i32.add
              local.tee 1
              local.get 0
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 3
          local.get 4
          i32.sub
          local.set 3
          local.get 6
          local.get 5
          i32.add
          local.set 8
          local.get 9
          i32.const 8
          i32.shr_u
          i32.const 16711935
          i32.and
          local.get 9
          i32.const 16711935
          i32.and
          i32.add
          i32.const 65537
          i32.mul
          i32.const 16
          i32.shr_u
          local.get 2
          i32.add
          local.set 2
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 6
        local.get 4
        i32.const 252
        i32.and
        i32.const 2
        i32.shl
        i32.add
        local.tee 9
        i32.load
        local.tee 1
        i32.const -1
        i32.xor
        i32.const 7
        i32.shr_u
        local.get 1
        i32.const 6
        i32.shr_u
        i32.or
        i32.const 16843009
        i32.and
        local.set 1
        block  ;; label = @3
          local.get 7
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 9
          i32.load offset=4
          local.tee 8
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 8
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
          local.get 7
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 9
          i32.load offset=8
          local.tee 9
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 9
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
        end
        local.get 1
        i32.const 8
        i32.shr_u
        i32.const 459007
        i32.and
        local.get 1
        i32.const 16711935
        i32.and
        i32.add
        i32.const 65537
        i32.mul
        i32.const 16
        i32.shr_u
        local.get 2
        i32.add
        return
      end
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 1
      i32.const 3
      i32.and
      local.set 8
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 4
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 2
          i32.const 0
          local.set 9
          br 1 (;@2;)
        end
        local.get 1
        i32.const -4
        i32.and
        local.set 3
        i32.const 0
        local.set 2
        i32.const 0
        local.set 9
        loop  ;; label = @3
          local.get 2
          local.get 0
          local.get 9
          i32.add
          local.tee 1
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 1
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 2
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 3
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 2
          local.get 3
          local.get 9
          i32.const 4
          i32.add
          local.tee 9
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 8
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 9
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 2
        local.get 1
        i32.load8_s
        i32.const -65
        i32.gt_s
        i32.add
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 8
        i32.const -1
        i32.add
        local.tee 8
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func $core::fmt::Formatter::pad_integral::write_prefix::hd1b830501ca319e2 (type 10) (param i32 i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 1114112
          i32.eq
          br_if 0 (;@3;)
          i32.const 1
          local.set 5
          local.get 0
          local.get 2
          local.get 1
          i32.load offset=16
          call_indirect (type 6)
          br_if 1 (;@2;)
        end
        local.get 3
        br_if 1 (;@1;)
        i32.const 0
        local.set 5
      end
      local.get 5
      return
    end
    local.get 0
    local.get 3
    local.get 4
    local.get 1
    i32.load offset=12
    call_indirect (type 5))
  (func $core::fmt::Formatter::write_str::hd832a14d3ebc1619 (type 5) (param i32 i32 i32) (result i32)
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 5))
  (func $core::fmt::Formatter::write_fmt::hdf1a415742e2a22b (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=20
    local.get 0
    i32.const 24
    i32.add
    i32.load
    local.get 1
    call $core::fmt::write::he742b579cc4461da)
  (func $core::fmt::Formatter::debug_tuple_field1_finish::hdff30d39fb3c99d5 (type 10) (param i32 i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 5)
    i32.store8 offset=12
    local.get 5
    local.get 0
    i32.store offset=8
    local.get 5
    local.get 2
    i32.eqz
    i32.store8 offset=13
    local.get 5
    i32.const 0
    i32.store offset=4
    local.get 5
    i32.const 4
    i32.add
    local.get 3
    local.get 4
    call $core::fmt::builders::DebugTuple::field::h28db56cf383cbbe9
    local.set 0
    local.get 5
    i32.load8_u offset=12
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 1
        br_if 0 (;@2;)
        local.get 2
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 0
        br 1 (;@1;)
      end
      i32.const 1
      local.set 0
      local.get 2
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=8
      local.set 2
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 5
        i32.load8_u offset=13
        i32.const 255
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load8_u offset=28
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 0
        local.get 2
        i32.load offset=20
        i32.const 1051831
        i32.const 1
        local.get 2
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
      end
      local.get 2
      i32.load offset=20
      i32.const 1051520
      i32.const 1
      local.get 2
      i32.const 24
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 5)
      local.set 0
    end
    local.get 5
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $core::fmt::Formatter::debug_tuple_field2_finish::ha1725a08f0d66504 (type 15) (param i32 i32 i32 i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 7
    global.set $__stack_pointer
    local.get 7
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 5)
    i32.store8 offset=12
    local.get 7
    local.get 0
    i32.store offset=8
    local.get 7
    local.get 2
    i32.eqz
    i32.store8 offset=13
    local.get 7
    i32.const 0
    i32.store offset=4
    local.get 7
    i32.const 4
    i32.add
    local.get 3
    local.get 4
    call $core::fmt::builders::DebugTuple::field::h28db56cf383cbbe9
    local.get 5
    local.get 6
    call $core::fmt::builders::DebugTuple::field::h28db56cf383cbbe9
    local.set 0
    local.get 7
    i32.load8_u offset=12
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 1
        br_if 0 (;@2;)
        local.get 2
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 0
        br 1 (;@1;)
      end
      i32.const 1
      local.set 0
      local.get 2
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      local.get 7
      i32.load offset=8
      local.set 2
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 7
        i32.load8_u offset=13
        i32.const 255
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load8_u offset=28
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 0
        local.get 2
        i32.load offset=20
        i32.const 1051831
        i32.const 1
        local.get 2
        i32.const 24
        i32.add
        i32.load
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
      end
      local.get 2
      i32.load offset=20
      i32.const 1051520
      i32.const 1
      local.get 2
      i32.const 24
      i32.add
      i32.load
      i32.load offset=12
      call_indirect (type 5)
      local.set 0
    end
    local.get 7
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $core::fmt::Formatter::debug_list::h454de1ae3271f93b (type 2) (param i32 i32)
    (local i32)
    local.get 1
    i32.load offset=20
    i32.const 1051573
    i32.const 1
    local.get 1
    i32.const 24
    i32.add
    i32.load
    i32.load offset=12
    call_indirect (type 5)
    local.set 2
    local.get 0
    i32.const 0
    i32.store8 offset=5
    local.get 0
    local.get 2
    i32.store8 offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_$LT$bool$u20$as$u20$core..fmt..Display$GT$::fmt::h8663ae5543f3e281 (type 6) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load8_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 1052082
      i32.const 5
      call $core::fmt::Formatter::pad::hdb5d5c683ab6fe77
      return
    end
    local.get 1
    i32.const 1052087
    i32.const 4
    call $core::fmt::Formatter::pad::hdb5d5c683ab6fe77)
  (func $_$LT$str$u20$as$u20$core..fmt..Display$GT$::fmt::h02dbbed087bb8109 (type 5) (param i32 i32 i32) (result i32)
    local.get 2
    local.get 0
    local.get 1
    call $core::fmt::Formatter::pad::hdb5d5c683ab6fe77)
  (func $core::slice::memchr::memchr_aligned::h3af965063b51a756 (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 3
            i32.add
            i32.const -4
            i32.and
            local.tee 4
            local.get 2
            i32.eq
            br_if 0 (;@4;)
            local.get 4
            local.get 2
            i32.sub
            local.tee 4
            local.get 3
            local.get 4
            local.get 3
            i32.lt_u
            select
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 5
            local.get 1
            i32.const 255
            i32.and
            local.set 6
            i32.const 1
            local.set 7
            loop  ;; label = @5
              local.get 2
              local.get 5
              i32.add
              i32.load8_u
              local.get 6
              i32.eq
              br_if 4 (;@1;)
              local.get 4
              local.get 5
              i32.const 1
              i32.add
              local.tee 5
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 4
            local.get 3
            i32.const -8
            i32.add
            local.tee 8
            i32.gt_u
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
          local.get 3
          i32.const -8
          i32.add
          local.set 8
          i32.const 0
          local.set 4
        end
        local.get 1
        i32.const 255
        i32.and
        i32.const 16843009
        i32.mul
        local.set 5
        loop  ;; label = @3
          local.get 2
          local.get 4
          i32.add
          local.tee 6
          i32.const 4
          i32.add
          i32.load
          local.get 5
          i32.xor
          local.tee 7
          i32.const -16843009
          i32.add
          local.get 7
          i32.const -1
          i32.xor
          i32.and
          local.get 6
          i32.load
          local.get 5
          i32.xor
          local.tee 6
          i32.const -16843009
          i32.add
          local.get 6
          i32.const -1
          i32.xor
          i32.and
          i32.or
          i32.const -2139062144
          i32.and
          br_if 1 (;@2;)
          local.get 4
          i32.const 8
          i32.add
          local.tee 4
          local.get 8
          i32.le_u
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      local.set 7
      block  ;; label = @2
        local.get 4
        local.get 3
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        i32.const 255
        i32.and
        local.set 5
        loop  ;; label = @3
          block  ;; label = @4
            local.get 2
            local.get 4
            i32.add
            i32.load8_u
            local.get 5
            i32.ne
            br_if 0 (;@4;)
            local.get 4
            local.set 5
            i32.const 1
            local.set 7
            br 3 (;@1;)
          end
          local.get 3
          local.get 4
          i32.const 1
          i32.add
          local.tee 4
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 3
      local.set 5
    end
    local.get 0
    local.get 5
    i32.store offset=4
    local.get 0
    local.get 7
    i32.store)
  (func $core::fmt::num::_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i8$GT$::fmt::hf957f32f03d84197 (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load8_u
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      local.get 0
      i32.add
      i32.const 127
      i32.add
      i32.const 48
      i32.const 55
      local.get 3
      i32.const 15
      i32.and
      local.tee 4
      i32.const 10
      i32.lt_u
      select
      local.get 4
      i32.add
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 255
      i32.and
      local.tee 4
      i32.const 4
      i32.shr_u
      local.set 3
      local.get 4
      i32.const 16
      i32.ge_u
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 0
      i32.const 128
      i32.add
      local.tee 3
      i32.const 128
      i32.le_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 128
      i32.const 1051864
      call $core::slice::index::slice_start_index_len_fail::hfb1719074a270fbd
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1051880
    i32.const 2
    local.get 2
    local.get 0
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $core::fmt::Formatter::pad_integral::hab92dcedbfbc15fa
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $core::fmt::num::_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i8$GT$::fmt::hd72fbff1ec49255f (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load8_u
    local.set 3
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 2
      local.get 0
      i32.add
      i32.const 127
      i32.add
      i32.const 48
      i32.const 87
      local.get 3
      i32.const 15
      i32.and
      local.tee 4
      i32.const 10
      i32.lt_u
      select
      local.get 4
      i32.add
      i32.store8
      local.get 0
      i32.const -1
      i32.add
      local.set 0
      local.get 3
      i32.const 255
      i32.and
      local.tee 4
      i32.const 4
      i32.shr_u
      local.set 3
      local.get 4
      i32.const 16
      i32.ge_u
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 0
      i32.const 128
      i32.add
      local.tee 3
      i32.const 128
      i32.le_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 128
      i32.const 1051864
      call $core::slice::index::slice_start_index_len_fail::hfb1719074a270fbd
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1051880
    i32.const 2
    local.get 2
    local.get 0
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 0
    i32.sub
    call $core::fmt::Formatter::pad_integral::hab92dcedbfbc15fa
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $core::fmt::num::imp::fmt_u64::hea2c1a751e95b920 (type 16) (param i64 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 39
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.const 10000
        i64.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 5
        br 1 (;@1;)
      end
      i32.const 39
      local.set 4
      loop  ;; label = @2
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 0
        local.get 0
        i64.const 10000
        i64.div_u
        local.tee 5
        i64.const 10000
        i64.mul
        i64.sub
        i32.wrap_i64
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.const 1051882
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 7
        local.get 8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 1051882
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 4
        i32.const -4
        i32.add
        local.set 4
        local.get 0
        i64.const 99999999
        i64.gt_u
        local.set 6
        local.get 5
        local.set 0
        local.get 6
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 5
      i32.wrap_i64
      local.tee 6
      i32.const 99
      i32.le_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -2
      i32.add
      local.tee 4
      i32.add
      local.get 5
      i32.wrap_i64
      local.tee 6
      local.get 6
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 6
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.const 1051882
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.const -2
        i32.add
        local.tee 4
        i32.add
        local.get 6
        i32.const 1
        i32.shl
        i32.const 1051882
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        br 1 (;@1;)
      end
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -1
      i32.add
      local.tee 4
      i32.add
      local.get 6
      i32.const 48
      i32.add
      i32.store8
    end
    local.get 2
    local.get 1
    i32.const 1051520
    i32.const 0
    local.get 3
    i32.const 9
    i32.add
    local.get 4
    i32.add
    i32.const 39
    local.get 4
    i32.sub
    call $core::fmt::Formatter::pad_integral::hab92dcedbfbc15fa
    local.set 4
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $core::fmt::num::_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$::fmt::h38cc0ec19c9bca48 (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    i32.const 0
    local.set 3
    loop  ;; label = @1
      local.get 2
      local.get 3
      i32.add
      i32.const 127
      i32.add
      i32.const 48
      i32.const 55
      local.get 0
      i32.const 15
      i32.and
      local.tee 4
      i32.const 10
      i32.lt_u
      select
      local.get 4
      i32.add
      i32.store8
      local.get 3
      i32.const -1
      i32.add
      local.set 3
      local.get 0
      i32.const 16
      i32.lt_u
      local.set 4
      local.get 0
      i32.const 4
      i32.shr_u
      local.set 0
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 3
      i32.const 128
      i32.add
      local.tee 0
      i32.const 128
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 128
      i32.const 1051864
      call $core::slice::index::slice_start_index_len_fail::hfb1719074a270fbd
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1051880
    i32.const 2
    local.get 2
    local.get 3
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 3
    i32.sub
    call $core::fmt::Formatter::pad_integral::hab92dcedbfbc15fa
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (table (;0;) 67 67 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (elem (;0;) (i32.const 1) func $hello::main::hb7b3890ee9daee14 $core::ptr::drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$::h8e212b48b3fb4e5f $core::ops::function::FnOnce::call_once$u7b$$u7b$vtable.shim$u7d$$u7d$::h2ded1b847c4da183 $std::rt::lang_start::_$u7b$$u7b$closure$u7d$$u7d$::hbaf4d041f180fb97 $_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$::fmt::haf91c68ed724588a $_$LT$std..sys_common..backtrace.._print..DisplayBacktrace$u20$as$u20$core..fmt..Display$GT$::fmt::h904749c5f1a60b7d $core::fmt::num::imp::_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$::fmt::h29fb969253e3cd7f $_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$::fmt::h81171607e1e94452 $_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$::fmt::h6e592427f5a867eb $_$LT$core..panic..panic_info..PanicInfo$u20$as$u20$core..fmt..Display$GT$::fmt::hf12053b4edf2a592 $std::alloc::default_alloc_error_hook::hc15ad6b0c6c51483 $core::ptr::drop_in_place$LT$$RF$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Sync$u2b$core..marker..Send$GT$$GT$::h4c65b221180b18dd $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h963c7d69dc6543a0 $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h2079d7df0a1eb8b0 $core::fmt::num::_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$::fmt::h0c9e60ab0a791324 $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h28708fd1c962f157 $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h6d8c8d1d35948efd $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h279b4a1bdf2e6d98 $core::ptr::drop_in_place$LT$alloc..string..String$GT$::hb6d62107c9eb146c $_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$::write_str::heb382b2c46f42892 $_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$::write_char::hdbb5a8debbf3869a $core::fmt::Write::write_fmt::h38938f948ad04fb5 $core::ptr::drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$::h7c2da7c0ed4859f5 $_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$::write_str::h55d1142903433de9 $core::fmt::Write::write_char::h5d5523b45bbe5748 $core::fmt::Write::write_fmt::h5f6df1021872fcd4 $_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$::write_str::hd8d11b51ef8f70c5 $core::fmt::Write::write_char::hc91a6ceb133a5c56 $core::fmt::Write::write_fmt::h54e558fbe9b645b1 $core::ptr::drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$::ha5109be51b049845 $std::io::impls::_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$::write::hbc834fce95ba6f38 $std::io::impls::_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$::write_vectored::hc5314be1b0b8188a $std::io::impls::_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$::is_write_vectored::h5c6f08d3987e141a $std::io::impls::_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$::flush::habcfd84f08fc16a7 $std::io::impls::_$LT$impl$u20$std..io..Write$u20$for$u20$alloc..vec..Vec$LT$u8$C$A$GT$$GT$::write_all::ha97b7046e137b85f $std::io::Write::write_all_vectored::h9d926dc1a80a6b06 $std::io::Write::write_fmt::ha48c60d67e874ccc $core::ptr::drop_in_place$LT$$LP$$RP$$GT$::h2646790de1351d8c $_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$::write::h9bcca047cf976e4d $_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$::write_vectored::hb1fc5e85961a2bb6 $_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$::is_write_vectored::h718bbac8dc691f53 $_$LT$std..sys..wasi..stdio..Stderr$u20$as$u20$std..io..Write$GT$::flush::ha766d64c92477a36 $std::io::Write::write_all::h7f34d387562b9235 $std::io::Write::write_all_vectored::h79d316cfae4f469a $std::io::Write::write_fmt::h3862c0cb55a9e920 $_$LT$T$u20$as$u20$core..any..Any$GT$::type_id::h7efadeb85ead2e08 $_$LT$T$u20$as$u20$core..any..Any$GT$::type_id::h1142b6be157e9bc4 $_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$::take_box::h6cf8e9933504b06b $_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$::get::h11feab045d226e6f $core::ptr::drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$::h21964594aec38a11 $_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$::take_box::h451c9df43699cc16 $_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$::get::h842de63b55a43102 $_$LT$T$u20$as$u20$core..any..Any$GT$::type_id::h586c8643717611c3 $core::ptr::drop_in_place$LT$core..fmt..Error$GT$::hbe1420f69b62f51b $_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$::fmt::h706bf782e098b50d $core::ops::function::FnOnce::call_once::h2313a80f63b698ab $_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$::fmt::hc84b356e3c18c4b5 $_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$::fmt::h3a7f5fe5a7973e6c $_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$::fmt::hd3ecc17832c1aeff $_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$::fmt::hebe8eb43e9f38a0d $core::ptr::drop_in_place$LT$core..fmt..Error$GT$::hab6e5eeb4d3b664e $_$LT$T$u20$as$u20$core..any..Any$GT$::type_id::h505136ea61780c6b $core::ptr::drop_in_place$LT$char$GT$::h23e8884b5441f9e8 $_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$::write_str::h8970ea6f78cef791 $_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$::write_char::hf0c9319e0dc6cbfa $core::fmt::Write::write_fmt::h38bd53c8e9e9338f)
  (data $.rodata (i32.const 1048576) "\02\00\00\00\04\00\00\00\04\00\00\00\03\00\00\00\04\00\00\00\04\00\00\00()\00\00\0c\00\00\00\04\00\00\00\04\00\00\00\0d\00\00\00reentrant init\00\00,\00\10\00\0e\00\00\00/rustc/ba7c7a301984967c8c13adb580ef9b86ba706a83/library/core/src/cell/once.rs\00\00\00D\00\10\00M\00\00\00\d9\00\00\00B\00\00\00\00\00\00\00\0c\00\00\00\04\00\00\00\04\00\00\00\0e\00\00\00called `Option::unwrap()` on a `None` valueinternal error: entered unreachable code/rustc/ba7c7a301984967c8c13adb580ef9b86ba706a83/library/alloc/src/vec/mod.rs\00\0b\01\10\00L\00\00\00\01\08\00\00$\00\00\00NulError\0c\00\00\00\04\00\00\00\04\00\00\00\0f\00\00\00\0c\00\00\00\04\00\00\00\04\00\00\00\10\00\00\00OkErr\00\00\00\0c\00\00\00\04\00\00\00\04\00\00\00\11\00\00\00\0c\00\00\00\04\00\00\00\04\00\00\00\12\00\00\00\13\00\00\00\0c\00\00\00\04\00\00\00\14\00\00\00\15\00\00\00\16\00\00\00\17\00\00\00\0c\00\00\00\04\00\00\00\18\00\00\00\19\00\00\00\1a\00\00\00\17\00\00\00\0c\00\00\00\04\00\00\00\1b\00\00\00\1c\00\00\00\1d\00\00\00mainfatal runtime error: unwrap failed: CString::new(\22main\22) = \0a\04\02\10\00;\00\00\00?\02\10\00\01\00\00\00library/std/src/rt.rs\00\00\00P\02\10\00\15\00\00\00r\00\00\00\0d\00\00\00library/std/src/thread/mod.rsfailed to generate unique thread ID: bitspace exhausted\95\02\10\007\00\00\00x\02\10\00\1d\00\00\00\9c\04\00\00\0d\00\00\00RUST_BACKTRACE\00\00,\00\10\00\00\00\00\00library/std/src/io/stdio.rs\00\fc\02\10\00\1b\00\00\00~\02\00\00\13\00\00\00library/std/src/io/mod.rs\00\00\00(\03\10\00\19\00\00\00s\05\00\00 \00\00\00advancing io slices beyond their length\00T\03\10\00'\00\00\00(\03\10\00\19\00\00\00u\05\00\00\0d\00\00\00advancing IoSlice beyond its length\00\94\03\10\00#\00\00\00library/std/src/sys/wasi/io.rs\00\00\c0\03\10\00\1e\00\00\00\17\00\00\00\0d\00\00\00failed to write whole buffer\f0\03\10\00\1c\00\00\00\17\00\00\00(\03\10\00\19\00\00\00]\06\00\00$\00\00\00formatter error\00(\04\10\00\0f\00\00\00(\00\00\00library/std/src/panic.rsD\04\10\00\18\00\00\00\f5\00\00\00\12\00\00\00fullcannot recursively acquire mutexp\04\10\00 \00\00\00library/std/src/sys/wasi/../unsupported/locks/mutex.rs\00\00\98\04\10\006\00\00\00\14\00\00\00\09\00\00\00library/std/src/sync/once.rs\e0\04\10\00\1c\00\00\00\95\00\00\002\00\00\00\e0\04\10\00\1c\00\00\00\d0\00\00\00\14\00\00\00\e0\04\10\00\1c\00\00\00\d0\00\00\001\00\00\00lock count overflow in reentrant mutexlibrary/std/src/sync/remutex.rs\00\00\00R\05\10\00\1f\00\00\00\91\00\00\00\0e\00\00\00file name contained an unexpected NUL byte\00\00\84\05\10\00*\00\00\00\14\00\00\00\00\00\00\00\02\00\00\00\b0\05\10\00stack backtrace:\0a\00\00\00\c8\05\10\00\11\00\00\00note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.\0a\e4\05\10\00X\00\00\00fatal runtime error: assertion failed: thread_info.stack_guard.get().is_none() && thread_info.thread.get().is_none()\0a\00\00\00D\06\10\00u\00\00\00memory allocation of  bytes failed\0a\00\c4\06\10\00\15\00\00\00\d9\06\10\00\0e\00\00\00 bytes failed\00\00\00\c4\06\10\00\15\00\00\00\f8\06\10\00\0d\00\00\00library/std/src/alloc.rs\18\07\10\00\18\00\00\00b\01\00\00\09\00\00\00library/std/src/panicking.rsBox<dyn Any><unnamed>\00\00\00\1e\00\00\00\0c\00\00\00\04\00\00\00\1f\00\00\00 \00\00\00!\00\00\00\22\00\00\00#\00\00\00$\00\00\00%\00\00\00&\00\00\00\00\00\00\00\01\00\00\00'\00\00\00(\00\00\00)\00\00\00*\00\00\00+\00\00\00,\00\00\00-\00\00\00thread '' panicked at :\0a\c4\07\10\00\08\00\00\00\cc\07\10\00\0e\00\00\00\da\07\10\00\02\00\00\00?\02\10\00\01\00\00\00note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace\0a\00\00\fc\07\10\00N\00\00\00@\07\10\00\1c\00\00\00\84\02\00\00\1e\00\00\00\13\00\00\00\0c\00\00\00\04\00\00\00.\00\00\00\0c\00\00\00\08\00\00\00\04\00\00\00/\00\00\00\0c\00\00\00\08\00\00\00\04\00\00\000\00\00\001\00\00\002\00\00\00\10\00\00\00\04\00\00\003\00\00\004\00\00\00&\00\00\00\00\00\00\00\01\00\00\005\00\00\00\0apanicked after panic::always_abort(), aborting.\0a\00\00\00,\00\10\00\00\00\00\00\bc\08\10\001\00\00\00thread panicked while processing panic. aborting.\0a\00\00\00\09\10\002\00\00\00thread caused non-unwinding panic. aborting.\0a\00\00\00<\09\10\00-\00\00\00fatal runtime error: failed to initiate panic, error \00\00\00t\09\10\005\00\00\00?\02\10\00\01\00\00\00fatal runtime error: rwlock locked for writing\0a\00\bc\09\10\00/\00\00\00Once instance has previously been poisoned\00\00\f4\09\10\00*\00\00\00one-time initialization may not be performed recursively(\0a\10\008\00\00\00/\00\00\00LayoutErrorlibrary/alloc/src/raw_vec.rscapacity overflow\93\0a\10\00\11\00\00\00w\0a\10\00\1c\00\00\00!\02\00\00\05\00\00\00called `Option::unwrap()` on a `None` valuelibrary/alloc/src/ffi/c_str.rs\00\00\00\e7\0a\10\00\1e\00\00\00\1b\01\00\007\00\00\00called `Result::unwrap()` on an `Err` value\006\00\00\00\00\00\00\00\01\00\00\007\00\00\00library/alloc/src/sync.rs\00\00\00T\0b\10\00\19\00\00\00o\01\00\002\00\00\00)BorrowMutErroralready borrowed: \00\00\00\8f\0b\10\00\12\00\00\00\80\0b\10\00\00\00\00\00:[\00\00\80\0b\10\00\00\00\00\00\b4\0b\10\00\01\00\00\00\b4\0b\10\00\01\00\00\00panicked at :\0a\00\00=\00\00\00\00\00\00\00\01\00\00\00>\00\00\00==!=matchesassertion `left  right` failed\0a  left: \0a right: \00\fb\0b\10\00\10\00\00\00\0b\0c\10\00\17\00\00\00\22\0c\10\00\09\00\00\00 right` failed: \0a  left: \00\00\00\fb\0b\10\00\10\00\00\00D\0c\10\00\10\00\00\00T\0c\10\00\09\00\00\00\22\0c\10\00\09\00\00\00: \00\00\80\0b\10\00\00\00\00\00\80\0c\10\00\02\00\00\00?\00\00\00\0c\00\00\00\04\00\00\00@\00\00\00A\00\00\00B\00\00\00    , ,\0a((\0a,\0a]library/core/src/fmt/num.rs\00\00\00\ba\0c\10\00\1b\00\00\00i\00\00\00\17\00\00\000x00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899falsetruerange start index  out of range for slice of length \00\bb\0d\10\00\12\00\00\00\cd\0d\10\00\22\00\00\00range end index \00\0e\10\00\10\00\00\00\cd\0d\10\00\22\00\00\00")
  (data $.data (i32.const 1052192) "\01\00\00\00\ff\ff\ff\ffh\0a\10\00"))
