fn main() {
    // Allocate an integer on the heap using Box
    let mut boxed_data = Box::new(42);

    // Get a raw pointer to the data inside the Box
    let raw_ptr = Box::into_raw(boxed_data);

    // Simulate freeing the memory (use-after-free error)
    unsafe { Box::from_raw(raw_ptr); }

    // Attempt to access the freed memory using the raw pointer (unsafe)
    // This is a use-after-free error and can lead to undefined behavior
    unsafe {
        println!("Data after dropping: {}", *raw_ptr);
    }
}