#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}
 
#[no_mangle]
pub extern "C" fn __original_main() -> i32 {
    let a = add(2,2);
    a
}

#[no_mangle]
pub extern "C" fn exit(code: u32) -> ! {
    unsafe {
        proc_exit(code);
    }
    loop {} 
}

#[link(wasm_import_module = "wasi_snapshot_preview1")]
extern "C" {
    fn proc_exit(code: u32);
}

fn add (a: i32, b: i32) -> i32{
    a+b
}