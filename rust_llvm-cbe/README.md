# Rust to C to MS-Wasm (with llvm-cbe)

This method attempts in compiling Rust code into MS-Wasm using C as an intermediary language. 

## Setup

Experimenting with this approach requires llvm-cbe to be installed. Any Rust compiler can be used to obtain an LLVM-IR file. The compilation process is the following:

```
Rust -- via rustc --> LLVM-IR -- via llvm-cbe --> C -- via clang with MS-Wasm support --> MS-Wasm
```

## Compiling and Executing

First, compile Rust code into LLVM-IR, then convert it into C with llvm-cbe. From there compile to MS-Wasm. Note: this method is not guaranteed to work. In fact, all examples here cannot generate an executable due to issues.

```
rustc --emit=llvm-ir <filename>.rs -o <filename>.ll --target=wasm32-wasi -C opt-level=3
llvm-cbe <filename>.ll -o <filename>
clang -O3 --target=wasm32-wasi --sysroot=<mswasm-wasi-libc/sysroot_path> <filename>.ll -o <filename>.wasm
```
