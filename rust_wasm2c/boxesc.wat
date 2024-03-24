(module
  (type (;0;) (func (param i32 handle) (result i32)))
  (type (;1;) (func (param handle handle) (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param handle) (result i32)))
  (type (;6;) (func (param i32 i32) (result handle)))
  (type (;7;) (func (param handle i32 i32) (result handle)))
  (import "env" "main" (func $main (type 0)))
  (import "wasi_snapshot_preview1" "args_get" (func $__imported_wasi_snapshot_preview1_args_get (type 1)))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func $__imported_wasi_snapshot_preview1_args_sizes_get (type 1)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (type 2)))
  (func $__wasm_call_ctors (type 3)
    call $__mswasm_init_stack)
  (func $__mswasm_init_stack (type 3)
    i32.const 2097152
    new_segment
    i32.const 2097152
    handle.add
    global.set 0)
  (func $_start (type 3)
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
  (func $main.1 (type 0) (param i32 handle) (result i32)
    local.get 0
    local.get 1
    call $main)
  (func $_Exit (type 2) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $__main_void (type 4) (result i32)
    (local handle i32 i32 handle handle handle)
    global.get 0
    i32.const -16
    handle.add
    local.tee 0
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 8
              handle.add
              local.get 0
              i32.const 12
              handle.add
              call $__wasi_args_sizes_get
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=8
              local.tee 1
              i32.const 1
              i32.add
              local.tee 2
              local.get 1
              i32.lt_u
              br_if 1 (;@4;)
              local.get 0
              i32.load offset=12
              new_segment
              local.tee 3
              handle.null
              handle.eq
              i32.const 1
              i32.xor
              i32.eqz
              br_if 2 (;@3;)
              handle.null
              local.set 4
              local.get 2
              i32.const 8
              call $calloc
              local.tee 5
              local.get 4
              handle.eq
              i32.const 1
              i32.xor
              i32.eqz
              br_if 3 (;@2;)
              local.get 5
              local.get 3
              call $__wasi_args_get
              br_if 4 (;@1;)
              local.get 0
              i32.load offset=8
              local.get 5
              call $main.1
              local.set 1
              local.get 0
              i32.const 16
              handle.add
              global.set 0
              local.get 1
              return
            end
            i32.const 71
            call $_Exit
            unreachable
          end
          i32.const 70
          call $_Exit
          unreachable
        end
        i32.const 70
        call $_Exit
        unreachable
      end
      local.get 3
      free_segment
      i32.const 70
      call $_Exit
      unreachable
    end
    local.get 3
    free_segment
    local.get 5
    free_segment
    i32.const 71
    call $_Exit
    unreachable)
  (func $__original_main (type 4) (result i32)
    call $__main_void)
  (func $__wasi_args_get (type 1) (param handle handle) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_args_get
    i32.const 65535
    i32.and)
  (func $__wasi_args_sizes_get (type 1) (param handle handle) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_args_sizes_get
    i32.const 65535
    i32.and)
  (func $__wasi_proc_exit (type 2) (param i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_proc_exit
    unreachable)
  (func $dummy (type 3))
  (func $__wasm_call_dtors (type 3)
    call $dummy
    call $dummy)
  (func $allzerop (type 5) (param handle) (result i32)
    i32.const 0)
  (func $calloc (type 6) (param i32 i32) (result handle)
    (local handle handle i32 handle)
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i64.extend_i32_u
      local.get 0
      i64.extend_i32_u
      i64.mul
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      i32.eqz
      br_if 0 (;@1;)
      global.get 1
      i32.const 1024
      handle.add
      i32.const 48
      i32.store
      handle.null
      return
    end
    block  ;; label = @1
      local.get 1
      local.get 0
      i32.mul
      local.tee 0
      new_segment
      local.tee 2
      handle.null
      local.tee 3
      handle.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          global.get 1
          i32.const 1028
          handle.add
          i32.load
          br_if 0 (;@3;)
          local.get 2
          call $allzerop
          br_if 1 (;@2;)
        end
        block  ;; label = @3
          local.get 0
          i32.const 4096
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 0
          local.get 2
          local.get 0
          handle.add
          handle.get_offset
          i32.const 4095
          i32.and
          local.tee 1
          i32.sub
          handle.add
          local.tee 3
          i32.const 0
          local.get 1
          call $memset
          handle.get_offset
          local.get 2
          handle.get_offset
          local.tee 4
          i32.sub
          local.tee 0
          i32.const 4096
          i32.lt_u
          br_if 0 (;@3;)
          i32.const 4096
          local.set 1
          loop  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.const -16
                handle.add
                local.tee 5
                i64.load
                local.get 3
                i32.const -8
                handle.add
                i64.load
                i64.or
                i64.const 0
                i64.eq
                br_if 0 (;@6;)
                local.get 3
                local.set 5
                br 1 (;@5;)
              end
              local.get 5
              local.set 3
              local.get 1
              i32.const -16
              i32.add
              local.tee 1
              br_if 1 (;@4;)
              i32.const 0
              local.set 1
            end
            local.get 5
            i32.const 0
            local.get 1
            i32.sub
            handle.add
            local.tee 3
            i32.const 0
            local.get 1
            call $memset
            local.set 5
            i32.const 4096
            local.set 1
            local.get 5
            handle.get_offset
            local.get 4
            i32.sub
            local.tee 0
            i32.const 4095
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        local.get 2
        i32.const 0
        local.get 0
        call $memset
        drop
      end
      local.get 2
      local.set 3
    end
    local.get 3)
  (func $memset (type 7) (param handle i32 i32) (result handle)
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
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut handle) (handle.null))
  (global (;1;) (mut handle) (handle.null))
  (export "memory" (memory 0))
  (export "_start" (func $_start)))
