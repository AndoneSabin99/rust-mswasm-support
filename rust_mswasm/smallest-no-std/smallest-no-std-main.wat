(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func))
  (type (;2;) (func (result i32)))
  (import "env" "exit" (func $exit (type 0)))
  (func $__mswasm_init_stack (type 1)
    i32.const 2097152
    new_segment
    i32.const 2097152
    handle.add
    global.set 0)
  (func $_start (type 1)
    (local i32)
    block  ;; label = @1
      call $__original_main
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      call $exit
      unreachable
    end)
  (func $__original_main (type 2) (result i32)
    i32.const 0)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 16)
  (global (;0;) (mut handle) (handle.null))
  (global (;1;) (mut handle) (handle.null))
  (export "memory" (memory 0))
  (export "_start" (func $_start)))
