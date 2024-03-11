# Rust to C to MS-Wasm (with transpiler)

This method attempts in compiling Rust code into MS-Wasm using C as an intermediary language. 

## Setup

This approach requires to transpile Rust code into C code. Transpiling means converting any high-level programming language code to an equivalent code written in another high-level language (like in this case from Rust to C). Transpiling can be done with converters (transpilers) that can be found on the Internet and that given in input a piece of code it will return an equivalent code of the other language.

The compilation process is designed like this:

```
Rust -- via transpiler --> C -- via clang with MS-Wasm support --> MS-Wasm
```

## Compiling and Executing

First, convert Rust code into C code. Use any Rust-to-C transpiler that can be found on the Internet to compile to C. Note that it can also be possible to write to equivalent C code by yourself but it is not recommended!

From there compile to MS-Wasm using clang.

```
clang -O3 --target=wasm32-wasi --sysroot=<mswasm-wasi-libc/sysroot_path> <filename>.ll -o <filename>.wasm
```

To generate and run the executable with rWasm, do the following commands:

```
cargo run -- -w --ms-wasm <filename>.wasm <output_directory>
cargo run --release
```