//#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}
 
#[no_mangle]
pub extern "C" fn __original_main() -> i32 {
    let array = [1, 2, 3, 4, 5, 6];
    let sum = sum(&array);
    sum
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

fn sum (arr: &[i32; 6]) -> i32{
    let mut sum = 0;
    
    for &num in arr {
        sum += num;
    }

    sum
}