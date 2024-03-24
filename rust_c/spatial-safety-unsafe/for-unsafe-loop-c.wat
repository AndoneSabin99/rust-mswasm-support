(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func))
  (type (;2;) (func (param handle i32) (result i32)))
  (type (;3;) (func (result i32)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (type 0)))
  (func $__wasm_call_ctors (type 1)
    call $__mswasm_init_stack)
  (func $__mswasm_init_stack (type 1)
    i32.const 2097152
    new_segment
    i32.const 2097152
    handle.add
    global.set 0)
  (func $_start (type 1)
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
  (func $sum (type 2) (param handle i32) (result i32)
    (local handle i32 handle i32 i32 i32 i32 i32 i32 i32 i32 handle i32 i32 i32 handle i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 2
    i32.const -32
    local.set 3
    local.get 2
    local.get 3
    handle.add
    local.set 4
    i32.const 0
    local.set 5
    local.get 4
    local.get 0
    handle.store offset=24
    local.get 4
    local.get 1
    i32.store offset=20
    local.get 4
    local.get 5
    i32.store offset=16
    local.get 4
    local.get 5
    i32.store offset=12
    block  ;; label = @1
      loop  ;; label = @2
        local.get 4
        i32.load offset=12
        local.set 6
        local.get 4
        i32.load offset=20
        local.set 7
        local.get 6
        local.set 8
        local.get 7
        local.set 9
        local.get 8
        local.get 9
        i32.lt_s
        local.set 10
        i32.const 1
        local.set 11
        local.get 10
        local.get 11
        i32.and
        local.set 12
        local.get 12
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        handle.load offset=24
        local.set 13
        local.get 4
        i32.load offset=12
        local.set 14
        i32.const 2
        local.set 15
        local.get 14
        local.get 15
        i32.shl
        local.set 16
        local.get 13
        local.get 16
        handle.add
        local.set 17
        local.get 17
        i32.load
        local.set 18
        local.get 4
        i32.load offset=16
        local.set 19
        local.get 19
        local.get 18
        i32.add
        local.set 20
        local.get 4
        local.get 20
        i32.store offset=16
        local.get 4
        i32.load offset=12
        local.set 21
        i32.const 1
        local.set 22
        local.get 21
        local.get 22
        i32.add
        local.set 23
        local.get 4
        local.get 23
        i32.store offset=12
        br 0 (;@2;)
      end
    end
    local.get 4
    i32.load offset=16
    local.set 24
    local.get 24
    return)
  (func $main (type 3) (result i32)
    (local handle i32 handle i32 handle i32 i32 handle handle i32 handle i64 i32 handle handle i32 handle i64 i32 handle handle i64 i32 i32 handle handle i32 i32 i32 i32 i32 i32 i32 handle)
    global.get 0
    local.set 0
    i32.const -48
    local.set 1
    local.get 0
    local.get 1
    handle.add
    local.set 2
    local.get 2
    global.set 0
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    handle.add
    local.set 4
    local.get 4
    drop
    i32.const 0
    local.set 5
    local.get 2
    local.get 5
    i32.store offset=44
    i32.const 1024
    local.set 6
    global.get 1
    local.set 7
    local.get 7
    local.get 6
    handle.add
    local.set 8
    i32.const 16
    local.set 9
    local.get 8
    local.get 9
    handle.add
    local.set 10
    local.get 10
    i64.load
    local.set 11
    i32.const 16
    local.set 12
    local.get 2
    local.get 12
    handle.add
    local.set 13
    local.get 13
    local.get 9
    handle.add
    local.set 14
    local.get 14
    local.get 11
    i64.store
    i32.const 8
    local.set 15
    local.get 8
    local.get 15
    handle.add
    local.set 16
    local.get 16
    i64.load
    local.set 17
    i32.const 16
    local.set 18
    local.get 2
    local.get 18
    handle.add
    local.set 19
    local.get 19
    local.get 15
    handle.add
    local.set 20
    local.get 20
    local.get 17
    i64.store
    local.get 8
    i64.load
    local.set 21
    local.get 2
    local.get 21
    i64.store offset=16
    i32.const 6
    local.set 22
    local.get 2
    local.get 22
    i32.store offset=12
    i32.const 16
    local.set 23
    local.get 2
    local.get 23
    handle.add
    local.set 24
    local.get 24
    local.set 25
    local.get 2
    i32.load offset=12
    local.set 26
    local.get 25
    local.get 26
    call $sum
    local.set 27
    local.get 2
    local.get 27
    i32.store offset=8
    local.get 2
    i32.load offset=416
    local.set 28
    local.get 2
    i32.load offset=8
    local.set 29
    local.get 29
    local.get 28
    i32.add
    local.set 30
    local.get 2
    local.get 30
    i32.store offset=8
    local.get 2
    i32.load offset=8
    local.set 31
    i32.const 48
    local.set 32
    local.get 2
    local.get 32
    handle.add
    local.set 33
    local.get 33
    global.set 0
    local.get 31
    return)
  (func $__original_main (type 3) (result i32)
    call $main)
  (func $__wasi_proc_exit (type 0) (param i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_proc_exit
    unreachable)
  (func $dummy (type 1))
  (func $__wasm_call_dtors (type 1)
    call $dummy
    call $dummy)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut handle) (handle.null))
  (global (;1;) (mut handle) (handle.null))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (data (;0;) (i32.const 1024) (pointers "") "\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00"))
