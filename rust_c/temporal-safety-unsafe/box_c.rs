fn main() {
    let mut boxed_data = Box::new(42);
    let raw_ptr = Box::into_raw(boxed_data);

    // freeing the memory (use-after-free error)
    unsafe { Box::from_raw(raw_ptr); }

    // Attempt to access the freed memory using the raw pointer (unsafe)
    // This is a use-after-free error and can lead to undefined behavior
    unsafe {
        println!("Data after dropping: {}", *raw_ptr);
    }
}