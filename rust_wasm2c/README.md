# Rust to C to MS-Wasm (with wasm2c)

This method attempts in compiling Rust code into MS-Wasm using C as an intermediary language. 

## Setup

Experimenting with this approach requires wasm2c to be installed. Wasm2c is provided by [wabt](https://github.com/WebAssembly/wabt). Any Rust compiler can be used to obtain a wasm file. The compilation process is the following:

```
Rust -- via rustc --> Wasm -- via wasm2c --> C -- via clang with MS-Wasm support --> MS-Wasm
```

## Compiling and Executing

First, compile Rust code into Wasm, then convert it into C with wasm2c. From there compile to MS-Wasm. Note: this method is not guaranteed to work. In fact, all examples used with this approach do not generate an executable due to issues, but can still generate MS-Wasm binary files.

```
rustc <filename>.rs -o <filename>.wasm --target=wasm32-wasi
wasm2c <filename>.wasm -o <filename>.c
clang -O1 --target=wasm32-wasi --sysroot=<mswasm-wasi-libc/sysroot_path> <filename>.c -o <filename>.wasm
```
