use sandboxed_small::WasmModule;

fn main() {
    let mut wasm_module = WasmModule::new();
    wasm_module._start().unwrap();
}