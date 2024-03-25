(module
  (type (;0;) (func (param handle handle i32) (result i32)))
  (type (;1;) (func (param handle i64 i32) (result i64)))
  (type (;2;) (func (param handle)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 handle) (result i32)))
  (type (;5;) (func (param i32 i64 i32 handle) (result i32)))
  (type (;6;) (func (param i32 handle i32 handle) (result i32)))
  (type (;7;) (func (param i32)))
  (type (;8;) (func))
  (type (;9;) (func (result i32)))
  (type (;10;) (func (param handle handle) (result i32)))
  (type (;11;) (func (param handle) (result i32)))
  (type (;12;) (func (param i32 handle i32) (result i32)))
  (type (;13;) (func (param i32 i64 i32) (result i64)))
  (type (;14;) (func (param handle i32 handle) (result i32)))
  (type (;15;) (func (param handle i32 i32 handle) (result i32)))
  (type (;16;) (func (param i32) (result handle)))
  (type (;17;) (func (param handle handle handle) (result i32)))
  (type (;18;) (func (param handle handle handle handle handle) (result i32)))
  (type (;19;) (func (param handle i32 handle)))
  (type (;20;) (func (param handle handle i32) (result handle)))
  (type (;21;) (func (param handle i32 i32) (result handle)))
  (type (;22;) (func (param handle i32) (result i32)))
  (type (;23;) (func (param handle handle) (result handle)))
  (type (;24;) (func (param f64 handle) (result f64)))
  (import "env" "free" (func $free (type 2)))
  (import "wasi_snapshot_preview1" "fd_close" (func $__imported_wasi_snapshot_preview1_fd_close (type 3)))
  (import "wasi_snapshot_preview1" "fd_fdstat_get" (func $__imported_wasi_snapshot_preview1_fd_fdstat_get (type 4)))
  (import "wasi_snapshot_preview1" "fd_seek" (func $__imported_wasi_snapshot_preview1_fd_seek (type 5)))
  (import "wasi_snapshot_preview1" "fd_write" (func $__imported_wasi_snapshot_preview1_fd_write (type 6)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (type 7)))
  (func $__wasm_call_ctors (type 8)
    call $__mswasm_init_stack)
  (func $__mswasm_init_stack (type 8)
    i32.const 2097152
    new_segment
    i32.const 2097152
    handle.add
    global.set 0)
  (func $_start (type 8)
    (local i32)
    call $__wasm_call_ctors
    call $__original_main
    local.set 0
    call $__wasm_call_dtors
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      call $__wasi_proc_exit
      unreachable
    end)
  (func $main (type 9) (result i32)
    (local handle i32)
    global.get 0
    i32.const -32
    handle.add
    local.tee 0
    global.set 0
    local.get 0
    i32.const 0
    i32.store offset=28
    local.get 0
    i32.const 5
    i32.store offset=24
    local.get 0
    local.get 0
    i32.load offset=24
    i32.const 2
    i32.shl
    new_segment
    handle.store offset=16
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        handle.load offset=16
        handle.null
        handle.eq
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        global.get 1
        i32.const 1024
        handle.add
        handle.null
        call $printf
        drop
        local.get 0
        i32.const 1
        i32.store offset=28
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=12
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.load offset=12
          local.get 0
          i32.load offset=24
          i32.lt_s
          i32.const 1
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          handle.load offset=16
          local.get 0
          i32.load offset=12
          local.tee 1
          i32.const 2
          i32.shl
          handle.add
          local.get 1
          i32.const 10
          i32.mul
          i32.store
          local.get 0
          local.get 0
          i32.load offset=12
          i32.const 1
          i32.add
          i32.store offset=12
          br 0 (;@3;)
        end
      end
      local.get 0
      handle.load offset=16
      call $free
      local.get 0
      i32.const 0
      i32.store offset=28
    end
    local.get 0
    i32.load offset=28
    local.set 1
    local.get 0
    i32.const 32
    handle.add
    global.set 0
    local.get 1)
  (func $__original_main (type 9) (result i32)
    call $main)
  (func $__wasi_fd_close (type 3) (param i32) (result i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_fd_close
    i32.const 65535
    i32.and)
  (func $__wasi_fd_fdstat_get (type 4) (param i32 handle) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_fd_fdstat_get
    i32.const 65535
    i32.and)
  (func $__wasi_fd_seek (type 5) (param i32 i64 i32 handle) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__imported_wasi_snapshot_preview1_fd_seek
    i32.const 65535
    i32.and)
  (func $__wasi_fd_write (type 6) (param i32 handle i32 handle) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__imported_wasi_snapshot_preview1_fd_write
    i32.const 65535
    i32.and)
  (func $__wasi_proc_exit (type 7) (param i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_proc_exit
    unreachable)
  (func $dummy (type 8))
  (func $__wasm_call_dtors (type 8)
    call $dummy
    call $__stdio_exit)
  (func $printf (type 10) (param handle handle) (result i32)
    (local handle i32)
    global.get 0
    i32.const -16
    handle.add
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    handle.store offset=8
    global.get 1
    i32.const 3464
    handle.add
    local.get 0
    local.get 1
    call $vfprintf
    local.set 3
    local.get 2
    i32.const 16
    handle.add
    global.set 0
    local.get 3)
  (func $close (type 3) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      call $__wasi_fd_close
      local.tee 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    global.get 1
    i32.const 3840
    handle.add
    local.get 0
    i32.store
    i32.const -1)
  (func $__stdio_close (type 11) (param handle) (result i32)
    local.get 0
    i32.const 112
    handle.add
    i32.load
    call $close)
  (func $writev (type 12) (param i32 handle i32) (result i32)
    (local handle i32)
    global.get 0
    i32.const -16
    handle.add
    local.tee 3
    global.set 0
    i32.const -1
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        global.get 1
        i32.const 3840
        handle.add
        i32.const 28
        i32.store
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        local.get 3
        i32.const 12
        handle.add
        call $__wasi_fd_write
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        global.get 1
        i32.const 3840
        handle.add
        local.get 2
        i32.store
        i32.const -1
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.load offset=12
      local.set 4
    end
    local.get 3
    i32.const 16
    handle.add
    global.set 0
    local.get 4)
  (func $__stdio_write (type 0) (param handle handle i32) (result i32)
    (local handle handle handle i32 i32 i32 handle i32 i32 handle)
    global.get 0
    i32.const -32
    handle.add
    local.tee 3
    global.set 0
    local.get 3
    i32.const 16
    handle.add
    local.get 1
    handle.store
    local.get 3
    i32.const 24
    handle.add
    local.get 2
    i32.store
    local.get 3
    i32.const 8
    handle.add
    local.get 0
    i32.const 40
    handle.add
    local.tee 4
    handle.load
    handle.get_offset
    local.get 0
    i32.const 48
    handle.add
    local.tee 5
    handle.load
    local.tee 1
    handle.get_offset
    i32.sub
    local.tee 6
    i32.store
    local.get 3
    local.get 1
    handle.store
    i32.const 2
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        local.get 2
        i32.add
        local.tee 8
        local.get 0
        i32.const 112
        handle.add
        local.tee 9
        i32.load
        local.get 3
        i32.const 2
        call $writev
        local.tee 6
        i32.eq
        br_if 0 (;@2;)
        local.get 3
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            local.get 0
            i32.const 48
            handle.add
            i64.const 0
            i64.store
            local.get 0
            i32.const 40
            handle.add
            i64.const 0
            i64.store
            local.get 0
            i32.const 32
            handle.add
            i64.const 0
            i64.store
            local.get 0
            local.get 0
            i32.load
            i32.const 32
            i32.or
            i32.store
            i32.const 0
            local.set 6
            local.get 7
            i32.const 2
            i32.eq
            br_if 3 (;@1;)
            local.get 2
            local.get 1
            i32.const 8
            handle.add
            i32.load
            i32.sub
            local.set 6
            br 3 (;@1;)
          end
          local.get 1
          local.get 6
          local.get 1
          i32.const 8
          handle.add
          i32.load
          local.tee 10
          i32.gt_u
          local.tee 11
          i32.const 4
          i32.shl
          handle.add
          local.tee 12
          local.get 12
          handle.load
          local.get 6
          local.get 10
          i32.const 0
          local.get 11
          select
          i32.sub
          local.tee 10
          handle.add
          handle.store
          local.get 1
          i32.const 24
          i32.const 8
          local.get 11
          select
          handle.add
          local.tee 12
          local.get 12
          i32.load
          local.get 10
          i32.sub
          i32.store
          local.get 8
          local.get 6
          i32.sub
          local.tee 8
          local.get 9
          i32.load
          local.get 1
          i32.const 16
          handle.add
          local.get 1
          local.get 11
          select
          local.tee 1
          local.get 7
          local.get 11
          i32.sub
          local.tee 7
          call $writev
          local.tee 6
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 5
      local.get 0
      i32.const 80
      handle.add
      handle.load
      local.tee 1
      handle.store
      local.get 4
      local.get 1
      handle.store
      local.get 0
      i32.const 32
      handle.add
      local.get 1
      local.get 0
      i32.const 88
      handle.add
      i32.load
      handle.add
      handle.store
      local.get 2
      local.set 6
    end
    local.get 3
    i32.const 32
    handle.add
    global.set 0
    local.get 6)
  (func $__isatty (type 3) (param i32) (result i32)
    (local handle)
    global.get 0
    i32.const -32
    handle.add
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        i32.const 8
        handle.add
        call $__wasi_fd_fdstat_get
        local.tee 0
        br_if 0 (;@2;)
        i32.const 59
        local.set 0
        local.get 1
        i32.load8_u offset=8
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.const 16
        handle.add
        i32.load8_u
        i32.const 36
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 0
        br 1 (;@1;)
      end
      global.get 1
      i32.const 3840
      handle.add
      local.get 0
      i32.store
      i32.const 0
      local.set 0
    end
    local.get 1
    i32.const 32
    handle.add
    global.set 0
    local.get 0)
  (func $__stdout_write (type 0) (param handle handle i32) (result i32)
    local.get 0
    i32.const 64
    handle.add
    i32.const 1
    i32.store
    block  ;; label = @1
      local.get 0
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const 112
      handle.add
      i32.load
      call $__isatty
      br_if 0 (;@1;)
      local.get 0
      i32.const 120
      handle.add
      i32.const -1
      i32.store
    end
    local.get 0
    local.get 1
    local.get 2
    call $__stdio_write)
  (func $__lseek (type 13) (param i32 i64 i32) (result i64)
    (local handle)
    global.get 0
    i32.const -16
    handle.add
    local.tee 3
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        i32.const 255
        i32.and
        local.get 3
        i32.const 8
        handle.add
        call $__wasi_fd_seek
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        global.get 1
        i32.const 3840
        handle.add
        i32.const 70
        local.get 0
        local.get 0
        i32.const 76
        i32.eq
        select
        i32.store
        i64.const -1
        local.set 1
        br 1 (;@1;)
      end
      local.get 3
      i64.load offset=8
      local.set 1
    end
    local.get 3
    i32.const 16
    handle.add
    global.set 0
    local.get 1)
  (func $__stdio_seek (type 1) (param handle i64 i32) (result i64)
    local.get 0
    i32.const 112
    handle.add
    i32.load
    local.get 1
    local.get 2
    call $__lseek)
  (func $__stdio_exit (type 8)
    (local handle i32 handle handle)
    block  ;; label = @1
      global.get 1
      i32.const 3464
      handle.add
      local.tee 0
      i32.const 40
      handle.add
      handle.load
      local.get 0
      i32.const 48
      handle.add
      handle.load
      handle.eq
      br_if 0 (;@1;)
      global.get 1
      i32.const 3464
      handle.add
      local.tee 0
      i32.const 64
      handle.add
      i32.load
      local.set 1
      local.get 0
      handle.null
      i32.const 0
      local.get 1
      call_indirect (type 0)
      drop
    end
    block  ;; label = @1
      global.get 1
      i32.const 3464
      handle.add
      local.tee 0
      i32.const 8
      handle.add
      handle.load
      local.tee 2
      local.get 0
      i32.const 16
      handle.add
      handle.load
      local.tee 0
      handle.eq
      br_if 0 (;@1;)
      global.get 1
      i32.const 3464
      handle.add
      local.tee 3
      local.get 2
      handle.get_offset
      local.get 0
      handle.get_offset
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 3
      i32.const 72
      handle.add
      i32.load
      call_indirect (type 1)
      drop
    end)
  (func $__towrite (type 11) (param handle) (result i32)
    (local handle i32)
    local.get 0
    i32.const 116
    handle.add
    local.tee 1
    local.get 1
    i32.load
    local.tee 2
    i32.const -1
    i32.add
    local.get 2
    i32.or
    i32.store
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 2
      i32.const 8
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 32
      i32.or
      i32.store
      i32.const -1
      return
    end
    local.get 0
    i32.const 16
    handle.add
    i64.const 0
    i64.store
    local.get 0
    i32.const 8
    handle.add
    i64.const 0
    i64.store
    local.get 0
    i32.const 48
    handle.add
    local.get 0
    i32.const 80
    handle.add
    handle.load
    local.tee 1
    handle.store
    local.get 0
    i32.const 40
    handle.add
    local.get 1
    handle.store
    local.get 0
    i32.const 32
    handle.add
    local.get 1
    local.get 0
    i32.const 88
    handle.add
    i32.load
    handle.add
    handle.store
    i32.const 0)
  (func $__fwritex (type 14) (param handle i32 handle) (result i32)
    (local handle i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 32
        handle.add
        local.tee 3
        handle.load
        handle.null
        handle.eq
        i32.const 1
        i32.xor
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        local.get 2
        call $__towrite
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 3
        handle.load
        handle.get_offset
        local.get 2
        i32.const 40
        handle.add
        handle.load
        handle.get_offset
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        local.get 1
        local.get 2
        i32.const 64
        handle.add
        i32.load
        call_indirect (type 0)
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 120
          handle.add
          i32.load
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          i32.const 0
          local.set 5
          br 1 (;@2;)
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 4
        loop  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.const 1
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 5
            br 2 (;@2;)
          end
          local.get 4
          i32.const -2
          i32.add
          local.set 6
          local.get 4
          i32.const -1
          i32.add
          local.tee 5
          local.set 4
          local.get 0
          local.get 6
          handle.add
          i32.load8_u
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        local.get 5
        local.get 2
        i32.const 64
        handle.add
        i32.load
        call_indirect (type 0)
        local.tee 4
        local.get 5
        i32.lt_u
        local.tee 6
        br_if 1 (;@1;)
        local.get 0
        local.get 5
        handle.add
        local.set 0
        local.get 1
        i32.const 0
        local.get 5
        local.get 6
        select
        i32.sub
        local.set 1
      end
      local.get 2
      i32.const 40
      handle.add
      local.tee 2
      handle.load
      local.get 0
      local.get 1
      call $memcpy
      drop
      local.get 2
      local.get 2
      handle.load
      local.get 1
      handle.add
      handle.store
      local.get 5
      local.get 1
      i32.add
      local.set 4
    end
    local.get 4)
  (func $fwrite (type 15) (param handle i32 i32 handle) (result i32)
    (local i32 handle i32 i32 i32)
    local.get 2
    local.get 1
    i32.mul
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const 32
        handle.add
        local.tee 5
        handle.load
        handle.null
        handle.eq
        i32.const 1
        i32.xor
        br_if 0 (;@2;)
        i32.const 0
        local.set 6
        local.get 3
        call $__towrite
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 5
        handle.load
        handle.get_offset
        local.get 3
        i32.const 40
        handle.add
        handle.load
        handle.get_offset
        i32.sub
        local.get 4
        i32.ge_u
        br_if 0 (;@2;)
        local.get 3
        local.get 0
        local.get 4
        local.get 3
        i32.const 64
        handle.add
        i32.load
        call_indirect (type 0)
        local.set 6
        br 1 (;@1;)
      end
      i32.const 0
      local.set 7
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 120
          handle.add
          i32.load
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          local.get 4
          local.set 6
          br 1 (;@2;)
        end
        local.get 4
        i32.const 1
        i32.add
        local.set 6
        loop  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.const 1
            i32.ne
            br_if 0 (;@4;)
            local.get 4
            local.set 6
            i32.const 0
            local.set 7
            br 2 (;@2;)
          end
          local.get 6
          i32.const -2
          i32.add
          local.set 8
          local.get 6
          i32.const -1
          i32.add
          local.tee 7
          local.set 6
          local.get 0
          local.get 8
          handle.add
          i32.load8_u
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 3
        local.get 0
        local.get 7
        local.get 3
        i32.const 64
        handle.add
        i32.load
        call_indirect (type 0)
        local.tee 6
        local.get 7
        i32.lt_u
        local.tee 8
        br_if 1 (;@1;)
        local.get 0
        local.get 7
        handle.add
        local.set 0
        local.get 4
        i32.const 0
        local.get 7
        local.get 8
        select
        i32.sub
        local.set 6
      end
      local.get 3
      i32.const 40
      handle.add
      local.tee 3
      handle.load
      local.get 0
      local.get 6
      call $memcpy
      drop
      local.get 3
      local.get 3
      handle.load
      local.get 6
      handle.add
      handle.store
      local.get 7
      local.get 6
      i32.add
      local.set 6
    end
    block  ;; label = @1
      local.get 6
      local.get 4
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      local.get 1
      select
      return
    end
    local.get 6
    local.get 1
    i32.div_u)
  (func $strerror (type 16) (param i32) (result handle)
    (local handle handle)
    block  ;; label = @1
      block  ;; label = @2
        global.get 1
        i32.const 4888
        handle.add
        i32.const 48
        handle.add
        handle.load
        handle.null
        handle.eq
        br_if 0 (;@2;)
        global.get 1
        i32.const 4888
        handle.add
        i32.const 48
        handle.add
        handle.load
        local.set 1
        br 1 (;@1;)
      end
      global.get 1
      i32.const 4888
      handle.add
      local.tee 1
      i32.const 48
      handle.add
      local.get 1
      handle.store
    end
    global.get 1
    local.tee 2
    i32.const 1062
    handle.add
    local.get 2
    i32.const 2624
    handle.add
    i32.const 0
    local.get 0
    local.get 0
    i32.const 76
    i32.gt_u
    select
    i32.const 1
    i32.shl
    handle.add
    i32.load16_u
    handle.add
    local.get 1
    i32.const 40
    handle.add
    handle.load
    call $__lctrans)
  (func $fputs (type 10) (param handle handle) (result i32)
    (local i32)
    local.get 0
    call $strlen
    local.set 2
    i32.const -1
    i32.const 0
    local.get 2
    local.get 0
    i32.const 1
    local.get 2
    local.get 1
    call $fwrite
    i32.ne
    select)
  (func $abort (type 8)
    unreachable
    unreachable)
  (func $vfprintf (type 17) (param handle handle handle) (result i32)
    (local handle i32 i32 handle handle i32)
    global.get 0
    i32.const -224
    handle.add
    local.tee 3
    global.set 0
    local.get 3
    local.get 2
    handle.store offset=216
    local.get 3
    i32.const 160
    handle.add
    i32.const 32
    handle.add
    i64.const 0
    i64.store
    local.get 3
    i32.const 184
    handle.add
    i64.const 0
    i64.store
    local.get 3
    i32.const 176
    handle.add
    i64.const 0
    i64.store
    local.get 3
    i32.const 168
    handle.add
    i64.const 0
    i64.store
    local.get 3
    i64.const 0
    i64.store offset=160
    local.get 3
    local.get 2
    handle.store offset=208
    block  ;; label = @1
      block  ;; label = @2
        handle.null
        local.get 1
        local.get 3
        i32.const 208
        handle.add
        local.get 3
        i32.const 80
        handle.add
        local.get 3
        i32.const 160
        handle.add
        call $printf_core
        i32.const 0
        i32.ge_s
        br_if 0 (;@2;)
        i32.const -1
        local.set 4
        br 1 (;@1;)
      end
      local.get 0
      i32.load
      local.set 5
      block  ;; label = @2
        local.get 0
        i32.const 116
        handle.add
        i32.load
        i32.const 0
        i32.gt_s
        br_if 0 (;@2;)
        local.get 0
        local.get 5
        i32.const -33
        i32.and
        i32.store
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 88
              handle.add
              local.tee 2
              i32.load
              br_if 0 (;@5;)
              local.get 2
              i32.const 80
              i32.store
              local.get 0
              i32.const 32
              handle.add
              local.tee 2
              i64.const 0
              i64.store
              local.get 0
              i32.const 40
              handle.add
              i64.const 0
              i64.store
              local.get 0
              i32.const 48
              handle.add
              i64.const 0
              i64.store
              local.get 0
              i32.const 80
              handle.add
              local.tee 6
              handle.load
              local.set 7
              local.get 6
              local.get 3
              handle.store
              br 1 (;@4;)
            end
            local.get 0
            i32.const 32
            handle.add
            local.tee 2
            handle.load
            handle.null
            local.tee 7
            handle.eq
            i32.const 1
            i32.xor
            br_if 1 (;@3;)
          end
          i32.const -1
          local.set 4
          local.get 0
          call $__towrite
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 1
        local.get 3
        i32.const 208
        handle.add
        local.get 3
        i32.const 80
        handle.add
        local.get 3
        i32.const 160
        handle.add
        call $printf_core
        local.set 4
      end
      local.get 5
      i32.const 32
      i32.and
      local.set 5
      block  ;; label = @2
        local.get 7
        handle.null
        handle.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 64
        handle.add
        i32.load
        local.set 8
        local.get 0
        handle.null
        local.tee 1
        i32.const 0
        local.get 8
        call_indirect (type 0)
        drop
        local.get 0
        i32.const 80
        handle.add
        local.get 7
        handle.store
        local.get 0
        i32.const 88
        handle.add
        i32.const 0
        i32.store
        local.get 0
        i32.const 40
        handle.add
        handle.load
        local.set 7
        local.get 2
        i32.const 16
        handle.add
        i64.const 0
        i64.store
        local.get 2
        i32.const 8
        handle.add
        i64.const 0
        i64.store
        local.get 2
        i64.const 0
        i64.store
        i32.const -1
        local.get 4
        local.get 7
        local.get 1
        handle.eq
        select
        local.set 4
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 8
      local.get 5
      i32.or
      i32.store
      i32.const -1
      local.get 4
      local.get 8
      i32.const 32
      i32.and
      select
      local.set 4
    end
    local.get 3
    i32.const 224
    handle.add
    global.set 0
    local.get 4)
  (func $printf_core (type 18) (param handle handle handle handle handle) (result i32)
    (local handle i32 i32 handle handle handle handle handle i32 handle i32 handle i32 i32 i32 i32 handle handle i32 i32 i32 i32 handle i32 i32 i32 i32 i32 i32 i64 i64 f64 handle i32 i32 i32 handle handle i32 f64 handle)
    global.get 0
    i32.const -880
    handle.add
    local.tee 5
    global.set 0
    i32.const -2
    local.get 5
    i32.const 336
    handle.add
    handle.get_offset
    local.tee 6
    i32.sub
    local.set 7
    local.get 5
    i32.const 16
    handle.add
    i32.const 39
    handle.add
    local.set 8
    local.get 5
    i32.const 660
    handle.add
    local.set 9
    local.get 5
    i32.const 368
    handle.add
    i32.const 4
    handle.add
    local.set 10
    local.get 5
    i32.const 656
    handle.add
    local.set 11
    local.get 5
    i32.const 56
    handle.add
    local.tee 12
    handle.get_offset
    local.set 13
    local.get 5
    i32.const 336
    handle.add
    i32.const 9
    handle.add
    local.tee 14
    handle.get_offset
    local.set 15
    local.get 5
    i32.const 324
    handle.add
    i32.const 12
    handle.add
    local.tee 16
    handle.get_offset
    local.set 17
    i32.const 0
    local.set 18
    i32.const 0
    local.set 19
    i32.const 0
    local.set 20
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 0
                                  handle.null
                                  handle.eq
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  loop  ;; label = @16
                                    local.get 1
                                    local.set 21
                                    local.get 20
                                    i32.const 2147483647
                                    local.get 19
                                    i32.sub
                                    i32.gt_s
                                    br_if 13 (;@3;)
                                    local.get 20
                                    local.get 19
                                    i32.add
                                    local.set 19
                                    local.get 21
                                    i32.load8_u
                                    local.tee 20
                                    i32.eqz
                                    br_if 2 (;@14;)
                                    local.get 21
                                    local.set 22
                                    loop  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            local.get 20
                                            i32.const 255
                                            i32.and
                                            local.tee 20
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            local.get 20
                                            i32.const 37
                                            i32.ne
                                            br_if 2 (;@18;)
                                            local.get 22
                                            local.set 1
                                            loop  ;; label = @21
                                              local.get 1
                                              i32.const 1
                                              handle.add
                                              i32.load8_u
                                              i32.const 37
                                              i32.ne
                                              br_if 2 (;@19;)
                                              local.get 22
                                              i32.const 1
                                              handle.add
                                              local.set 22
                                              local.get 1
                                              i32.const 2
                                              handle.add
                                              local.tee 1
                                              i32.load8_u
                                              i32.const 37
                                              i32.eq
                                              br_if 0 (;@21;)
                                              br 2 (;@19;)
                                            end
                                          end
                                          local.get 22
                                          local.set 1
                                        end
                                        local.get 22
                                        handle.get_offset
                                        local.get 21
                                        handle.get_offset
                                        i32.sub
                                        local.tee 20
                                        i32.const 2147483647
                                        local.get 19
                                        i32.sub
                                        local.tee 23
                                        i32.gt_s
                                        br_if 15 (;@3;)
                                        local.get 20
                                        br_if 2 (;@16;)
                                        br 5 (;@13;)
                                      end
                                      local.get 22
                                      i32.const 1
                                      handle.add
                                      local.tee 22
                                      i32.load8_u
                                      local.set 20
                                      br 0 (;@17;)
                                    end
                                  end
                                end
                                loop  ;; label = @15
                                  local.get 1
                                  local.set 21
                                  local.get 20
                                  i32.const 2147483647
                                  local.get 19
                                  i32.sub
                                  i32.gt_s
                                  br_if 12 (;@3;)
                                  local.get 20
                                  local.get 19
                                  i32.add
                                  local.set 19
                                  local.get 21
                                  i32.load8_u
                                  local.tee 20
                                  i32.eqz
                                  br_if 1 (;@14;)
                                  local.get 21
                                  local.set 1
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          local.get 20
                                          i32.const 255
                                          i32.and
                                          local.tee 20
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          local.get 20
                                          i32.const 37
                                          i32.ne
                                          br_if 2 (;@17;)
                                          local.get 1
                                          local.set 22
                                          loop  ;; label = @20
                                            local.get 1
                                            i32.const 1
                                            handle.add
                                            i32.load8_u
                                            i32.const 37
                                            i32.ne
                                            br_if 2 (;@18;)
                                            local.get 22
                                            i32.const 1
                                            handle.add
                                            local.set 22
                                            local.get 1
                                            i32.const 2
                                            handle.add
                                            local.tee 1
                                            i32.load8_u
                                            i32.const 37
                                            i32.eq
                                            br_if 0 (;@20;)
                                            br 2 (;@18;)
                                          end
                                        end
                                        local.get 1
                                        local.set 22
                                      end
                                      local.get 22
                                      handle.get_offset
                                      local.get 21
                                      handle.get_offset
                                      i32.sub
                                      local.tee 20
                                      i32.const 2147483647
                                      local.get 19
                                      i32.sub
                                      local.tee 23
                                      i32.gt_s
                                      br_if 14 (;@3;)
                                      block  ;; label = @18
                                        local.get 0
                                        i32.load8_u
                                        i32.const 32
                                        i32.and
                                        br_if 0 (;@18;)
                                        local.get 21
                                        local.get 20
                                        local.get 0
                                        call $__fwritex
                                        drop
                                      end
                                      local.get 20
                                      br_if 2 (;@15;)
                                      br 4 (;@13;)
                                    end
                                    local.get 1
                                    i32.const 1
                                    handle.add
                                    local.tee 1
                                    i32.load8_u
                                    local.set 20
                                    br 0 (;@16;)
                                  end
                                end
                              end
                              local.get 0
                              handle.null
                              handle.eq
                              i32.const 1
                              i32.xor
                              br_if 12 (;@1;)
                              block  ;; label = @14
                                local.get 18
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 19
                                br 13 (;@1;)
                              end
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 4
                                  i32.const 4
                                  handle.add
                                  i32.load
                                  local.tee 20
                                  br_if 0 (;@15;)
                                  i32.const 1
                                  local.set 20
                                  br 1 (;@14;)
                                end
                                local.get 3
                                i32.const 8
                                handle.add
                                local.get 20
                                local.get 2
                                call $pop_arg
                                block  ;; label = @15
                                  local.get 4
                                  i32.const 8
                                  handle.add
                                  i32.load
                                  local.tee 20
                                  br_if 0 (;@15;)
                                  i32.const 2
                                  local.set 20
                                  br 1 (;@14;)
                                end
                                local.get 3
                                i32.const 16
                                handle.add
                                local.get 20
                                local.get 2
                                call $pop_arg
                                block  ;; label = @15
                                  local.get 4
                                  i32.const 12
                                  handle.add
                                  i32.load
                                  local.tee 20
                                  br_if 0 (;@15;)
                                  i32.const 3
                                  local.set 20
                                  br 1 (;@14;)
                                end
                                local.get 3
                                i32.const 24
                                handle.add
                                local.get 20
                                local.get 2
                                call $pop_arg
                                block  ;; label = @15
                                  local.get 4
                                  i32.const 16
                                  handle.add
                                  i32.load
                                  local.tee 20
                                  br_if 0 (;@15;)
                                  i32.const 4
                                  local.set 20
                                  br 1 (;@14;)
                                end
                                local.get 3
                                i32.const 32
                                handle.add
                                local.get 20
                                local.get 2
                                call $pop_arg
                                block  ;; label = @15
                                  local.get 4
                                  i32.const 20
                                  handle.add
                                  i32.load
                                  local.tee 20
                                  br_if 0 (;@15;)
                                  i32.const 5
                                  local.set 20
                                  br 1 (;@14;)
                                end
                                local.get 3
                                i32.const 40
                                handle.add
                                local.get 20
                                local.get 2
                                call $pop_arg
                                block  ;; label = @15
                                  local.get 4
                                  i32.const 24
                                  handle.add
                                  i32.load
                                  local.tee 20
                                  br_if 0 (;@15;)
                                  i32.const 6
                                  local.set 20
                                  br 1 (;@14;)
                                end
                                local.get 3
                                i32.const 48
                                handle.add
                                local.get 20
                                local.get 2
                                call $pop_arg
                                block  ;; label = @15
                                  local.get 4
                                  i32.const 28
                                  handle.add
                                  i32.load
                                  local.tee 20
                                  br_if 0 (;@15;)
                                  i32.const 7
                                  local.set 20
                                  br 1 (;@14;)
                                end
                                local.get 3
                                i32.const 56
                                handle.add
                                local.get 20
                                local.get 2
                                call $pop_arg
                                block  ;; label = @15
                                  local.get 4
                                  i32.const 32
                                  handle.add
                                  i32.load
                                  local.tee 20
                                  br_if 0 (;@15;)
                                  i32.const 8
                                  local.set 20
                                  br 1 (;@14;)
                                end
                                local.get 3
                                i32.const 64
                                handle.add
                                local.get 20
                                local.get 2
                                call $pop_arg
                                block  ;; label = @15
                                  local.get 4
                                  i32.const 36
                                  handle.add
                                  i32.load
                                  local.tee 20
                                  br_if 0 (;@15;)
                                  i32.const 9
                                  local.set 20
                                  br 1 (;@14;)
                                end
                                local.get 3
                                i32.const 72
                                handle.add
                                local.get 20
                                local.get 2
                                call $pop_arg
                                i32.const 1
                                local.set 19
                                br 13 (;@1;)
                              end
                              loop  ;; label = @14
                                local.get 4
                                local.get 20
                                i32.const 2
                                i32.shl
                                handle.add
                                i32.load
                                br_if 2 (;@12;)
                                i32.const 1
                                local.set 19
                                local.get 20
                                i32.const 1
                                i32.add
                                local.tee 20
                                i32.const 10
                                i32.eq
                                br_if 13 (;@1;)
                                br 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 1
                                i32.const 1
                                handle.add
                                local.tee 22
                                i32.load8_s
                                local.tee 24
                                i32.const -48
                                i32.add
                                local.tee 25
                                i32.const 9
                                i32.le_u
                                br_if 0 (;@14;)
                                i32.const -1
                                local.set 26
                                br 1 (;@13;)
                              end
                              local.get 1
                              i32.const 3
                              handle.add
                              local.get 22
                              local.get 1
                              i32.const 2
                              handle.add
                              i32.load8_u
                              i32.const 36
                              i32.eq
                              local.tee 20
                              select
                              local.set 22
                              local.get 25
                              i32.const -1
                              local.get 20
                              select
                              local.set 26
                              i32.const 1
                              local.get 18
                              local.get 20
                              select
                              local.set 18
                              local.get 1
                              i32.const 3
                              i32.const 1
                              local.get 20
                              select
                              handle.add
                              i32.load8_s
                              local.set 24
                            end
                            i32.const 0
                            local.set 25
                            block  ;; label = @13
                              local.get 24
                              i32.const -32
                              i32.add
                              local.tee 20
                              i32.const 31
                              i32.gt_u
                              br_if 0 (;@13;)
                              i32.const 1
                              local.get 20
                              i32.shl
                              local.tee 20
                              i32.const 75913
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 25
                              loop  ;; label = @14
                                local.get 20
                                local.get 25
                                i32.or
                                local.set 25
                                local.get 22
                                i32.const 1
                                handle.add
                                local.tee 22
                                i32.load8_s
                                local.tee 24
                                i32.const -32
                                i32.add
                                local.tee 20
                                i32.const 31
                                i32.gt_u
                                br_if 1 (;@13;)
                                i32.const 1
                                local.get 20
                                i32.shl
                                local.tee 20
                                i32.const 75913
                                i32.and
                                br_if 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 24
                                i32.const 42
                                i32.ne
                                br_if 0 (;@14;)
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 22
                                    i32.const 1
                                    handle.add
                                    local.tee 27
                                    i32.load8_s
                                    i32.const -48
                                    i32.add
                                    local.tee 20
                                    i32.const 9
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                    local.get 22
                                    i32.const 2
                                    handle.add
                                    i32.load8_u
                                    i32.const 36
                                    i32.ne
                                    br_if 0 (;@16;)
                                    local.get 4
                                    local.get 20
                                    i32.const 2
                                    i32.shl
                                    handle.add
                                    i32.const 10
                                    i32.store
                                    local.get 22
                                    i32.const 3
                                    handle.add
                                    local.set 27
                                    i32.const 1
                                    local.set 18
                                    local.get 3
                                    local.get 22
                                    i32.const 1
                                    handle.add
                                    i32.load8_s
                                    i32.const 3
                                    i32.shl
                                    i32.const -384
                                    i32.add
                                    handle.add
                                    i64.load
                                    i32.wrap_i64
                                    local.set 28
                                    br 1 (;@15;)
                                  end
                                  local.get 18
                                  br_if 3 (;@12;)
                                  block  ;; label = @16
                                    local.get 0
                                    handle.null
                                    handle.eq
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 18
                                    i32.const 0
                                    local.set 28
                                    br 3 (;@13;)
                                  end
                                  local.get 2
                                  local.get 2
                                  handle.load
                                  local.tee 1
                                  i32.const 4
                                  handle.add
                                  handle.store
                                  local.get 1
                                  i32.load
                                  local.set 28
                                  i32.const 0
                                  local.set 18
                                end
                                local.get 28
                                i32.const -1
                                i32.gt_s
                                br_if 1 (;@13;)
                                i32.const 0
                                local.get 28
                                i32.sub
                                local.set 28
                                local.get 25
                                i32.const 8192
                                i32.or
                                local.set 25
                                br 1 (;@13;)
                              end
                              i32.const 0
                              local.set 28
                              block  ;; label = @14
                                local.get 24
                                i32.const -48
                                i32.add
                                local.tee 20
                                i32.const 9
                                i32.le_u
                                br_if 0 (;@14;)
                                local.get 22
                                local.set 27
                                br 1 (;@13;)
                              end
                              i32.const 0
                              local.set 28
                              local.get 22
                              local.set 27
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 28
                                  i32.const 214748364
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  i32.const -1
                                  local.get 28
                                  i32.const 10
                                  i32.mul
                                  local.tee 24
                                  local.get 20
                                  i32.add
                                  local.get 20
                                  i32.const 2147483647
                                  local.get 24
                                  i32.sub
                                  i32.gt_s
                                  select
                                  local.set 28
                                  local.get 27
                                  i32.const 1
                                  handle.add
                                  local.tee 27
                                  i32.load8_s
                                  i32.const -48
                                  i32.add
                                  local.tee 20
                                  i32.const 10
                                  i32.lt_u
                                  br_if 1 (;@14;)
                                  local.get 28
                                  i32.const 0
                                  i32.lt_s
                                  br_if 12 (;@3;)
                                  br 2 (;@13;)
                                end
                                i32.const -1
                                local.set 28
                                local.get 27
                                i32.const 1
                                handle.add
                                local.tee 27
                                i32.load8_s
                                i32.const -48
                                i32.add
                                local.tee 20
                                i32.const 10
                                i32.lt_u
                                br_if 0 (;@14;)
                                br 11 (;@3;)
                              end
                            end
                            i32.const 0
                            local.set 20
                            i32.const -1
                            local.set 29
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 27
                                i32.load8_u
                                i32.const 46
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 27
                                local.set 1
                                i32.const 0
                                local.set 30
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 27
                                i32.const 1
                                handle.add
                                local.tee 1
                                i32.load8_s
                                local.tee 24
                                i32.const 42
                                i32.ne
                                br_if 0 (;@14;)
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 27
                                    i32.const 2
                                    handle.add
                                    local.tee 1
                                    i32.load8_s
                                    i32.const -48
                                    i32.add
                                    local.tee 24
                                    i32.const 9
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                    local.get 27
                                    i32.const 3
                                    handle.add
                                    i32.load8_u
                                    i32.const 36
                                    i32.ne
                                    br_if 0 (;@16;)
                                    local.get 4
                                    local.get 24
                                    i32.const 2
                                    i32.shl
                                    handle.add
                                    i32.const 10
                                    i32.store
                                    local.get 27
                                    i32.const 4
                                    handle.add
                                    local.set 1
                                    local.get 3
                                    local.get 27
                                    i32.const 2
                                    handle.add
                                    i32.load8_s
                                    i32.const 3
                                    i32.shl
                                    i32.const -384
                                    i32.add
                                    handle.add
                                    i64.load
                                    i32.wrap_i64
                                    local.set 29
                                    br 1 (;@15;)
                                  end
                                  local.get 18
                                  br_if 3 (;@12;)
                                  block  ;; label = @16
                                    local.get 0
                                    handle.null
                                    handle.eq
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 29
                                    br 1 (;@15;)
                                  end
                                  local.get 2
                                  local.get 2
                                  handle.load
                                  local.tee 22
                                  i32.const 4
                                  handle.add
                                  handle.store
                                  local.get 22
                                  i32.load
                                  local.set 29
                                end
                                local.get 29
                                i32.const -1
                                i32.xor
                                i32.const 31
                                i32.shr_u
                                local.set 30
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 24
                                i32.const -48
                                i32.add
                                local.tee 31
                                i32.const 9
                                i32.le_u
                                br_if 0 (;@14;)
                                i32.const 1
                                local.set 30
                                i32.const 0
                                local.set 29
                                br 1 (;@13;)
                              end
                              i32.const 0
                              local.set 24
                              loop  ;; label = @14
                                i32.const -1
                                local.set 29
                                block  ;; label = @15
                                  local.get 24
                                  i32.const 214748364
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  i32.const -1
                                  local.get 24
                                  i32.const 10
                                  i32.mul
                                  local.tee 24
                                  local.get 31
                                  i32.add
                                  local.get 31
                                  i32.const 2147483647
                                  local.get 24
                                  i32.sub
                                  i32.gt_s
                                  select
                                  local.set 29
                                end
                                i32.const 1
                                local.set 30
                                local.get 29
                                local.set 24
                                local.get 1
                                i32.const 1
                                handle.add
                                local.tee 1
                                i32.load8_s
                                i32.const -48
                                i32.add
                                local.tee 31
                                i32.const 10
                                i32.lt_u
                                br_if 0 (;@14;)
                              end
                            end
                            loop  ;; label = @13
                              local.get 20
                              local.set 24
                              local.get 1
                              local.tee 22
                              i32.load8_s
                              i32.const -65
                              i32.add
                              local.tee 20
                              i32.const 57
                              i32.gt_u
                              br_if 1 (;@12;)
                              local.get 22
                              i32.const 1
                              handle.add
                              local.set 1
                              global.get 1
                              i32.const 2800
                              handle.add
                              local.get 24
                              i32.const 58
                              i32.mul
                              local.get 20
                              i32.add
                              handle.add
                              i32.load8_u
                              local.tee 20
                              i32.const -1
                              i32.add
                              i32.const 8
                              i32.lt_u
                              br_if 0 (;@13;)
                            end
                            local.get 20
                            i32.eqz
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 20
                                    i32.const 27
                                    i32.ne
                                    br_if 0 (;@16;)
                                    local.get 26
                                    i32.const -1
                                    i32.le_s
                                    br_if 1 (;@15;)
                                    br 4 (;@12;)
                                  end
                                  local.get 26
                                  i32.const 0
                                  i32.lt_s
                                  br_if 1 (;@14;)
                                  local.get 4
                                  local.get 26
                                  i32.const 2
                                  i32.shl
                                  handle.add
                                  local.get 20
                                  i32.store
                                  local.get 5
                                  local.get 3
                                  local.get 26
                                  i32.const 3
                                  i32.shl
                                  handle.add
                                  i64.load
                                  i64.store offset=56
                                end
                                i32.const 0
                                local.set 20
                                local.get 0
                                handle.null
                                handle.eq
                                br_if 10 (;@4;)
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 0
                                handle.null
                                handle.eq
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 19
                                br 13 (;@1;)
                              end
                              local.get 5
                              i32.const 56
                              handle.add
                              local.get 20
                              local.get 2
                              call $pop_arg
                            end
                            local.get 22
                            i32.load8_s
                            local.set 20
                            local.get 25
                            i32.const -65537
                            i32.and
                            local.tee 32
                            local.get 25
                            local.get 25
                            i32.const 8192
                            i32.and
                            select
                            local.set 31
                            global.get 1
                            i32.const 2778
                            handle.add
                            local.set 27
                            i32.const 0
                            local.set 26
                            local.get 12
                            local.set 22
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              local.get 20
                                                              i32.const -33
                                                              i32.and
                                                              local.get 20
                                                              local.get 20
                                                              i32.const 15
                                                              i32.and
                                                              i32.const 3
                                                              i32.eq
                                                              select
                                                              local.get 20
                                                              local.get 24
                                                              select
                                                              local.tee 33
                                                              i32.const -65
                                                              i32.add
                                                              br_table 16 (;@13;) 24 (;@5;) 12 (;@17;) 24 (;@5;) 16 (;@13;) 16 (;@13;) 16 (;@13;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 13 (;@16;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 3 (;@26;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 16 (;@13;) 24 (;@5;) 8 (;@21;) 5 (;@24;) 16 (;@13;) 16 (;@13;) 16 (;@13;) 24 (;@5;) 5 (;@24;) 24 (;@5;) 24 (;@5;) 24 (;@5;) 9 (;@20;) 1 (;@28;) 4 (;@25;) 2 (;@27;) 24 (;@5;) 24 (;@5;) 10 (;@19;) 24 (;@5;) 0 (;@29;) 24 (;@5;) 24 (;@5;) 3 (;@26;) 24 (;@5;)
                                                            end
                                                            global.get 1
                                                            i32.const 2778
                                                            handle.add
                                                            local.set 27
                                                            i32.const 0
                                                            local.set 26
                                                            local.get 5
                                                            i64.load offset=56
                                                            local.set 34
                                                            br 5 (;@23;)
                                                          end
                                                          i32.const 0
                                                          local.set 20
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        local.get 24
                                                                        i32.const 255
                                                                        i32.and
                                                                        br_table 0 (;@34;) 1 (;@33;) 2 (;@32;) 3 (;@31;) 4 (;@30;) 30 (;@4;) 5 (;@29;) 6 (;@28;) 30 (;@4;)
                                                                      end
                                                                      local.get 5
                                                                      handle.load offset=56
                                                                      local.get 19
                                                                      i32.store
                                                                      br 29 (;@4;)
                                                                    end
                                                                    local.get 5
                                                                    handle.load offset=56
                                                                    local.get 19
                                                                    i32.store
                                                                    br 28 (;@4;)
                                                                  end
                                                                  local.get 5
                                                                  handle.load offset=56
                                                                  local.get 19
                                                                  i64.extend_i32_s
                                                                  i64.store
                                                                  br 27 (;@4;)
                                                                end
                                                                local.get 5
                                                                handle.load offset=56
                                                                local.get 19
                                                                i32.store16
                                                                br 26 (;@4;)
                                                              end
                                                              local.get 5
                                                              handle.load offset=56
                                                              local.get 19
                                                              i32.store8
                                                              br 25 (;@4;)
                                                            end
                                                            local.get 5
                                                            handle.load offset=56
                                                            local.get 19
                                                            i32.store
                                                            br 24 (;@4;)
                                                          end
                                                          local.get 5
                                                          handle.load offset=56
                                                          local.get 19
                                                          i64.extend_i32_s
                                                          i64.store
                                                          br 23 (;@4;)
                                                        end
                                                        local.get 29
                                                        i32.const 16
                                                        local.get 29
                                                        i32.const 16
                                                        i32.gt_u
                                                        select
                                                        local.set 29
                                                        local.get 31
                                                        i32.const 8
                                                        i32.or
                                                        local.set 31
                                                        i32.const 120
                                                        local.set 33
                                                      end
                                                      global.get 1
                                                      local.set 22
                                                      i32.const 0
                                                      local.set 26
                                                      block  ;; label = @26
                                                        local.get 5
                                                        i64.load offset=56
                                                        local.tee 34
                                                        i64.eqz
                                                        i32.eqz
                                                        br_if 0 (;@26;)
                                                        local.get 22
                                                        i32.const 2778
                                                        handle.add
                                                        local.set 27
                                                        local.get 12
                                                        local.set 21
                                                        br 4 (;@22;)
                                                      end
                                                      local.get 33
                                                      i32.const 32
                                                      i32.and
                                                      local.set 20
                                                      local.get 12
                                                      local.set 21
                                                      loop  ;; label = @26
                                                        local.get 21
                                                        i32.const -1
                                                        handle.add
                                                        local.tee 21
                                                        global.get 1
                                                        i32.const 3408
                                                        handle.add
                                                        local.get 34
                                                        i32.wrap_i64
                                                        i32.const 15
                                                        i32.and
                                                        handle.add
                                                        i32.load8_u
                                                        local.get 20
                                                        i32.or
                                                        i32.store8
                                                        local.get 34
                                                        i64.const 4
                                                        i64.shr_u
                                                        local.tee 34
                                                        i64.const 0
                                                        i64.ne
                                                        br_if 0 (;@26;)
                                                      end
                                                      global.get 1
                                                      i32.const 2778
                                                      handle.add
                                                      local.set 27
                                                      local.get 31
                                                      i32.const 8
                                                      i32.and
                                                      i32.eqz
                                                      br_if 3 (;@22;)
                                                      local.get 5
                                                      i64.load offset=56
                                                      i64.eqz
                                                      br_if 3 (;@22;)
                                                      global.get 1
                                                      i32.const 2778
                                                      handle.add
                                                      local.get 33
                                                      i32.const 4
                                                      i32.shr_s
                                                      handle.add
                                                      local.set 27
                                                      i32.const 2
                                                      local.set 26
                                                      br 3 (;@22;)
                                                    end
                                                    local.get 12
                                                    local.set 21
                                                    block  ;; label = @25
                                                      local.get 5
                                                      i64.load offset=56
                                                      local.tee 34
                                                      i64.eqz
                                                      br_if 0 (;@25;)
                                                      local.get 12
                                                      local.set 21
                                                      loop  ;; label = @26
                                                        local.get 21
                                                        i32.const -1
                                                        handle.add
                                                        local.tee 21
                                                        local.get 34
                                                        i32.wrap_i64
                                                        i32.const 7
                                                        i32.and
                                                        i32.const 48
                                                        i32.or
                                                        i32.store8
                                                        local.get 34
                                                        i64.const 3
                                                        i64.shr_u
                                                        local.tee 34
                                                        i64.const 0
                                                        i64.ne
                                                        br_if 0 (;@26;)
                                                      end
                                                    end
                                                    global.get 1
                                                    local.set 22
                                                    i32.const 0
                                                    local.set 26
                                                    block  ;; label = @25
                                                      local.get 31
                                                      i32.const 8
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      local.get 22
                                                      i32.const 2778
                                                      handle.add
                                                      local.set 27
                                                      br 3 (;@22;)
                                                    end
                                                    local.get 29
                                                    local.get 13
                                                    local.get 21
                                                    handle.get_offset
                                                    i32.sub
                                                    local.tee 20
                                                    i32.const 1
                                                    i32.add
                                                    local.get 29
                                                    local.get 20
                                                    i32.gt_s
                                                    select
                                                    local.set 29
                                                    global.get 1
                                                    i32.const 2778
                                                    handle.add
                                                    local.set 27
                                                    br 2 (;@22;)
                                                  end
                                                  block  ;; label = @24
                                                    local.get 5
                                                    i64.load offset=56
                                                    local.tee 34
                                                    i64.const -1
                                                    i64.gt_s
                                                    br_if 0 (;@24;)
                                                    local.get 5
                                                    i64.const 0
                                                    local.get 34
                                                    i64.sub
                                                    local.tee 34
                                                    i64.store offset=56
                                                    global.get 1
                                                    i32.const 2778
                                                    handle.add
                                                    local.set 27
                                                    i32.const 1
                                                    local.set 26
                                                    br 1 (;@23;)
                                                  end
                                                  global.get 1
                                                  local.set 22
                                                  block  ;; label = @24
                                                    local.get 31
                                                    i32.const 2048
                                                    i32.and
                                                    i32.eqz
                                                    br_if 0 (;@24;)
                                                    i32.const 1
                                                    local.set 26
                                                    local.get 22
                                                    i32.const 2778
                                                    handle.add
                                                    i32.const 1
                                                    handle.add
                                                    local.set 27
                                                    br 1 (;@23;)
                                                  end
                                                  global.get 1
                                                  i32.const 2778
                                                  handle.add
                                                  local.tee 22
                                                  i32.const 2
                                                  handle.add
                                                  local.get 22
                                                  local.get 31
                                                  i32.const 1
                                                  i32.and
                                                  local.tee 26
                                                  select
                                                  local.set 27
                                                end
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    local.get 34
                                                    i64.const 4294967296
                                                    i64.ge_u
                                                    br_if 0 (;@24;)
                                                    local.get 34
                                                    local.set 35
                                                    local.get 12
                                                    local.set 21
                                                    br 1 (;@23;)
                                                  end
                                                  local.get 12
                                                  local.set 21
                                                  loop  ;; label = @24
                                                    local.get 21
                                                    i32.const -1
                                                    handle.add
                                                    local.tee 21
                                                    local.get 34
                                                    local.get 34
                                                    i64.const 10
                                                    i64.div_u
                                                    local.tee 35
                                                    i64.const 10
                                                    i64.mul
                                                    i64.sub
                                                    i32.wrap_i64
                                                    i32.const 48
                                                    i32.or
                                                    i32.store8
                                                    local.get 34
                                                    i64.const 42949672959
                                                    i64.gt_u
                                                    local.set 20
                                                    local.get 35
                                                    local.set 34
                                                    local.get 20
                                                    br_if 0 (;@24;)
                                                  end
                                                end
                                                local.get 35
                                                i32.wrap_i64
                                                local.tee 20
                                                i32.eqz
                                                br_if 0 (;@22;)
                                                loop  ;; label = @23
                                                  local.get 21
                                                  i32.const -1
                                                  handle.add
                                                  local.tee 21
                                                  local.get 20
                                                  local.get 20
                                                  i32.const 10
                                                  i32.div_u
                                                  local.tee 25
                                                  i32.const 10
                                                  i32.mul
                                                  i32.sub
                                                  i32.const 48
                                                  i32.or
                                                  i32.store8
                                                  local.get 20
                                                  i32.const 9
                                                  i32.gt_u
                                                  local.set 24
                                                  local.get 25
                                                  local.set 20
                                                  local.get 24
                                                  br_if 0 (;@23;)
                                                end
                                              end
                                              block  ;; label = @22
                                                local.get 30
                                                i32.eqz
                                                br_if 0 (;@22;)
                                                local.get 29
                                                i32.const 0
                                                i32.lt_s
                                                br_if 19 (;@3;)
                                              end
                                              local.get 31
                                              i32.const -65537
                                              i32.and
                                              local.get 31
                                              local.get 30
                                              select
                                              local.set 31
                                              local.get 5
                                              i64.load offset=56
                                              local.set 34
                                              local.get 29
                                              br_if 10 (;@11;)
                                              local.get 34
                                              i64.eqz
                                              i32.eqz
                                              br_if 10 (;@11;)
                                              local.get 12
                                              local.set 21
                                              local.get 12
                                              local.set 22
                                              i32.const 0
                                              local.set 29
                                              br 16 (;@5;)
                                            end
                                            local.get 5
                                            i32.const 16
                                            handle.add
                                            i32.const 39
                                            handle.add
                                            local.get 5
                                            i64.load offset=56
                                            i64.store8
                                            global.get 1
                                            i32.const 2778
                                            handle.add
                                            local.set 27
                                            i32.const 1
                                            local.set 29
                                            local.get 8
                                            local.set 21
                                            local.get 12
                                            local.set 22
                                            local.get 32
                                            local.set 31
                                            br 15 (;@5;)
                                          end
                                          global.get 1
                                          i32.const 3840
                                          handle.add
                                          i32.load
                                          call $strerror
                                          local.set 21
                                          br 1 (;@18;)
                                        end
                                        handle.null
                                        local.set 21
                                        local.get 5
                                        handle.load offset=56
                                        local.set 22
                                        global.get 1
                                        i32.const 2788
                                        handle.add
                                        local.get 22
                                        local.get 22
                                        local.get 21
                                        handle.eq
                                        select
                                        local.set 21
                                      end
                                      global.get 1
                                      local.set 27
                                      i32.const 0
                                      local.set 26
                                      local.get 21
                                      local.get 21
                                      i32.const 2147483647
                                      local.get 29
                                      local.get 29
                                      i32.const 0
                                      i32.lt_s
                                      select
                                      call $strnlen
                                      local.tee 20
                                      handle.add
                                      local.set 22
                                      block  ;; label = @18
                                        local.get 29
                                        i32.const -1
                                        i32.le_s
                                        br_if 0 (;@18;)
                                        local.get 27
                                        i32.const 2778
                                        handle.add
                                        local.set 27
                                        br 12 (;@6;)
                                      end
                                      global.get 1
                                      local.set 27
                                      local.get 22
                                      i32.load8_u
                                      br_if 14 (;@3;)
                                      local.get 27
                                      i32.const 2778
                                      handle.add
                                      local.set 27
                                      br 11 (;@6;)
                                    end
                                    local.get 5
                                    i32.const 8
                                    handle.add
                                    i32.const 4
                                    handle.add
                                    i32.const 0
                                    i32.store
                                    local.get 5
                                    local.get 5
                                    i64.load offset=56
                                    i64.store32 offset=8
                                    local.get 5
                                    local.get 5
                                    i32.const 8
                                    handle.add
                                    handle.store offset=56
                                    i32.const -1
                                    local.set 29
                                    local.get 5
                                    i32.const 8
                                    handle.add
                                    local.set 22
                                    br 1 (;@15;)
                                  end
                                  block  ;; label = @16
                                    local.get 29
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 20
                                    br 2 (;@14;)
                                  end
                                  local.get 5
                                  handle.load offset=56
                                  local.set 22
                                end
                                i32.const 0
                                local.set 20
                                block  ;; label = @15
                                  loop  ;; label = @16
                                    local.get 22
                                    i32.load
                                    local.tee 25
                                    i32.eqz
                                    br_if 1 (;@15;)
                                    block  ;; label = @17
                                      local.get 5
                                      i32.const 4
                                      handle.add
                                      local.get 25
                                      call $wctomb
                                      local.tee 25
                                      i32.const 0
                                      i32.lt_s
                                      local.tee 23
                                      br_if 0 (;@17;)
                                      local.get 25
                                      local.get 29
                                      local.get 20
                                      i32.sub
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                      local.get 22
                                      i32.const 4
                                      handle.add
                                      local.set 22
                                      local.get 29
                                      local.get 25
                                      local.get 20
                                      i32.add
                                      local.tee 20
                                      i32.gt_u
                                      br_if 1 (;@16;)
                                      br 2 (;@15;)
                                    end
                                  end
                                  local.get 23
                                  br_if 13 (;@2;)
                                end
                                local.get 20
                                i32.const 0
                                i32.lt_s
                                br_if 11 (;@3;)
                              end
                              block  ;; label = @14
                                local.get 31
                                i32.const 73728
                                i32.and
                                local.tee 29
                                br_if 0 (;@14;)
                                local.get 28
                                local.get 20
                                i32.le_s
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 64
                                handle.add
                                i32.const 32
                                local.get 28
                                local.get 20
                                i32.sub
                                local.tee 25
                                i32.const 256
                                local.get 25
                                i32.const 256
                                i32.lt_u
                                local.tee 31
                                select
                                call $memset
                                drop
                                local.get 0
                                i32.load
                                local.tee 24
                                i32.const 32
                                i32.and
                                i32.eqz
                                local.set 23
                                block  ;; label = @15
                                  local.get 31
                                  br_if 0 (;@15;)
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 23
                                      i32.const 1
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 64
                                      handle.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                      local.get 0
                                      i32.load
                                      local.set 24
                                    end
                                    local.get 24
                                    i32.const 32
                                    i32.and
                                    i32.eqz
                                    local.set 23
                                    local.get 25
                                    i32.const -256
                                    i32.add
                                    local.tee 25
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 23
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 64
                                handle.add
                                local.get 25
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              block  ;; label = @14
                                local.get 20
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 25
                                local.get 5
                                handle.load offset=56
                                local.set 22
                                loop  ;; label = @15
                                  local.get 22
                                  i32.load
                                  local.tee 23
                                  i32.eqz
                                  br_if 1 (;@14;)
                                  local.get 5
                                  i32.const 4
                                  handle.add
                                  local.get 23
                                  call $wctomb
                                  local.tee 23
                                  local.get 25
                                  i32.add
                                  local.tee 25
                                  local.get 20
                                  i32.gt_u
                                  br_if 1 (;@14;)
                                  block  ;; label = @16
                                    local.get 0
                                    i32.load8_u
                                    i32.const 32
                                    i32.and
                                    br_if 0 (;@16;)
                                    local.get 5
                                    i32.const 4
                                    handle.add
                                    local.get 23
                                    local.get 0
                                    call $__fwritex
                                    drop
                                  end
                                  local.get 22
                                  i32.const 4
                                  handle.add
                                  local.set 22
                                  local.get 25
                                  local.get 20
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                end
                              end
                              block  ;; label = @14
                                local.get 29
                                i32.const 8192
                                i32.ne
                                br_if 0 (;@14;)
                                local.get 28
                                local.get 20
                                i32.le_s
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 64
                                handle.add
                                i32.const 32
                                local.get 28
                                local.get 20
                                i32.sub
                                local.tee 25
                                i32.const 256
                                local.get 25
                                i32.const 256
                                i32.lt_u
                                local.tee 29
                                select
                                call $memset
                                drop
                                local.get 0
                                i32.load
                                local.tee 24
                                i32.const 32
                                i32.and
                                i32.eqz
                                local.set 23
                                block  ;; label = @15
                                  local.get 29
                                  br_if 0 (;@15;)
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 23
                                      i32.const 1
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 64
                                      handle.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                      local.get 0
                                      i32.load
                                      local.set 24
                                    end
                                    local.get 24
                                    i32.const 32
                                    i32.and
                                    i32.eqz
                                    local.set 23
                                    local.get 25
                                    i32.const -256
                                    i32.add
                                    local.tee 25
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 23
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 64
                                handle.add
                                local.get 25
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 28
                              local.get 20
                              local.get 28
                              local.get 20
                              i32.gt_s
                              select
                              local.set 20
                              br 9 (;@4;)
                            end
                            block  ;; label = @13
                              local.get 29
                              i32.const -1
                              i32.gt_s
                              br_if 0 (;@13;)
                              local.get 30
                              br_if 10 (;@3;)
                            end
                            local.get 5
                            f64.load offset=56
                            local.set 36
                            local.get 5
                            i32.const 0
                            i32.store offset=364
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 36
                                    i64.reinterpret_f64
                                    i64.const -1
                                    i64.gt_s
                                    br_if 0 (;@16;)
                                    global.get 1
                                    i32.const 3424
                                    handle.add
                                    local.set 37
                                    local.get 36
                                    f64.neg
                                    local.set 36
                                    br 1 (;@15;)
                                  end
                                  global.get 1
                                  local.set 22
                                  local.get 31
                                  i32.const 2048
                                  i32.and
                                  i32.eqz
                                  br_if 1 (;@14;)
                                  local.get 22
                                  i32.const 3424
                                  handle.add
                                  i32.const 3
                                  handle.add
                                  local.set 37
                                end
                                i32.const 1
                                local.set 32
                                i32.const 0
                                local.set 38
                                br 1 (;@13;)
                              end
                              global.get 1
                              i32.const 3424
                              handle.add
                              local.tee 22
                              i32.const 6
                              handle.add
                              local.get 22
                              i32.const 1
                              handle.add
                              local.get 31
                              i32.const 1
                              i32.and
                              local.tee 32
                              select
                              local.set 37
                              local.get 32
                              i32.eqz
                              local.set 38
                            end
                            block  ;; label = @13
                              local.get 36
                              f64.abs
                              f64.const inf (;=inf;)
                              f64.lt
                              br_if 0 (;@13;)
                              global.get 1
                              local.set 22
                              local.get 32
                              i32.const 3
                              i32.add
                              local.set 24
                              block  ;; label = @14
                                local.get 31
                                i32.const 8192
                                i32.and
                                br_if 0 (;@14;)
                                local.get 28
                                local.get 24
                                i32.le_s
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 64
                                handle.add
                                i32.const 32
                                local.get 28
                                local.get 24
                                i32.sub
                                local.tee 20
                                i32.const 256
                                local.get 20
                                i32.const 256
                                i32.lt_u
                                local.tee 29
                                select
                                call $memset
                                drop
                                local.get 0
                                i32.load
                                local.tee 23
                                i32.const 32
                                i32.and
                                i32.eqz
                                local.set 25
                                block  ;; label = @15
                                  local.get 29
                                  br_if 0 (;@15;)
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 25
                                      i32.const 1
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 64
                                      handle.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                      local.get 0
                                      i32.load
                                      local.set 23
                                    end
                                    local.get 23
                                    i32.const 32
                                    i32.and
                                    i32.eqz
                                    local.set 25
                                    local.get 20
                                    i32.const -256
                                    i32.add
                                    local.tee 20
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 25
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 64
                                handle.add
                                local.get 20
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              block  ;; label = @14
                                local.get 0
                                i32.load
                                local.tee 20
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 37
                                local.get 32
                                local.get 0
                                call $__fwritex
                                drop
                                local.get 0
                                i32.load
                                local.set 20
                              end
                              block  ;; label = @14
                                local.get 20
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 22
                                i32.const 3451
                                handle.add
                                local.get 22
                                i32.const 3455
                                handle.add
                                local.get 33
                                i32.const 32
                                i32.and
                                local.tee 20
                                select
                                local.get 22
                                i32.const 3443
                                handle.add
                                local.get 22
                                i32.const 3447
                                handle.add
                                local.get 20
                                select
                                local.get 36
                                local.get 36
                                f64.ne
                                select
                                i32.const 3
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              block  ;; label = @14
                                local.get 31
                                i32.const 73728
                                i32.and
                                i32.const 8192
                                i32.ne
                                br_if 0 (;@14;)
                                local.get 28
                                local.get 24
                                i32.le_s
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 64
                                handle.add
                                i32.const 32
                                local.get 28
                                local.get 24
                                i32.sub
                                local.tee 20
                                i32.const 256
                                local.get 20
                                i32.const 256
                                i32.lt_u
                                local.tee 29
                                select
                                call $memset
                                drop
                                local.get 0
                                i32.load
                                local.tee 23
                                i32.const 32
                                i32.and
                                i32.eqz
                                local.set 25
                                block  ;; label = @15
                                  local.get 29
                                  br_if 0 (;@15;)
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 25
                                      i32.const 1
                                      i32.and
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 64
                                      handle.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                      local.get 0
                                      i32.load
                                      local.set 23
                                    end
                                    local.get 23
                                    i32.const 32
                                    i32.and
                                    i32.eqz
                                    local.set 25
                                    local.get 20
                                    i32.const -256
                                    i32.add
                                    local.tee 20
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 25
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 64
                                handle.add
                                local.get 20
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 28
                              local.get 24
                              local.get 28
                              local.get 24
                              i32.gt_s
                              select
                              local.set 20
                              br 6 (;@7;)
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 36
                                  local.get 5
                                  i32.const 364
                                  handle.add
                                  call $frexp
                                  local.tee 36
                                  local.get 36
                                  f64.add
                                  local.tee 36
                                  f64.const 0x0p+0 (;=0;)
                                  f64.eq
                                  br_if 0 (;@15;)
                                  local.get 5
                                  local.get 5
                                  i32.load offset=364
                                  local.tee 20
                                  i32.const -1
                                  i32.add
                                  i32.store offset=364
                                  local.get 33
                                  i32.const 32
                                  i32.or
                                  local.tee 39
                                  i32.const 97
                                  i32.ne
                                  br_if 1 (;@14;)
                                  br 7 (;@8;)
                                end
                                local.get 33
                                i32.const 32
                                i32.or
                                local.tee 39
                                i32.const 97
                                i32.eq
                                br_if 6 (;@8;)
                                i32.const 6
                                local.get 29
                                local.get 29
                                i32.const 0
                                i32.lt_s
                                select
                                local.set 26
                                local.get 5
                                i32.load offset=364
                                local.set 20
                                br 1 (;@13;)
                              end
                              local.get 5
                              local.get 20
                              i32.const -29
                              i32.add
                              local.tee 20
                              i32.store offset=364
                              i32.const 6
                              local.get 29
                              local.get 29
                              i32.const 0
                              i32.lt_s
                              select
                              local.set 26
                              local.get 36
                              f64.const 0x1p+28 (;=2.68435e+08;)
                              f64.mul
                              local.set 36
                            end
                            local.get 5
                            i32.const 368
                            handle.add
                            local.get 11
                            local.get 20
                            i32.const 0
                            i32.lt_s
                            local.tee 40
                            select
                            local.tee 41
                            local.set 27
                            loop  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 36
                                  f64.const 0x1p+32 (;=4.29497e+09;)
                                  f64.lt
                                  local.get 36
                                  f64.const 0x0p+0 (;=0;)
                                  f64.ge
                                  i32.and
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 36
                                  i32.trunc_f64_u
                                  local.set 25
                                  br 1 (;@14;)
                                end
                                i32.const 0
                                local.set 25
                              end
                              local.get 27
                              local.get 25
                              i32.store
                              local.get 27
                              i32.const 4
                              handle.add
                              local.set 27
                              local.get 36
                              local.get 25
                              f64.convert_i32_u
                              f64.sub
                              f64.const 0x1.dcd65p+29 (;=1e+09;)
                              f64.mul
                              local.tee 36
                              f64.const 0x0p+0 (;=0;)
                              f64.ne
                              br_if 0 (;@13;)
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 20
                                i32.const 1
                                i32.ge_s
                                br_if 0 (;@14;)
                                local.get 27
                                local.set 22
                                local.get 41
                                local.set 21
                                br 1 (;@13;)
                              end
                              local.get 41
                              local.set 21
                              loop  ;; label = @14
                                local.get 20
                                i32.const 29
                                local.get 20
                                i32.const 29
                                i32.lt_s
                                select
                                local.set 20
                                block  ;; label = @15
                                  local.get 27
                                  i32.const -4
                                  handle.add
                                  local.tee 22
                                  local.get 21
                                  handle.lt
                                  br_if 0 (;@15;)
                                  local.get 20
                                  i64.extend_i32_u
                                  local.set 35
                                  i64.const 0
                                  local.set 34
                                  loop  ;; label = @16
                                    local.get 22
                                    local.get 22
                                    i64.load32_u
                                    local.get 35
                                    i64.shl
                                    local.get 34
                                    i64.const 4294967295
                                    i64.and
                                    i64.add
                                    local.tee 34
                                    local.get 34
                                    i64.const 1000000000
                                    i64.div_u
                                    local.tee 34
                                    i64.const 1000000000
                                    i64.mul
                                    i64.sub
                                    i64.store32
                                    local.get 22
                                    i32.const -4
                                    handle.add
                                    local.tee 22
                                    local.get 21
                                    handle.lt
                                    i32.const 1
                                    i32.xor
                                    br_if 0 (;@16;)
                                  end
                                  local.get 34
                                  i32.wrap_i64
                                  local.tee 25
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 21
                                  i32.const -4
                                  handle.add
                                  local.tee 21
                                  local.get 25
                                  i32.store
                                end
                                block  ;; label = @15
                                  loop  ;; label = @16
                                    local.get 21
                                    local.get 27
                                    local.tee 22
                                    handle.lt
                                    i32.const 1
                                    i32.xor
                                    br_if 1 (;@15;)
                                    local.get 22
                                    i32.const -4
                                    handle.add
                                    local.tee 27
                                    i32.load
                                    i32.eqz
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 5
                                local.get 5
                                i32.load offset=364
                                local.get 20
                                i32.sub
                                local.tee 20
                                i32.store offset=364
                                local.get 22
                                local.set 27
                                local.get 20
                                i32.const 0
                                i32.gt_s
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 20
                            i32.const -1
                            i32.gt_s
                            br_if 3 (;@9;)
                            local.get 26
                            i32.const 25
                            i32.add
                            i32.const 9
                            i32.div_u
                            i32.const 1
                            i32.add
                            local.set 30
                            local.get 39
                            i32.const 102
                            i32.ne
                            br_if 2 (;@10;)
                            local.get 41
                            local.get 30
                            i32.const 2
                            i32.shl
                            handle.add
                            local.set 42
                            local.get 41
                            handle.get_offset
                            local.set 43
                            loop  ;; label = @13
                              i32.const 9
                              i32.const 0
                              local.get 20
                              i32.sub
                              local.get 20
                              i32.const -9
                              i32.lt_s
                              select
                              local.set 23
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 21
                                  local.get 22
                                  handle.lt
                                  br_if 0 (;@15;)
                                  local.get 21
                                  local.get 21
                                  i32.const 4
                                  handle.add
                                  local.get 21
                                  i32.load
                                  select
                                  local.set 21
                                  br 1 (;@14;)
                                end
                                i32.const 1000000000
                                local.get 23
                                i32.shr_u
                                local.set 24
                                i32.const -1
                                local.get 23
                                i32.shl
                                i32.const -1
                                i32.xor
                                local.set 29
                                i32.const 0
                                local.set 20
                                local.get 21
                                local.set 27
                                loop  ;; label = @15
                                  local.get 27
                                  local.get 27
                                  i32.load
                                  local.tee 25
                                  local.get 23
                                  i32.shr_u
                                  local.get 20
                                  i32.add
                                  i32.store
                                  local.get 25
                                  local.get 29
                                  i32.and
                                  local.get 24
                                  i32.mul
                                  local.set 20
                                  local.get 27
                                  i32.const 4
                                  handle.add
                                  local.tee 27
                                  local.get 22
                                  handle.lt
                                  br_if 0 (;@15;)
                                end
                                local.get 21
                                local.get 21
                                i32.const 4
                                handle.add
                                local.get 21
                                i32.load
                                select
                                local.set 21
                                local.get 20
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 22
                                local.get 20
                                i32.store
                                local.get 22
                                i32.const 4
                                handle.add
                                local.set 22
                              end
                              local.get 5
                              local.get 5
                              i32.load offset=364
                              local.get 23
                              i32.add
                              local.tee 20
                              i32.store offset=364
                              local.get 42
                              local.get 22
                              local.get 22
                              handle.get_offset
                              local.get 43
                              i32.sub
                              i32.const 2
                              i32.shr_s
                              local.get 30
                              i32.gt_s
                              select
                              local.set 22
                              local.get 20
                              i32.const 0
                              i32.lt_s
                              br_if 0 (;@13;)
                              br 4 (;@9;)
                            end
                          end
                          global.get 1
                          i32.const 3840
                          handle.add
                          i32.const 28
                          i32.store
                          br 9 (;@2;)
                        end
                        local.get 29
                        local.get 13
                        local.get 21
                        handle.get_offset
                        i32.sub
                        local.get 34
                        i64.eqz
                        i32.add
                        local.tee 20
                        local.get 29
                        local.get 20
                        i32.gt_s
                        select
                        local.set 29
                        local.get 12
                        local.set 22
                        br 5 (;@5;)
                      end
                      loop  ;; label = @10
                        i32.const 9
                        i32.const 0
                        local.get 20
                        i32.sub
                        local.get 20
                        i32.const -9
                        i32.lt_s
                        select
                        local.set 23
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 21
                            local.get 22
                            handle.lt
                            br_if 0 (;@12;)
                            local.get 21
                            local.get 21
                            i32.const 4
                            handle.add
                            local.get 21
                            i32.load
                            select
                            local.set 21
                            br 1 (;@11;)
                          end
                          i32.const 1000000000
                          local.get 23
                          i32.shr_u
                          local.set 24
                          i32.const -1
                          local.get 23
                          i32.shl
                          i32.const -1
                          i32.xor
                          local.set 29
                          i32.const 0
                          local.set 20
                          local.get 21
                          local.set 27
                          loop  ;; label = @12
                            local.get 27
                            local.get 27
                            i32.load
                            local.tee 25
                            local.get 23
                            i32.shr_u
                            local.get 20
                            i32.add
                            i32.store
                            local.get 25
                            local.get 29
                            i32.and
                            local.get 24
                            i32.mul
                            local.set 20
                            local.get 27
                            i32.const 4
                            handle.add
                            local.tee 27
                            local.get 22
                            handle.lt
                            br_if 0 (;@12;)
                          end
                          local.get 21
                          local.get 21
                          i32.const 4
                          handle.add
                          local.get 21
                          i32.load
                          select
                          local.set 21
                          local.get 20
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 22
                          local.get 20
                          i32.store
                          local.get 22
                          i32.const 4
                          handle.add
                          local.set 22
                        end
                        local.get 5
                        local.get 5
                        i32.load offset=364
                        local.get 23
                        i32.add
                        local.tee 20
                        i32.store offset=364
                        local.get 21
                        local.get 30
                        i32.const 2
                        i32.shl
                        handle.add
                        local.get 22
                        local.get 22
                        handle.get_offset
                        local.get 21
                        handle.get_offset
                        i32.sub
                        i32.const 2
                        i32.shr_s
                        local.get 30
                        i32.gt_s
                        select
                        local.set 22
                        local.get 20
                        i32.const 0
                        i32.lt_s
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 41
                    handle.get_offset
                    local.set 30
                    i32.const 0
                    local.set 25
                    block  ;; label = @9
                      local.get 21
                      local.get 22
                      handle.lt
                      i32.const 1
                      i32.xor
                      br_if 0 (;@9;)
                      local.get 30
                      local.get 21
                      handle.get_offset
                      i32.sub
                      i32.const 2
                      i32.shr_s
                      i32.const 9
                      i32.mul
                      local.set 25
                      local.get 21
                      i32.load
                      local.tee 23
                      i32.const 10
                      i32.lt_u
                      br_if 0 (;@9;)
                      i32.const 10
                      local.set 20
                      loop  ;; label = @10
                        local.get 25
                        i32.const 1
                        i32.add
                        local.set 25
                        local.get 23
                        local.get 20
                        i32.const 10
                        i32.mul
                        local.tee 20
                        i32.ge_u
                        br_if 0 (;@10;)
                      end
                    end
                    block  ;; label = @9
                      local.get 26
                      i32.const 0
                      local.get 25
                      local.get 39
                      i32.const 102
                      i32.eq
                      select
                      i32.sub
                      local.get 26
                      i32.const 0
                      i32.ne
                      local.get 39
                      i32.const 103
                      i32.eq
                      local.tee 43
                      i32.and
                      i32.sub
                      local.tee 20
                      local.get 22
                      handle.get_offset
                      local.get 30
                      i32.sub
                      i32.const 2
                      i32.shr_s
                      i32.const 9
                      i32.mul
                      i32.const -9
                      i32.add
                      i32.ge_s
                      br_if 0 (;@9;)
                      local.get 10
                      local.get 9
                      local.get 40
                      select
                      local.get 20
                      i32.const 9216
                      i32.add
                      local.tee 20
                      i32.const 9
                      i32.div_s
                      local.tee 24
                      i32.const 2
                      i32.shl
                      i32.const -4096
                      i32.add
                      handle.add
                      local.set 27
                      i32.const 10
                      local.set 23
                      block  ;; label = @10
                        local.get 20
                        local.get 24
                        i32.const 9
                        i32.mul
                        i32.sub
                        local.tee 20
                        i32.const 7
                        i32.gt_s
                        br_if 0 (;@10;)
                        local.get 20
                        i32.const -8
                        i32.add
                        local.set 20
                        i32.const 10
                        local.set 23
                        loop  ;; label = @11
                          local.get 23
                          i32.const 10
                          i32.mul
                          local.set 23
                          local.get 20
                          i32.const 1
                          i32.add
                          local.tee 24
                          local.get 20
                          i32.ge_u
                          local.set 29
                          local.get 24
                          local.set 20
                          local.get 29
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 27
                      i32.load
                      local.tee 24
                      local.get 24
                      local.get 23
                      i32.div_u
                      local.tee 29
                      local.get 23
                      i32.mul
                      i32.sub
                      local.set 20
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 27
                          i32.const 4
                          handle.add
                          local.get 22
                          handle.eq
                          local.tee 39
                          i32.const 1
                          i32.xor
                          br_if 0 (;@11;)
                          local.get 20
                          i32.eqz
                          br_if 1 (;@10;)
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 29
                            i32.const 1
                            i32.and
                            br_if 0 (;@12;)
                            f64.const 0x1p+53 (;=9.0072e+15;)
                            local.set 36
                            local.get 21
                            local.get 27
                            handle.lt
                            i32.const 1
                            i32.xor
                            br_if 1 (;@11;)
                            local.get 23
                            i32.const 1000000000
                            i32.ne
                            br_if 1 (;@11;)
                            local.get 27
                            i32.const -4
                            handle.add
                            i32.load8_u
                            i32.const 1
                            i32.and
                            i32.eqz
                            br_if 1 (;@11;)
                          end
                          f64.const 0x1.0000000000001p+53 (;=9.0072e+15;)
                          local.set 36
                        end
                        f64.const 0x1p-1 (;=0.5;)
                        f64.const 0x1p+0 (;=1;)
                        f64.const 0x1.8p+0 (;=1.5;)
                        local.get 20
                        local.get 23
                        i32.const 1
                        i32.shr_u
                        local.tee 29
                        i32.eq
                        select
                        f64.const 0x1.8p+0 (;=1.5;)
                        local.get 39
                        select
                        local.get 20
                        local.get 29
                        i32.lt_u
                        select
                        local.set 44
                        block  ;; label = @11
                          local.get 38
                          br_if 0 (;@11;)
                          local.get 37
                          i32.load8_u
                          i32.const 45
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 44
                          f64.neg
                          local.set 44
                          local.get 36
                          f64.neg
                          local.set 36
                        end
                        local.get 27
                        local.get 24
                        local.get 20
                        i32.sub
                        local.tee 20
                        i32.store
                        local.get 36
                        local.get 44
                        f64.add
                        local.get 36
                        f64.eq
                        br_if 0 (;@10;)
                        local.get 27
                        local.get 20
                        local.get 23
                        i32.add
                        local.tee 20
                        i32.store
                        block  ;; label = @11
                          local.get 20
                          i32.const 1000000000
                          i32.lt_u
                          br_if 0 (;@11;)
                          loop  ;; label = @12
                            local.get 27
                            i32.const 0
                            i32.store
                            block  ;; label = @13
                              local.get 27
                              i32.const -4
                              handle.add
                              local.tee 27
                              local.get 21
                              handle.lt
                              i32.const 1
                              i32.xor
                              br_if 0 (;@13;)
                              local.get 21
                              i32.const -4
                              handle.add
                              local.tee 21
                              i32.const 0
                              i32.store
                            end
                            local.get 27
                            local.get 27
                            i32.load
                            i32.const 1
                            i32.add
                            local.tee 20
                            i32.store
                            local.get 20
                            i32.const 999999999
                            i32.gt_u
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 30
                        local.get 21
                        handle.get_offset
                        i32.sub
                        i32.const 2
                        i32.shr_s
                        i32.const 9
                        i32.mul
                        local.set 25
                        local.get 21
                        i32.load
                        local.tee 23
                        i32.const 10
                        i32.lt_u
                        br_if 0 (;@10;)
                        i32.const 10
                        local.set 20
                        loop  ;; label = @11
                          local.get 25
                          i32.const 1
                          i32.add
                          local.set 25
                          local.get 23
                          local.get 20
                          i32.const 10
                          i32.mul
                          local.tee 20
                          i32.ge_u
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 27
                      i32.const 4
                      handle.add
                      local.tee 27
                      local.get 22
                      local.get 27
                      local.get 22
                      handle.lt
                      select
                      local.set 22
                    end
                    block  ;; label = @9
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 21
                          local.get 22
                          local.tee 27
                          handle.lt
                          i32.const 1
                          i32.xor
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 39
                          br 2 (;@9;)
                        end
                        local.get 27
                        i32.const -4
                        handle.add
                        local.tee 22
                        i32.load
                        i32.eqz
                        br_if 0 (;@10;)
                      end
                      i32.const 1
                      local.set 39
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 43
                        br_if 0 (;@10;)
                        local.get 31
                        i32.const 8
                        i32.and
                        local.set 29
                        br 1 (;@9;)
                      end
                      local.get 25
                      i32.const -1
                      i32.xor
                      i32.const -1
                      local.get 26
                      i32.const 1
                      local.get 26
                      select
                      local.tee 20
                      local.get 25
                      i32.gt_s
                      local.get 25
                      i32.const -5
                      i32.gt_s
                      i32.and
                      local.tee 23
                      select
                      local.get 20
                      i32.add
                      local.set 26
                      i32.const -1
                      i32.const -2
                      local.get 23
                      select
                      local.get 33
                      i32.add
                      local.set 33
                      local.get 31
                      i32.const 8
                      i32.and
                      local.tee 29
                      br_if 0 (;@9;)
                      i32.const 9
                      local.set 20
                      block  ;; label = @10
                        local.get 39
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 27
                        i32.const -4
                        handle.add
                        i32.load
                        local.tee 24
                        i32.eqz
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 20
                        local.get 24
                        i32.const 10
                        i32.rem_u
                        br_if 0 (;@10;)
                        i32.const 10
                        local.set 23
                        i32.const 0
                        local.set 20
                        loop  ;; label = @11
                          local.get 20
                          i32.const 1
                          i32.add
                          local.set 20
                          local.get 24
                          local.get 23
                          i32.const 10
                          i32.mul
                          local.tee 23
                          i32.rem_u
                          i32.eqz
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 27
                      handle.get_offset
                      local.get 30
                      i32.sub
                      i32.const 2
                      i32.shr_s
                      i32.const 9
                      i32.mul
                      i32.const -9
                      i32.add
                      local.set 23
                      block  ;; label = @10
                        local.get 33
                        i32.const -33
                        i32.and
                        i32.const 70
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 29
                        local.get 26
                        local.get 23
                        local.get 20
                        i32.sub
                        local.tee 20
                        i32.const 0
                        local.get 20
                        i32.const 0
                        i32.gt_s
                        select
                        local.tee 20
                        local.get 26
                        local.get 20
                        i32.lt_s
                        select
                        local.set 26
                        br 1 (;@9;)
                      end
                      i32.const 0
                      local.set 29
                      local.get 26
                      local.get 23
                      local.get 25
                      i32.add
                      local.get 20
                      i32.sub
                      local.tee 20
                      i32.const 0
                      local.get 20
                      i32.const 0
                      i32.gt_s
                      select
                      local.tee 20
                      local.get 26
                      local.get 20
                      i32.lt_s
                      select
                      local.set 26
                    end
                    i32.const -1
                    local.set 20
                    local.get 26
                    i32.const 2147483645
                    i32.const 2147483646
                    local.get 26
                    local.get 29
                    i32.or
                    local.tee 30
                    select
                    i32.gt_s
                    br_if 1 (;@7;)
                    local.get 26
                    local.get 30
                    i32.const 0
                    i32.ne
                    i32.add
                    i32.const 1
                    i32.add
                    local.set 43
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 33
                        i32.const -33
                        i32.and
                        i32.const 70
                        i32.ne
                        local.tee 38
                        br_if 0 (;@10;)
                        local.get 25
                        i32.const 2147483647
                        local.get 43
                        i32.sub
                        i32.gt_s
                        br_if 3 (;@7;)
                        local.get 25
                        i32.const 0
                        local.get 25
                        i32.const 0
                        i32.gt_s
                        select
                        local.set 25
                        br 1 (;@9;)
                      end
                      local.get 17
                      local.set 23
                      local.get 16
                      local.set 22
                      block  ;; label = @10
                        local.get 25
                        local.get 25
                        i32.const 31
                        i32.shr_s
                        local.tee 20
                        i32.add
                        local.get 20
                        i32.xor
                        local.tee 20
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 16
                        local.set 22
                        loop  ;; label = @11
                          local.get 22
                          i32.const -1
                          handle.add
                          local.tee 22
                          local.get 20
                          local.get 20
                          i32.const 10
                          i32.div_u
                          local.tee 23
                          i32.const 10
                          i32.mul
                          i32.sub
                          i32.const 48
                          i32.or
                          i32.store8
                          local.get 20
                          i32.const 9
                          i32.gt_u
                          local.set 24
                          local.get 23
                          local.set 20
                          local.get 24
                          br_if 0 (;@11;)
                        end
                        local.get 22
                        handle.get_offset
                        local.set 23
                      end
                      block  ;; label = @10
                        local.get 17
                        local.get 23
                        i32.sub
                        i32.const 1
                        i32.gt_s
                        br_if 0 (;@10;)
                        loop  ;; label = @11
                          local.get 22
                          i32.const -1
                          handle.add
                          local.tee 22
                          i32.const 48
                          i32.store8
                          local.get 17
                          local.get 22
                          handle.get_offset
                          i32.sub
                          i32.const 2
                          i32.lt_s
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 22
                      i32.const -2
                      handle.add
                      local.tee 45
                      local.get 33
                      i32.store8
                      i32.const -1
                      local.set 20
                      local.get 22
                      i32.const -1
                      handle.add
                      i32.const 45
                      i32.const 43
                      local.get 25
                      i32.const 0
                      i32.lt_s
                      select
                      i32.store8
                      local.get 17
                      local.get 45
                      handle.get_offset
                      i32.sub
                      local.tee 25
                      i32.const 2147483647
                      local.get 43
                      i32.sub
                      i32.gt_s
                      br_if 2 (;@7;)
                    end
                    i32.const -1
                    local.set 20
                    local.get 25
                    local.get 43
                    i32.add
                    local.tee 25
                    local.get 32
                    i32.const 2147483647
                    i32.xor
                    i32.gt_s
                    br_if 1 (;@7;)
                    local.get 25
                    local.get 32
                    i32.add
                    local.set 33
                    block  ;; label = @9
                      local.get 31
                      i32.const 73728
                      i32.and
                      local.tee 31
                      br_if 0 (;@9;)
                      local.get 28
                      local.get 33
                      i32.le_s
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 64
                      handle.add
                      i32.const 32
                      local.get 28
                      local.get 33
                      i32.sub
                      local.tee 20
                      i32.const 256
                      local.get 20
                      i32.const 256
                      i32.lt_u
                      local.tee 24
                      select
                      call $memset
                      drop
                      local.get 0
                      i32.load
                      local.tee 23
                      i32.const 32
                      i32.and
                      i32.eqz
                      local.set 25
                      block  ;; label = @10
                        local.get 24
                        br_if 0 (;@10;)
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 25
                            i32.const 1
                            i32.and
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 5
                            i32.const 64
                            handle.add
                            i32.const 256
                            local.get 0
                            call $__fwritex
                            drop
                            local.get 0
                            i32.load
                            local.set 23
                          end
                          local.get 23
                          i32.const 32
                          i32.and
                          i32.eqz
                          local.set 25
                          local.get 20
                          i32.const -256
                          i32.add
                          local.tee 20
                          i32.const 255
                          i32.gt_u
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 25
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 64
                      handle.add
                      local.get 20
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    block  ;; label = @9
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 37
                      local.get 32
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    block  ;; label = @9
                      local.get 31
                      i32.const 65536
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 28
                      local.get 33
                      i32.le_s
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 64
                      handle.add
                      i32.const 48
                      local.get 28
                      local.get 33
                      i32.sub
                      local.tee 20
                      i32.const 256
                      local.get 20
                      i32.const 256
                      i32.lt_u
                      local.tee 24
                      select
                      call $memset
                      drop
                      local.get 0
                      i32.load
                      local.tee 23
                      i32.const 32
                      i32.and
                      i32.eqz
                      local.set 25
                      block  ;; label = @10
                        local.get 24
                        br_if 0 (;@10;)
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 25
                            i32.const 1
                            i32.and
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 5
                            i32.const 64
                            handle.add
                            i32.const 256
                            local.get 0
                            call $__fwritex
                            drop
                            local.get 0
                            i32.load
                            local.set 23
                          end
                          local.get 23
                          i32.const 32
                          i32.and
                          i32.eqz
                          local.set 25
                          local.get 20
                          i32.const -256
                          i32.add
                          local.tee 20
                          i32.const 255
                          i32.gt_u
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 25
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 64
                      handle.add
                      local.get 20
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 38
                        br_if 0 (;@10;)
                        local.get 41
                        local.get 21
                        local.get 41
                        local.get 21
                        handle.lt
                        select
                        local.tee 42
                        local.set 21
                        loop  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 21
                                  i32.load
                                  local.tee 20
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  i32.const -1
                                  local.set 25
                                  loop  ;; label = @16
                                    local.get 14
                                    local.get 25
                                    handle.add
                                    local.tee 22
                                    local.get 20
                                    local.get 20
                                    i32.const 10
                                    i32.div_u
                                    local.tee 23
                                    i32.const 10
                                    i32.mul
                                    i32.sub
                                    i32.const 48
                                    i32.or
                                    i32.store8
                                    local.get 25
                                    i32.const -1
                                    i32.add
                                    local.set 25
                                    local.get 20
                                    i32.const 9
                                    i32.gt_u
                                    local.set 24
                                    local.get 23
                                    local.set 20
                                    local.get 24
                                    br_if 0 (;@16;)
                                  end
                                  block  ;; label = @16
                                    local.get 21
                                    local.get 42
                                    handle.eq
                                    br_if 0 (;@16;)
                                    local.get 5
                                    i32.const 336
                                    handle.add
                                    local.get 22
                                    handle.lt
                                    i32.const 1
                                    i32.xor
                                    br_if 4 (;@12;)
                                    br 3 (;@13;)
                                  end
                                  local.get 25
                                  i32.const -1
                                  i32.ne
                                  br_if 3 (;@12;)
                                  br 1 (;@14;)
                                end
                                local.get 14
                                local.set 22
                                local.get 21
                                local.get 42
                                handle.eq
                                i32.eqz
                                br_if 1 (;@13;)
                              end
                              local.get 22
                              i32.const -1
                              handle.add
                              local.tee 22
                              i32.const 48
                              i32.store8
                              br 1 (;@12;)
                            end
                            loop  ;; label = @13
                              local.get 22
                              i32.const -1
                              handle.add
                              local.tee 22
                              i32.const 48
                              i32.store8
                              local.get 5
                              i32.const 336
                              handle.add
                              local.get 22
                              handle.lt
                              br_if 0 (;@13;)
                            end
                          end
                          block  ;; label = @12
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            local.get 22
                            local.get 15
                            local.get 22
                            handle.get_offset
                            i32.sub
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 41
                          local.get 21
                          i32.const 4
                          handle.add
                          local.tee 21
                          handle.lt
                          i32.const 1
                          i32.xor
                          br_if 0 (;@11;)
                        end
                        block  ;; label = @11
                          local.get 30
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          global.get 1
                          i32.const 3459
                          handle.add
                          i32.const 1
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 26
                            i32.const 1
                            i32.ge_s
                            br_if 0 (;@12;)
                            local.get 26
                            local.set 20
                            br 1 (;@11;)
                          end
                          block  ;; label = @12
                            local.get 21
                            local.get 27
                            handle.lt
                            i32.const 1
                            i32.xor
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 26
                            local.set 20
                            br 1 (;@11;)
                          end
                          loop  ;; label = @12
                            local.get 14
                            local.set 22
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 21
                                i32.load
                                local.tee 20
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 14
                                local.set 22
                                loop  ;; label = @15
                                  local.get 22
                                  i32.const -1
                                  handle.add
                                  local.tee 22
                                  local.get 20
                                  local.get 20
                                  i32.const 10
                                  i32.div_u
                                  local.tee 25
                                  i32.const 10
                                  i32.mul
                                  i32.sub
                                  i32.const 48
                                  i32.or
                                  i32.store8
                                  local.get 20
                                  i32.const 9
                                  i32.gt_u
                                  local.set 23
                                  local.get 25
                                  local.set 20
                                  local.get 23
                                  br_if 0 (;@15;)
                                end
                                local.get 5
                                i32.const 336
                                handle.add
                                local.get 22
                                handle.lt
                                i32.const 1
                                i32.xor
                                br_if 1 (;@13;)
                              end
                              loop  ;; label = @14
                                local.get 22
                                i32.const -1
                                handle.add
                                local.tee 22
                                i32.const 48
                                i32.store8
                                local.get 5
                                i32.const 336
                                handle.add
                                local.get 22
                                handle.lt
                                br_if 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 22
                              local.get 26
                              i32.const 9
                              local.get 26
                              i32.const 9
                              i32.lt_s
                              select
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 26
                            i32.const -9
                            i32.add
                            local.set 20
                            local.get 26
                            i32.const 10
                            i32.lt_s
                            br_if 1 (;@11;)
                            local.get 20
                            local.set 26
                            local.get 21
                            i32.const 4
                            handle.add
                            local.tee 21
                            local.get 27
                            handle.lt
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 20
                        i32.const 1
                        i32.lt_s
                        br_if 1 (;@9;)
                        local.get 5
                        i32.const 64
                        handle.add
                        i32.const 48
                        local.get 20
                        i32.const 256
                        local.get 20
                        i32.const 256
                        i32.lt_u
                        local.tee 24
                        select
                        call $memset
                        drop
                        local.get 0
                        i32.load
                        local.tee 23
                        i32.const 32
                        i32.and
                        i32.eqz
                        local.set 25
                        block  ;; label = @11
                          local.get 24
                          br_if 0 (;@11;)
                          loop  ;; label = @12
                            block  ;; label = @13
                              local.get 25
                              i32.const 1
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 64
                              handle.add
                              i32.const 256
                              local.get 0
                              call $__fwritex
                              drop
                              local.get 0
                              i32.load
                              local.set 23
                            end
                            local.get 23
                            i32.const 32
                            i32.and
                            i32.eqz
                            local.set 25
                            local.get 20
                            i32.const -256
                            i32.add
                            local.tee 20
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 25
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 5
                        i32.const 64
                        handle.add
                        local.get 20
                        local.get 0
                        call $__fwritex
                        drop
                        br 1 (;@9;)
                      end
                      block  ;; label = @10
                        local.get 26
                        i32.const -1
                        i32.le_s
                        br_if 0 (;@10;)
                        local.get 27
                        local.get 21
                        i32.const 4
                        handle.add
                        local.get 39
                        select
                        local.set 37
                        local.get 21
                        local.set 27
                        local.get 21
                        local.set 42
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 29
                            i32.eqz
                            br_if 0 (;@12;)
                            loop  ;; label = @13
                              local.get 14
                              local.set 22
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 27
                                  i32.load
                                  local.tee 20
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  i32.const -1
                                  local.set 25
                                  loop  ;; label = @16
                                    local.get 14
                                    local.get 25
                                    handle.add
                                    local.tee 22
                                    local.get 20
                                    local.get 20
                                    i32.const 10
                                    i32.div_u
                                    local.tee 23
                                    i32.const 10
                                    i32.mul
                                    i32.sub
                                    i32.const 48
                                    i32.or
                                    i32.store8
                                    local.get 25
                                    i32.const -1
                                    i32.add
                                    local.set 25
                                    local.get 20
                                    i32.const 9
                                    i32.gt_u
                                    local.set 24
                                    local.get 23
                                    local.set 20
                                    local.get 24
                                    br_if 0 (;@16;)
                                  end
                                  local.get 25
                                  i32.const -1
                                  i32.ne
                                  br_if 1 (;@14;)
                                end
                                local.get 22
                                i32.const -1
                                handle.add
                                local.tee 22
                                i32.const 48
                                i32.store8
                              end
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 27
                                  local.get 21
                                  handle.eq
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i32.const 336
                                  handle.add
                                  local.get 22
                                  handle.lt
                                  i32.const 1
                                  i32.xor
                                  br_if 1 (;@14;)
                                  loop  ;; label = @16
                                    local.get 22
                                    i32.const -1
                                    handle.add
                                    local.tee 22
                                    i32.const 48
                                    i32.store8
                                    local.get 5
                                    i32.const 336
                                    handle.add
                                    local.get 22
                                    handle.lt
                                    br_if 0 (;@16;)
                                    br 2 (;@14;)
                                  end
                                end
                                block  ;; label = @15
                                  local.get 0
                                  i32.load
                                  local.tee 20
                                  i32.const 32
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 22
                                  i32.const 1
                                  local.get 0
                                  call $__fwritex
                                  drop
                                  local.get 0
                                  i32.load
                                  local.set 20
                                end
                                local.get 22
                                i32.const 1
                                handle.add
                                local.set 22
                                local.get 20
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                global.get 1
                                i32.const 3459
                                handle.add
                                i32.const 1
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 15
                              local.get 22
                              handle.get_offset
                              i32.sub
                              local.set 20
                              block  ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 22
                                local.get 20
                                local.get 26
                                local.get 26
                                local.get 20
                                i32.gt_s
                                select
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 26
                              local.get 20
                              i32.sub
                              local.set 26
                              local.get 27
                              i32.const 4
                              handle.add
                              local.tee 27
                              local.get 37
                              handle.lt
                              i32.const 1
                              i32.xor
                              br_if 2 (;@11;)
                              local.get 26
                              i32.const -1
                              i32.gt_s
                              br_if 0 (;@13;)
                              br 2 (;@11;)
                            end
                          end
                          loop  ;; label = @12
                            local.get 14
                            local.set 22
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 42
                                i32.load
                                local.tee 20
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const -1
                                local.set 25
                                loop  ;; label = @15
                                  local.get 14
                                  local.get 25
                                  handle.add
                                  local.tee 22
                                  local.get 20
                                  local.get 20
                                  i32.const 10
                                  i32.div_u
                                  local.tee 23
                                  i32.const 10
                                  i32.mul
                                  i32.sub
                                  i32.const 48
                                  i32.or
                                  i32.store8
                                  local.get 25
                                  i32.const -1
                                  i32.add
                                  local.set 25
                                  local.get 20
                                  i32.const 9
                                  i32.gt_u
                                  local.set 24
                                  local.get 23
                                  local.set 20
                                  local.get 24
                                  br_if 0 (;@15;)
                                end
                                local.get 25
                                i32.const -1
                                i32.ne
                                br_if 1 (;@13;)
                              end
                              local.get 22
                              i32.const -1
                              handle.add
                              local.tee 22
                              i32.const 48
                              i32.store8
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 42
                                local.get 21
                                handle.eq
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 336
                                handle.add
                                local.get 22
                                handle.lt
                                i32.const 1
                                i32.xor
                                br_if 1 (;@13;)
                                loop  ;; label = @15
                                  local.get 22
                                  i32.const -1
                                  handle.add
                                  local.tee 22
                                  i32.const 48
                                  i32.store8
                                  local.get 5
                                  i32.const 336
                                  handle.add
                                  local.get 22
                                  handle.lt
                                  br_if 0 (;@15;)
                                  br 2 (;@13;)
                                end
                              end
                              block  ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 22
                                i32.const 1
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 22
                              i32.const 1
                              handle.add
                              local.set 22
                              local.get 26
                              i32.const 1
                              i32.lt_s
                              br_if 0 (;@13;)
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              global.get 1
                              i32.const 3459
                              handle.add
                              i32.const 1
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 15
                            local.get 22
                            handle.get_offset
                            i32.sub
                            local.set 20
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 22
                              local.get 20
                              local.get 26
                              local.get 26
                              local.get 20
                              i32.gt_s
                              select
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 26
                            local.get 20
                            i32.sub
                            local.set 26
                            local.get 42
                            i32.const 4
                            handle.add
                            local.tee 42
                            local.get 37
                            handle.lt
                            i32.const 1
                            i32.xor
                            br_if 1 (;@11;)
                            local.get 26
                            i32.const -1
                            i32.gt_s
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 26
                        i32.const 1
                        i32.lt_s
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 64
                        handle.add
                        i32.const 48
                        local.get 26
                        i32.const 256
                        local.get 26
                        i32.const 256
                        i32.lt_u
                        local.tee 23
                        select
                        call $memset
                        drop
                        local.get 0
                        i32.load
                        local.tee 25
                        i32.const 32
                        i32.and
                        i32.eqz
                        local.set 20
                        block  ;; label = @11
                          local.get 23
                          br_if 0 (;@11;)
                          loop  ;; label = @12
                            block  ;; label = @13
                              local.get 20
                              i32.const 1
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 64
                              handle.add
                              i32.const 256
                              local.get 0
                              call $__fwritex
                              drop
                              local.get 0
                              i32.load
                              local.set 25
                            end
                            local.get 25
                            i32.const 32
                            i32.and
                            i32.eqz
                            local.set 20
                            local.get 26
                            i32.const -256
                            i32.add
                            local.tee 26
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 20
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 64
                        handle.add
                        local.get 26
                        local.get 0
                        call $__fwritex
                        drop
                      end
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 45
                      local.get 17
                      local.get 45
                      handle.get_offset
                      i32.sub
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    block  ;; label = @9
                      local.get 31
                      i32.const 8192
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 28
                      local.get 33
                      i32.le_s
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 64
                      handle.add
                      i32.const 32
                      local.get 28
                      local.get 33
                      i32.sub
                      local.tee 20
                      i32.const 256
                      local.get 20
                      i32.const 256
                      i32.lt_u
                      local.tee 24
                      select
                      call $memset
                      drop
                      local.get 0
                      i32.load
                      local.tee 23
                      i32.const 32
                      i32.and
                      i32.eqz
                      local.set 25
                      block  ;; label = @10
                        local.get 24
                        br_if 0 (;@10;)
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 25
                            i32.const 1
                            i32.and
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 5
                            i32.const 64
                            handle.add
                            i32.const 256
                            local.get 0
                            call $__fwritex
                            drop
                            local.get 0
                            i32.load
                            local.set 23
                          end
                          local.get 23
                          i32.const 32
                          i32.and
                          i32.eqz
                          local.set 25
                          local.get 20
                          i32.const -256
                          i32.add
                          local.tee 20
                          i32.const 255
                          i32.gt_u
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 25
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 64
                      handle.add
                      local.get 20
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    local.get 28
                    local.get 33
                    local.get 28
                    local.get 33
                    i32.gt_s
                    select
                    local.set 20
                    br 1 (;@7;)
                  end
                  local.get 37
                  i32.const 9
                  handle.add
                  local.get 37
                  local.get 33
                  i32.const 32
                  i32.and
                  local.tee 30
                  select
                  local.set 42
                  block  ;; label = @8
                    local.get 29
                    i32.const 11
                    i32.gt_u
                    br_if 0 (;@8;)
                    i32.const 12
                    local.get 29
                    i32.sub
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 29
                    i32.const -12
                    i32.add
                    local.set 20
                    f64.const 0x1p+4 (;=16;)
                    local.set 44
                    loop  ;; label = @9
                      local.get 44
                      f64.const 0x1p+4 (;=16;)
                      f64.mul
                      local.set 44
                      local.get 20
                      i32.const 1
                      i32.add
                      local.tee 25
                      local.get 20
                      i32.ge_u
                      local.set 23
                      local.get 25
                      local.set 20
                      local.get 23
                      br_if 0 (;@9;)
                    end
                    block  ;; label = @9
                      local.get 42
                      i32.load8_u
                      i32.const 45
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 44
                      local.get 36
                      f64.neg
                      local.get 44
                      f64.sub
                      f64.add
                      f64.neg
                      local.set 36
                      br 1 (;@8;)
                    end
                    local.get 36
                    local.get 44
                    f64.add
                    local.get 44
                    f64.sub
                    local.set 36
                  end
                  local.get 16
                  local.set 22
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 5
                      i32.load offset=364
                      local.tee 26
                      local.get 26
                      i32.const 31
                      i32.shr_s
                      local.tee 20
                      i32.add
                      local.get 20
                      i32.xor
                      local.tee 20
                      i32.eqz
                      br_if 0 (;@9;)
                      i32.const -1
                      local.set 25
                      loop  ;; label = @10
                        local.get 16
                        local.get 25
                        handle.add
                        local.tee 22
                        local.get 20
                        local.get 20
                        i32.const 10
                        i32.div_u
                        local.tee 23
                        i32.const 10
                        i32.mul
                        i32.sub
                        i32.const 48
                        i32.or
                        i32.store8
                        local.get 25
                        i32.const -1
                        i32.add
                        local.set 25
                        local.get 20
                        i32.const 9
                        i32.gt_u
                        local.set 24
                        local.get 23
                        local.set 20
                        local.get 24
                        br_if 0 (;@10;)
                      end
                      local.get 25
                      i32.const -1
                      i32.ne
                      br_if 1 (;@8;)
                    end
                    local.get 22
                    i32.const -1
                    handle.add
                    local.tee 22
                    i32.const 48
                    i32.store8
                  end
                  local.get 32
                  i32.const 2
                  i32.or
                  local.set 32
                  local.get 22
                  i32.const -2
                  handle.add
                  local.tee 27
                  local.get 33
                  i32.const 15
                  i32.add
                  i32.store8
                  local.get 22
                  i32.const -1
                  handle.add
                  i32.const 45
                  i32.const 43
                  local.get 26
                  i32.const 0
                  i32.lt_s
                  select
                  i32.store8
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 31
                      i32.const 8
                      i32.and
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 336
                      handle.add
                      local.set 21
                      loop  ;; label = @10
                        global.get 1
                        i32.const 3408
                        handle.add
                        local.set 22
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 36
                            f64.abs
                            f64.const 0x1p+31 (;=2.14748e+09;)
                            f64.lt
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 36
                            i32.trunc_f64_s
                            local.set 20
                            br 1 (;@11;)
                          end
                          i32.const -2147483648
                          local.set 20
                        end
                        local.get 21
                        local.get 22
                        local.get 20
                        handle.add
                        i32.load8_u
                        local.get 30
                        i32.or
                        i32.store8
                        local.get 36
                        local.get 20
                        f64.convert_i32_s
                        f64.sub
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        local.set 36
                        block  ;; label = @11
                          local.get 21
                          i32.const 1
                          handle.add
                          local.tee 22
                          handle.get_offset
                          local.get 6
                          i32.sub
                          i32.const 1
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 21
                          i32.const 1
                          handle.add
                          i32.const 46
                          i32.store8
                          local.get 21
                          i32.const 2
                          handle.add
                          local.set 22
                        end
                        local.get 22
                        local.set 21
                        local.get 36
                        f64.const 0x0p+0 (;=0;)
                        f64.ne
                        br_if 0 (;@10;)
                        br 2 (;@8;)
                      end
                    end
                    block  ;; label = @9
                      local.get 29
                      i32.const 1
                      i32.lt_s
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 336
                      handle.add
                      local.set 21
                      loop  ;; label = @10
                        global.get 1
                        i32.const 3408
                        handle.add
                        local.set 22
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 36
                            f64.abs
                            f64.const 0x1p+31 (;=2.14748e+09;)
                            f64.lt
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 36
                            i32.trunc_f64_s
                            local.set 20
                            br 1 (;@11;)
                          end
                          i32.const -2147483648
                          local.set 20
                        end
                        local.get 21
                        local.get 22
                        local.get 20
                        handle.add
                        i32.load8_u
                        local.get 30
                        i32.or
                        i32.store8
                        local.get 36
                        local.get 20
                        f64.convert_i32_s
                        f64.sub
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        local.set 36
                        block  ;; label = @11
                          local.get 21
                          i32.const 1
                          handle.add
                          local.tee 22
                          handle.get_offset
                          local.get 6
                          i32.sub
                          i32.const 1
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 21
                          i32.const 1
                          handle.add
                          i32.const 46
                          i32.store8
                          local.get 21
                          i32.const 2
                          handle.add
                          local.set 22
                        end
                        local.get 22
                        local.set 21
                        local.get 36
                        f64.const 0x0p+0 (;=0;)
                        f64.ne
                        br_if 0 (;@10;)
                        br 2 (;@8;)
                      end
                    end
                    local.get 5
                    i32.const 336
                    handle.add
                    local.set 22
                    loop  ;; label = @9
                      local.get 22
                      local.set 21
                      global.get 1
                      i32.const 3408
                      handle.add
                      local.set 22
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 36
                          f64.abs
                          f64.const 0x1p+31 (;=2.14748e+09;)
                          f64.lt
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 36
                          i32.trunc_f64_s
                          local.set 20
                          br 1 (;@10;)
                        end
                        i32.const -2147483648
                        local.set 20
                      end
                      local.get 21
                      local.get 22
                      local.get 20
                      handle.add
                      i32.load8_u
                      local.get 30
                      i32.or
                      i32.store8
                      local.get 36
                      local.get 20
                      f64.convert_i32_s
                      f64.sub
                      f64.const 0x1p+4 (;=16;)
                      f64.mul
                      local.set 36
                      block  ;; label = @10
                        local.get 21
                        i32.const 1
                        handle.add
                        local.tee 22
                        handle.get_offset
                        local.get 6
                        i32.sub
                        i32.const 1
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 36
                        f64.const 0x0p+0 (;=0;)
                        f64.eq
                        br_if 0 (;@10;)
                        local.get 21
                        i32.const 1
                        handle.add
                        i32.const 46
                        i32.store8
                        local.get 21
                        i32.const 2
                        handle.add
                        local.set 22
                      end
                      local.get 36
                      f64.const 0x0p+0 (;=0;)
                      f64.ne
                      br_if 0 (;@9;)
                    end
                  end
                  i32.const -1
                  local.set 20
                  i32.const 2147483645
                  local.get 32
                  local.get 17
                  local.get 27
                  handle.get_offset
                  i32.sub
                  local.tee 26
                  i32.add
                  local.tee 25
                  i32.sub
                  local.get 29
                  i32.lt_s
                  br_if 0 (;@7;)
                  local.get 25
                  local.get 29
                  i32.const 2
                  i32.add
                  local.get 22
                  handle.get_offset
                  local.tee 20
                  local.get 6
                  i32.sub
                  local.tee 30
                  local.get 7
                  local.get 20
                  i32.add
                  local.get 29
                  i32.lt_s
                  select
                  local.get 30
                  local.get 29
                  select
                  local.tee 33
                  i32.add
                  local.set 24
                  block  ;; label = @8
                    local.get 31
                    i32.const 73728
                    i32.and
                    local.tee 29
                    br_if 0 (;@8;)
                    local.get 28
                    local.get 24
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    handle.add
                    i32.const 32
                    local.get 28
                    local.get 24
                    i32.sub
                    local.tee 20
                    i32.const 256
                    local.get 20
                    i32.const 256
                    i32.lt_u
                    local.tee 31
                    select
                    call $memset
                    drop
                    local.get 0
                    i32.load
                    local.tee 23
                    i32.const 32
                    i32.and
                    i32.eqz
                    local.set 25
                    block  ;; label = @9
                      local.get 31
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 25
                          i32.const 1
                          i32.and
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 64
                          handle.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                          local.get 0
                          i32.load
                          local.set 23
                        end
                        local.get 23
                        i32.const 32
                        i32.and
                        i32.eqz
                        local.set 25
                        local.get 20
                        i32.const -256
                        i32.add
                        local.tee 20
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 25
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    handle.add
                    local.get 20
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 42
                    local.get 32
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 29
                    i32.const 65536
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 28
                    local.get 24
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    handle.add
                    i32.const 48
                    local.get 28
                    local.get 24
                    i32.sub
                    local.tee 20
                    i32.const 256
                    local.get 20
                    i32.const 256
                    i32.lt_u
                    local.tee 31
                    select
                    call $memset
                    drop
                    local.get 0
                    i32.load
                    local.tee 23
                    i32.const 32
                    i32.and
                    i32.eqz
                    local.set 25
                    block  ;; label = @9
                      local.get 31
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 25
                          i32.const 1
                          i32.and
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 64
                          handle.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                          local.get 0
                          i32.load
                          local.set 23
                        end
                        local.get 23
                        i32.const 32
                        i32.and
                        i32.eqz
                        local.set 25
                        local.get 20
                        i32.const -256
                        i32.add
                        local.tee 20
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 25
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    handle.add
                    local.get 20
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 336
                    handle.add
                    local.get 30
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 33
                    local.get 30
                    i32.sub
                    local.tee 20
                    i32.const 1
                    i32.lt_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    handle.add
                    i32.const 48
                    local.get 20
                    i32.const 256
                    local.get 20
                    i32.const 256
                    i32.lt_u
                    local.tee 31
                    select
                    call $memset
                    drop
                    local.get 0
                    i32.load
                    local.tee 23
                    i32.const 32
                    i32.and
                    i32.eqz
                    local.set 25
                    block  ;; label = @9
                      local.get 31
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 25
                          i32.const 1
                          i32.and
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 64
                          handle.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                          local.get 0
                          i32.load
                          local.set 23
                        end
                        local.get 23
                        i32.const 32
                        i32.and
                        i32.eqz
                        local.set 25
                        local.get 20
                        i32.const -256
                        i32.add
                        local.tee 20
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 25
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    handle.add
                    local.get 20
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 27
                    local.get 26
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 29
                    i32.const 8192
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 28
                    local.get 24
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    handle.add
                    i32.const 32
                    local.get 28
                    local.get 24
                    i32.sub
                    local.tee 20
                    i32.const 256
                    local.get 20
                    i32.const 256
                    i32.lt_u
                    local.tee 29
                    select
                    call $memset
                    drop
                    local.get 0
                    i32.load
                    local.tee 23
                    i32.const 32
                    i32.and
                    i32.eqz
                    local.set 25
                    block  ;; label = @9
                      local.get 29
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 25
                          i32.const 1
                          i32.and
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 64
                          handle.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                          local.get 0
                          i32.load
                          local.set 23
                        end
                        local.get 23
                        i32.const 32
                        i32.and
                        i32.eqz
                        local.set 25
                        local.get 20
                        i32.const -256
                        i32.add
                        local.tee 20
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 25
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    handle.add
                    local.get 20
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 28
                  local.get 24
                  local.get 28
                  local.get 24
                  i32.gt_s
                  select
                  local.set 20
                end
                local.get 20
                i32.const 0
                i32.ge_s
                br_if 2 (;@4;)
                br 3 (;@3;)
              end
              local.get 32
              local.set 31
              local.get 20
              local.set 29
            end
            local.get 22
            handle.get_offset
            local.get 21
            handle.get_offset
            i32.sub
            local.tee 33
            local.get 29
            local.get 29
            local.get 33
            i32.lt_s
            select
            local.tee 32
            i32.const 2147483647
            local.get 26
            i32.sub
            i32.gt_s
            br_if 1 (;@3;)
            local.get 26
            local.get 32
            i32.add
            local.tee 30
            local.get 28
            local.get 28
            local.get 30
            i32.lt_s
            select
            local.tee 20
            local.get 23
            i32.gt_s
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 31
              i32.const 73728
              i32.and
              local.tee 31
              br_if 0 (;@5;)
              local.get 30
              local.get 28
              i32.ge_s
              br_if 0 (;@5;)
              local.get 5
              i32.const 64
              handle.add
              i32.const 32
              local.get 20
              local.get 30
              i32.sub
              local.tee 25
              i32.const 256
              local.get 25
              i32.const 256
              i32.lt_u
              local.tee 43
              select
              call $memset
              drop
              local.get 0
              i32.load
              local.tee 24
              i32.const 32
              i32.and
              i32.eqz
              local.set 23
              block  ;; label = @6
                local.get 43
                br_if 0 (;@6;)
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 23
                    i32.const 1
                    i32.and
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    handle.add
                    i32.const 256
                    local.get 0
                    call $__fwritex
                    drop
                    local.get 0
                    i32.load
                    local.set 24
                  end
                  local.get 24
                  i32.const 32
                  i32.and
                  i32.eqz
                  local.set 23
                  local.get 25
                  i32.const -256
                  i32.add
                  local.tee 25
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 23
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              i32.const 64
              handle.add
              local.get 25
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 27
              local.get 26
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 31
              i32.const 65536
              i32.ne
              br_if 0 (;@5;)
              local.get 30
              local.get 28
              i32.ge_s
              br_if 0 (;@5;)
              local.get 5
              i32.const 64
              handle.add
              i32.const 48
              local.get 20
              local.get 30
              i32.sub
              local.tee 25
              i32.const 256
              local.get 25
              i32.const 256
              i32.lt_u
              local.tee 26
              select
              call $memset
              drop
              local.get 0
              i32.load
              local.tee 24
              i32.const 32
              i32.and
              i32.eqz
              local.set 23
              block  ;; label = @6
                local.get 26
                br_if 0 (;@6;)
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 23
                    i32.const 1
                    i32.and
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    handle.add
                    i32.const 256
                    local.get 0
                    call $__fwritex
                    drop
                    local.get 0
                    i32.load
                    local.set 24
                  end
                  local.get 24
                  i32.const 32
                  i32.and
                  i32.eqz
                  local.set 23
                  local.get 25
                  i32.const -256
                  i32.add
                  local.tee 25
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 23
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              i32.const 64
              handle.add
              local.get 25
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 33
              local.get 29
              i32.ge_s
              br_if 0 (;@5;)
              local.get 5
              i32.const 64
              handle.add
              i32.const 48
              local.get 32
              local.get 33
              i32.sub
              local.tee 25
              i32.const 256
              local.get 25
              i32.const 256
              i32.lt_u
              local.tee 29
              select
              call $memset
              drop
              local.get 0
              i32.load
              local.tee 24
              i32.const 32
              i32.and
              i32.eqz
              local.set 23
              block  ;; label = @6
                local.get 29
                br_if 0 (;@6;)
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 23
                    i32.const 1
                    i32.and
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    handle.add
                    i32.const 256
                    local.get 0
                    call $__fwritex
                    drop
                    local.get 0
                    i32.load
                    local.set 24
                  end
                  local.get 24
                  i32.const 32
                  i32.and
                  i32.eqz
                  local.set 23
                  local.get 25
                  i32.const -256
                  i32.add
                  local.tee 25
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 23
              i32.eqz
              br_if 0 (;@5;)
              local.get 5
              i32.const 64
              handle.add
              local.get 25
              local.get 0
              call $__fwritex
              drop
            end
            block  ;; label = @5
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 21
              local.get 33
              local.get 0
              call $__fwritex
              drop
            end
            local.get 31
            i32.const 8192
            i32.ne
            br_if 0 (;@4;)
            local.get 30
            local.get 28
            i32.ge_s
            br_if 0 (;@4;)
            local.get 5
            i32.const 64
            handle.add
            i32.const 32
            local.get 20
            local.get 30
            i32.sub
            local.tee 25
            i32.const 256
            local.get 25
            i32.const 256
            i32.lt_u
            local.tee 28
            select
            call $memset
            drop
            local.get 0
            i32.load
            local.tee 24
            i32.const 32
            i32.and
            i32.eqz
            local.set 23
            block  ;; label = @5
              local.get 28
              br_if 0 (;@5;)
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 23
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 64
                  handle.add
                  i32.const 256
                  local.get 0
                  call $__fwritex
                  drop
                  local.get 0
                  i32.load
                  local.set 24
                end
                local.get 24
                i32.const 32
                i32.and
                i32.eqz
                local.set 23
                local.get 25
                i32.const -256
                i32.add
                local.tee 25
                i32.const 255
                i32.gt_u
                br_if 0 (;@6;)
              end
            end
            local.get 23
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.const 64
            handle.add
            local.get 25
            local.get 0
            call $__fwritex
            drop
            br 0 (;@4;)
          end
        end
        global.get 1
        i32.const 3840
        handle.add
        i32.const 61
        i32.store
      end
      i32.const -1
      local.set 19
    end
    local.get 5
    i32.const 880
    handle.add
    global.set 0
    local.get 19)
  (func $pop_arg (type 19) (param handle i32 handle)
    (local handle)
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
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          local.get 1
                                          i32.const -9
                                          i32.add
                                          br_table 17 (;@2;) 0 (;@19;) 1 (;@18;) 4 (;@15;) 2 (;@17;) 3 (;@16;) 5 (;@14;) 6 (;@13;) 7 (;@12;) 8 (;@11;) 9 (;@10;) 10 (;@9;) 11 (;@8;) 12 (;@7;) 13 (;@6;) 14 (;@5;) 15 (;@4;) 16 (;@3;) 18 (;@1;)
                                        end
                                        local.get 2
                                        local.get 2
                                        handle.load
                                        local.tee 3
                                        i32.const 4
                                        handle.add
                                        handle.store
                                        local.get 0
                                        local.get 3
                                        i64.load32_s
                                        i64.store
                                        return
                                      end
                                      local.get 2
                                      local.get 2
                                      handle.load
                                      local.tee 3
                                      i32.const 4
                                      handle.add
                                      handle.store
                                      local.get 0
                                      local.get 3
                                      i64.load32_u
                                      i64.store
                                      return
                                    end
                                    local.get 2
                                    local.get 2
                                    handle.load
                                    local.tee 3
                                    i32.const 4
                                    handle.add
                                    handle.store
                                    local.get 0
                                    local.get 3
                                    i64.load32_s
                                    i64.store
                                    return
                                  end
                                  local.get 2
                                  local.get 2
                                  handle.load
                                  local.tee 3
                                  i32.const 4
                                  handle.add
                                  handle.store
                                  local.get 0
                                  local.get 3
                                  i64.load32_u
                                  i64.store
                                  return
                                end
                                local.get 2
                                local.get 2
                                handle.load
                                local.tee 3
                                local.get 3
                                handle.get_offset
                                local.tee 1
                                i32.const 7
                                i32.add
                                i32.const -8
                                i32.and
                                local.get 1
                                i32.sub
                                handle.add
                                local.tee 3
                                i32.const 8
                                handle.add
                                handle.store
                                local.get 0
                                local.get 3
                                i64.load
                                i64.store
                                return
                              end
                              local.get 2
                              local.get 2
                              handle.load
                              local.tee 3
                              i32.const 4
                              handle.add
                              handle.store
                              local.get 0
                              local.get 3
                              i64.load32_u
                              i64.const 48
                              i64.shl
                              i64.const 48
                              i64.shr_s
                              i64.store
                              return
                            end
                            local.get 2
                            local.get 2
                            handle.load
                            local.tee 3
                            i32.const 4
                            handle.add
                            handle.store
                            local.get 0
                            local.get 3
                            i64.load32_u
                            i64.const 65535
                            i64.and
                            i64.store
                            return
                          end
                          local.get 2
                          local.get 2
                          handle.load
                          local.tee 3
                          i32.const 4
                          handle.add
                          handle.store
                          local.get 0
                          local.get 3
                          i64.load32_u
                          i64.const 56
                          i64.shl
                          i64.const 56
                          i64.shr_s
                          i64.store
                          return
                        end
                        local.get 2
                        local.get 2
                        handle.load
                        local.tee 3
                        i32.const 4
                        handle.add
                        handle.store
                        local.get 0
                        local.get 3
                        i64.load32_u
                        i64.const 255
                        i64.and
                        i64.store
                        return
                      end
                      local.get 2
                      local.get 2
                      handle.load
                      local.tee 3
                      local.get 3
                      handle.get_offset
                      local.tee 1
                      i32.const 7
                      i32.add
                      i32.const -8
                      i32.and
                      local.get 1
                      i32.sub
                      handle.add
                      local.tee 3
                      i32.const 8
                      handle.add
                      handle.store
                      local.get 0
                      local.get 3
                      i64.load
                      i64.store
                      return
                    end
                    local.get 2
                    local.get 2
                    handle.load
                    local.tee 3
                    i32.const 4
                    handle.add
                    handle.store
                    local.get 0
                    local.get 3
                    i64.load32_u
                    i64.store
                    return
                  end
                  local.get 2
                  local.get 2
                  handle.load
                  local.tee 3
                  local.get 3
                  handle.get_offset
                  local.tee 1
                  i32.const 7
                  i32.add
                  i32.const -8
                  i32.and
                  local.get 1
                  i32.sub
                  handle.add
                  local.tee 3
                  i32.const 8
                  handle.add
                  handle.store
                  local.get 0
                  local.get 3
                  i64.load
                  i64.store
                  return
                end
                local.get 2
                local.get 2
                handle.load
                local.tee 3
                local.get 3
                handle.get_offset
                local.tee 1
                i32.const 7
                i32.add
                i32.const -8
                i32.and
                local.get 1
                i32.sub
                handle.add
                local.tee 3
                i32.const 8
                handle.add
                handle.store
                local.get 0
                local.get 3
                i64.load
                i64.store
                return
              end
              local.get 2
              local.get 2
              handle.load
              local.tee 3
              i32.const 4
              handle.add
              handle.store
              local.get 0
              local.get 3
              i64.load32_s
              i64.store
              return
            end
            local.get 2
            local.get 2
            handle.load
            local.tee 3
            local.get 3
            handle.get_offset
            local.tee 1
            i32.const 7
            i32.add
            i32.const -8
            i32.and
            local.get 1
            i32.sub
            handle.add
            local.tee 3
            i32.const 8
            handle.add
            handle.store
            local.get 0
            local.get 3
            handle.load
            handle.get_offset
            i64.extend_i32_u
            i64.store
            return
          end
          local.get 2
          local.get 2
          handle.load
          local.tee 3
          local.get 3
          handle.get_offset
          local.tee 1
          i32.const 7
          i32.add
          i32.const -8
          i32.and
          local.get 1
          i32.sub
          handle.add
          local.tee 3
          i32.const 8
          handle.add
          handle.store
          local.get 0
          local.get 3
          i64.load
          i64.store
          return
        end
        call $long_double_not_supported
        unreachable
      end
      local.get 2
      local.get 2
      handle.load
      local.tee 3
      local.get 3
      handle.get_offset
      local.tee 1
      i32.const 7
      i32.add
      i32.const -8
      i32.and
      local.get 1
      i32.sub
      handle.add
      local.tee 3
      i32.const 8
      handle.add
      handle.store
      local.get 0
      local.get 3
      handle.load
      handle.store
    end)
  (func $long_double_not_supported (type 8)
    (local handle)
    global.get 1
    local.tee 0
    i32.const 3264
    handle.add
    local.get 0
    i32.const 3648
    handle.add
    call $fputs
    drop
    call $abort
    unreachable)
  (func $memcpy (type 20) (param handle handle i32) (result handle)
    (local handle i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        handle.get_offset
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.set 3
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 2
          i32.const -1
          i32.add
          local.set 4
          local.get 3
          i32.const 1
          handle.add
          local.set 3
          local.get 1
          i32.const 1
          handle.add
          local.set 1
          local.get 2
          i32.const 1
          i32.eq
          br_if 2 (;@1;)
          local.get 4
          local.set 2
          local.get 1
          handle.get_offset
          i32.const 3
          i32.and
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      local.get 2
      local.set 4
      local.get 0
      local.set 3
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        handle.get_offset
        i32.const 3
        i32.and
        local.tee 2
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 4
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 3
            local.get 1
            i32.load
            i32.store
            local.get 3
            i32.const 4
            handle.add
            local.get 1
            i32.const 4
            handle.add
            i32.load
            i32.store
            local.get 3
            i32.const 8
            handle.add
            local.get 1
            i32.const 8
            handle.add
            i32.load
            i32.store
            local.get 3
            i32.const 12
            handle.add
            local.get 1
            i32.const 12
            handle.add
            i32.load
            i32.store
            local.get 3
            i32.const 16
            handle.add
            local.set 3
            local.get 1
            i32.const 16
            handle.add
            local.set 1
            local.get 4
            i32.const -16
            i32.add
            local.tee 4
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          local.get 4
          i32.const 8
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.load
          i32.store
          local.get 3
          i32.const 4
          handle.add
          local.get 1
          i32.const 4
          handle.add
          i32.load
          i32.store
          local.get 1
          i32.const 8
          handle.add
          local.set 1
          local.get 3
          i32.const 8
          handle.add
          local.set 3
        end
        block  ;; label = @3
          local.get 4
          i32.const 4
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.load
          i32.store
          local.get 1
          i32.const 4
          handle.add
          local.set 1
          local.get 3
          i32.const 4
          handle.add
          local.set 3
        end
        block  ;; label = @3
          local.get 4
          i32.const 2
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 1
          handle.add
          local.get 1
          i32.const 1
          handle.add
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 2
          handle.add
          local.set 3
          local.get 1
          i32.const 2
          handle.add
          local.set 1
        end
        local.get 4
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block  ;; label = @2
        local.get 4
        i32.const 32
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const -1
              i32.add
              br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 3 (;@2;)
            end
            local.get 3
            i32.const 1
            handle.add
            local.get 1
            i32.const 1
            handle.add
            i32.load8_u
            i32.store8
            local.get 3
            local.get 1
            i32.load
            local.tee 2
            i32.store8
            local.get 3
            i32.const 2
            handle.add
            local.get 1
            i32.const 2
            handle.add
            i32.load8_u
            i32.store8
            local.get 4
            i32.const -3
            i32.add
            local.set 4
            local.get 3
            i32.const 3
            handle.add
            local.set 3
            local.get 1
            i32.const 3
            handle.add
            local.set 1
            loop  ;; label = @5
              local.get 3
              local.get 1
              i32.const 1
              handle.add
              i32.load
              local.tee 5
              i32.const 8
              i32.shl
              local.get 2
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 4
              handle.add
              local.get 1
              i32.const 5
              handle.add
              i32.load
              local.tee 2
              i32.const 8
              i32.shl
              local.get 5
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 8
              handle.add
              local.get 1
              i32.const 9
              handle.add
              i32.load
              local.tee 5
              i32.const 8
              i32.shl
              local.get 2
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 12
              handle.add
              local.get 1
              i32.const 13
              handle.add
              i32.load
              local.tee 2
              i32.const 8
              i32.shl
              local.get 5
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get 3
              i32.const 16
              handle.add
              local.set 3
              local.get 1
              i32.const 16
              handle.add
              local.set 1
              local.get 4
              i32.const -16
              i32.add
              local.tee 4
              i32.const 16
              i32.gt_u
              br_if 0 (;@5;)
              br 3 (;@2;)
            end
          end
          local.get 3
          local.get 1
          i32.load
          local.tee 2
          i32.store8
          local.get 3
          i32.const 1
          handle.add
          local.get 1
          i32.const 1
          handle.add
          i32.load8_u
          i32.store8
          local.get 4
          i32.const -2
          i32.add
          local.set 4
          local.get 3
          i32.const 2
          handle.add
          local.set 3
          local.get 1
          i32.const 2
          handle.add
          local.set 1
          loop  ;; label = @4
            local.get 3
            local.get 1
            i32.const 2
            handle.add
            i32.load
            local.tee 5
            i32.const 16
            i32.shl
            local.get 2
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 4
            handle.add
            local.get 1
            i32.const 6
            handle.add
            i32.load
            local.tee 2
            i32.const 16
            i32.shl
            local.get 5
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 8
            handle.add
            local.get 1
            i32.const 10
            handle.add
            i32.load
            local.tee 5
            i32.const 16
            i32.shl
            local.get 2
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 12
            handle.add
            local.get 1
            i32.const 14
            handle.add
            i32.load
            local.tee 2
            i32.const 16
            i32.shl
            local.get 5
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get 3
            i32.const 16
            handle.add
            local.set 3
            local.get 1
            i32.const 16
            handle.add
            local.set 1
            local.get 4
            i32.const -16
            i32.add
            local.tee 4
            i32.const 17
            i32.gt_u
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 3
        local.get 1
        i32.load
        local.tee 2
        i32.store8
        local.get 4
        i32.const -1
        i32.add
        local.set 4
        local.get 3
        i32.const 1
        handle.add
        local.set 3
        local.get 1
        i32.const 1
        handle.add
        local.set 1
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.const 3
          handle.add
          i32.load
          local.tee 5
          i32.const 24
          i32.shl
          local.get 2
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 4
          handle.add
          local.get 1
          i32.const 7
          handle.add
          i32.load
          local.tee 2
          i32.const 24
          i32.shl
          local.get 5
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 8
          handle.add
          local.get 1
          i32.const 11
          handle.add
          i32.load
          local.tee 5
          i32.const 24
          i32.shl
          local.get 2
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 12
          handle.add
          local.get 1
          i32.const 15
          handle.add
          i32.load
          local.tee 2
          i32.const 24
          i32.shl
          local.get 5
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get 3
          i32.const 16
          handle.add
          local.set 3
          local.get 1
          i32.const 16
          handle.add
          local.set 1
          local.get 4
          i32.const -16
          i32.add
          local.tee 4
          i32.const 18
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        local.get 4
        i32.const 16
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.const 1
        handle.add
        local.get 1
        i32.const 1
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 2
        handle.add
        local.get 1
        i32.const 2
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 3
        handle.add
        local.get 1
        i32.const 3
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 4
        handle.add
        local.get 1
        i32.const 4
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 5
        handle.add
        local.get 1
        i32.const 5
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 6
        handle.add
        local.get 1
        i32.const 6
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 7
        handle.add
        local.get 1
        i32.const 7
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 8
        handle.add
        local.get 1
        i32.const 8
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 9
        handle.add
        local.get 1
        i32.const 9
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 10
        handle.add
        local.get 1
        i32.const 10
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 11
        handle.add
        local.get 1
        i32.const 11
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 12
        handle.add
        local.get 1
        i32.const 12
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 13
        handle.add
        local.get 1
        i32.const 13
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 14
        handle.add
        local.get 1
        i32.const 14
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 15
        handle.add
        local.get 1
        i32.const 15
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 16
        handle.add
        local.set 3
        local.get 1
        i32.const 16
        handle.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 1
        handle.add
        local.get 1
        i32.const 1
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 2
        handle.add
        local.get 1
        i32.const 2
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 3
        handle.add
        local.get 1
        i32.const 3
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 4
        handle.add
        local.get 1
        i32.const 4
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 5
        handle.add
        local.get 1
        i32.const 5
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 6
        handle.add
        local.get 1
        i32.const 6
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 7
        handle.add
        local.get 1
        i32.const 7
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 8
        handle.add
        local.set 3
        local.get 1
        i32.const 8
        handle.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 4
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 1
        handle.add
        local.get 1
        i32.const 1
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 2
        handle.add
        local.get 1
        i32.const 2
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 3
        handle.add
        local.get 1
        i32.const 3
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 4
        handle.add
        local.set 3
        local.get 1
        i32.const 4
        handle.add
        local.set 1
      end
      block  ;; label = @2
        local.get 4
        i32.const 2
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 1
        handle.add
        local.get 1
        i32.const 1
        handle.add
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 2
        handle.add
        local.set 3
        local.get 1
        i32.const 2
        handle.add
        local.set 1
      end
      local.get 4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i32.load8_u
      i32.store8
    end
    local.get 0)
  (func $memset (type 21) (param handle i32 i32) (result handle)
    (local i32 handle handle i64)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.const -1
      i32.add
      handle.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 2
      handle.add
      local.get 1
      i32.store8
      local.get 0
      i32.const 1
      handle.add
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.const -3
      i32.add
      handle.add
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.const -2
      i32.add
      handle.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 3
      handle.add
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.const -4
      i32.add
      handle.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      handle.get_offset
      i32.sub
      i32.const 3
      i32.and
      local.tee 3
      handle.add
      local.tee 4
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 1
      i32.store
      local.get 0
      local.get 3
      local.get 2
      local.get 3
      i32.sub
      i32.const -4
      i32.and
      local.tee 2
      i32.or
      handle.add
      local.tee 5
      i32.const -4
      handle.add
      local.get 1
      i32.store
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      i32.const 8
      handle.add
      local.get 1
      i32.store
      local.get 4
      i32.const 4
      handle.add
      local.get 1
      i32.store
      local.get 5
      i32.const -8
      handle.add
      local.get 1
      i32.store
      local.get 5
      i32.const -12
      handle.add
      local.get 1
      i32.store
      local.get 2
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      i32.const 16
      handle.add
      local.get 1
      i32.store
      local.get 4
      i32.const 12
      handle.add
      local.get 1
      i32.store
      local.get 4
      i32.const 20
      handle.add
      local.get 1
      i32.store
      local.get 4
      i32.const 24
      handle.add
      local.get 1
      i32.store
      local.get 5
      i32.const -24
      handle.add
      local.get 1
      i32.store
      local.get 5
      i32.const -28
      handle.add
      local.get 1
      i32.store
      local.get 5
      i32.const -20
      handle.add
      local.get 1
      i32.store
      local.get 5
      i32.const -16
      handle.add
      local.get 1
      i32.store
      local.get 2
      local.get 4
      handle.get_offset
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 3
      i32.sub
      local.tee 2
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      i64.extend_i32_u
      local.tee 6
      i64.const 32
      i64.shl
      local.get 6
      i64.or
      local.set 6
      local.get 4
      local.get 3
      handle.add
      local.set 4
      loop  ;; label = @2
        local.get 4
        local.get 6
        i64.store
        local.get 4
        i32.const 8
        handle.add
        local.get 6
        i64.store
        local.get 4
        i32.const 16
        handle.add
        local.get 6
        i64.store
        local.get 4
        i32.const 24
        handle.add
        local.get 6
        i64.store
        local.get 4
        i32.const 32
        handle.add
        local.set 4
        local.get 2
        i32.const -32
        i32.add
        local.tee 2
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $strlen (type 11) (param handle) (result i32)
    (local i32 i32 handle)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        handle.get_offset
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.set 2
        local.get 0
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        loop  ;; label = @3
          local.get 0
          i32.const 1
          handle.add
          local.tee 0
          handle.get_offset
          local.tee 2
          i32.const 3
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load8_u
          i32.eqz
          br_if 2 (;@1;)
          br 0 (;@3;)
        end
      end
      loop  ;; label = @2
        local.get 0
        local.tee 3
        i32.const 4
        handle.add
        local.set 0
        local.get 3
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
      block  ;; label = @2
        local.get 2
        i32.const 255
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 3
          i32.const 1
          handle.add
          local.tee 3
          i32.load8_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      handle.get_offset
      local.set 2
    end
    local.get 2
    local.get 1
    i32.sub)
  (func $memchr (type 21) (param handle i32 i32) (result handle)
    (local i32 i32 i32 handle)
    local.get 2
    i32.const 0
    i32.ne
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            local.get 2
            local.set 4
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 0
            handle.get_offset
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 2
            local.set 4
            br 1 (;@3;)
          end
          local.get 1
          i32.const 255
          i32.and
          local.set 5
          loop  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load8_u
              local.get 5
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              local.set 4
              br 3 (;@2;)
            end
            local.get 2
            i32.const 1
            i32.ne
            local.set 3
            local.get 2
            i32.const -1
            i32.add
            local.set 4
            local.get 0
            i32.const 1
            handle.add
            local.set 0
            local.get 2
            i32.const 1
            i32.eq
            br_if 1 (;@3;)
            local.get 4
            local.set 2
            local.get 0
            handle.get_offset
            i32.const 3
            i32.and
            br_if 0 (;@4;)
          end
        end
        handle.null
        local.set 6
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.get 1
        i32.const 255
        i32.and
        i32.eq
        br_if 0 (;@2;)
        local.get 4
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 255
        i32.and
        i32.const 16843009
        i32.mul
        local.set 3
        loop  ;; label = @3
          local.get 0
          i32.load
          local.get 3
          i32.xor
          local.tee 2
          i32.const -1
          i32.xor
          local.get 2
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          br_if 1 (;@2;)
          local.get 0
          i32.const 4
          handle.add
          local.set 0
          local.get 4
          i32.const -4
          i32.add
          local.tee 4
          i32.const 3
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      handle.null
      local.set 6
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 255
      i32.and
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u
          local.get 2
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          return
        end
        local.get 0
        i32.const 1
        handle.add
        local.set 0
        handle.null
        local.set 6
        local.get 4
        i32.const -1
        i32.add
        local.tee 4
        br_if 0 (;@2;)
      end
    end
    local.get 6)
  (func $strnlen (type 22) (param handle i32) (result i32)
    (local handle handle)
    handle.null
    local.set 2
    local.get 1
    local.get 0
    i32.const 0
    local.get 1
    call $memchr
    local.tee 3
    handle.get_offset
    local.get 0
    handle.get_offset
    i32.sub
    local.get 3
    local.get 2
    handle.eq
    select)
  (func $dummy.1 (type 23) (param handle handle) (result handle)
    local.get 0)
  (func $__lctrans (type 23) (param handle handle) (result handle)
    local.get 0
    local.get 1
    call $dummy.1)
  (func $wcrtomb (type 14) (param handle i32 handle) (result i32)
    (local i32)
    i32.const 1
    local.set 3
    block  ;; label = @1
      local.get 0
      handle.null
      handle.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        i32.const 127
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.store8
        i32.const 1
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          global.get 1
          i32.const 4888
          handle.add
          handle.load
          handle.null
          handle.eq
          i32.const 1
          i32.xor
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 1
            i32.const -128
            i32.and
            i32.const 57216
            i32.eq
            br_if 0 (;@4;)
            global.get 1
            i32.const 3840
            handle.add
            i32.const 25
            i32.store
            br 2 (;@2;)
          end
          local.get 0
          local.get 1
          i32.store8
          i32.const 1
          return
        end
        block  ;; label = @3
          local.get 1
          i32.const 2047
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 1
          handle.add
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 192
          i32.or
          i32.store8
          i32.const 2
          return
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 55296
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const -8192
            i32.and
            i32.const 57344
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 224
          i32.or
          i32.store8
          local.get 0
          i32.const 2
          handle.add
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8
          local.get 0
          i32.const 1
          handle.add
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8
          i32.const 3
          return
        end
        block  ;; label = @3
          local.get 1
          i32.const -65536
          i32.add
          i32.const 1048575
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.const 18
          i32.shr_u
          i32.const 240
          i32.or
          i32.store8
          local.get 0
          i32.const 3
          handle.add
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8
          local.get 0
          i32.const 1
          handle.add
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8
          local.get 0
          i32.const 2
          handle.add
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8
          i32.const 4
          return
        end
        global.get 1
        i32.const 3840
        handle.add
        i32.const 25
        i32.store
      end
      i32.const -1
      local.set 3
    end
    local.get 3)
  (func $wctomb (type 22) (param handle i32) (result i32)
    block  ;; label = @1
      local.get 0
      handle.null
      handle.eq
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 0
    local.get 1
    handle.null
    call $wcrtomb)
  (func $frexp (type 24) (param f64 handle) (result f64)
    (local i64 i32)
    block  ;; label = @1
      local.get 0
      i64.reinterpret_f64
      local.tee 2
      i64.const 52
      i64.shr_u
      i32.wrap_i64
      i32.const 2047
      i32.and
      local.tee 3
      i32.const 2047
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          f64.const 0x0p+0 (;=0;)
          f64.ne
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.store
          local.get 0
          return
        end
        local.get 0
        f64.const 0x1p+64 (;=1.84467e+19;)
        f64.mul
        local.get 1
        call $frexp
        local.set 0
        local.get 1
        local.get 1
        i32.load
        i32.const -64
        i32.add
        i32.store
        local.get 0
        return
      end
      local.get 1
      local.get 3
      i32.const -1022
      i32.add
      i32.store
      local.get 2
      i64.const -9218868437227405313
      i64.and
      i64.const 4602678819172646912
      i64.or
      f64.reinterpret_i64
      local.set 0
    end
    local.get 0)
  (table (;0;) 5 5 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut handle) (handle.null))
  (global (;1;) (mut handle) (handle.null))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (elem (;0;) (i32.const 1) func $__stdio_write $__stdio_close $__stdout_write $__stdio_seek)
  (data (;0;) (i32.const 1024) (pointers "") "Memory allocation failed. Exiting...\0a\00Success\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Link has been severed\00Protocol error\00Bad message\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Operation already in progress\00Operation in progress\00Stale file handle\00Quota exceeded\00Multihop attempted\00Capabilities insufficient\00\00\00\00\00\00\00\00\00\00\00\00\00u\02N\00\d6\01\e2\04\b9\04\18\01\8e\05\ed\02\16\04\f2\00\97\03\01\038\05\af\01\82\01O\03/\04\1e\00\d4\05\a2\00\12\03\1e\03\c2\01\de\03\08\00\ac\05\00\01d\02\f1\01e\054\02\8c\02\cf\02-\03L\04\e3\05\9f\02\f8\04\1c\05\08\05\b1\02K\05\15\02x\00R\02<\03\f1\03\e4\00\c3\03}\04\cc\00\aa\03y\05$\02n\01m\03\22\04\ab\04D\00\fb\01\ae\00\83\03`\00\e5\01\07\04\94\04^\04+\00X\019\01\92\00\c2\05\9b\01C\02F\01\f6\05-+   0X0x\00(null)\00\00\00\00\00\00\19\00\0a\00\19\19\19\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b\00\00\00\00\00\00\00\00\19\00\11\0a\19\19\19\03\0a\07\00\01\1b\09\0b\18\00\00\09\06\0b\00\00\0b\00\06\19\00\00\00\19\19\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0e\00\00\00\00\00\00\00\00\19\00\0a\0d\19\19\19\00\0d\00\00\02\00\09\0e\00\00\00\09\00\0e\00\00\0e\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\00\13\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\0f\00\00\00\04\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\11\00\00\00\00\09\12\00\00\00\00\00\12\00\00\12\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00\17\00\00\00\00\17\00\00\00\00\09\14\00\00\00\00\00\14\00\00\14\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\15\00\00\00\00\09\16\00\00\00\00\00\16\00\00\16\00\00Support for formatting long double values is currently disabled.\0aTo enable it, add -lc-printscan-long-double to the link command.\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\000123456789ABCDEF-0X+0X 0X-0x+0x 0x\00inf\00INF\00nan\00NAN\00.\00")
  (data (;1;) (i32.const 3464) (pointers "\c8\00\00\00\00\00\00\00\d0\00\00\00\00\00\00\00\e0\00\00\00\00\00\00\00\e8\00\00\00\00\00\00\00\f0\00\00\00\00\00\00\00\10\01\00\00\01\04\00\00") "\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\10\0f\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00P\13\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00"))
