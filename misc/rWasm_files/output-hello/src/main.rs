use sandboxed_hello_wasi::WasmModule;
mod guest_mem_wrapper;

fn main() {
    let mut wasm_module = WasmModule::new();
    wasm_module._start().unwrap();
}