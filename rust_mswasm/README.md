# Rust to MS-Wasm (official Rust fork)

In this method the official Rust fork is used for compiling Rust code into MS-Wasm. This means that in this case there are no modifications to the rustc source code, which means that CHERI capabilities are actually no integrated on this Rust compiler. However, it is still possible to compile and generate MS-Wasm binaries in a no-std environment and (at the moment) with only core library.


## Setup

Experimenting with this approach does not require any extra tool installed than the ones already listed on the main page. Make sure that the .cargo/config.toml file is configured as follows:

```
[target.wasm32-wasi]
linker = "/home/sabin/mswasm/mswasm-llvm/llvm/build/bin/clang"
ar = "/home/sabin/mswasm/mswasm-llvm/llvm/build/bin/llvm-ar"
rustflags = [
  "--sysroot=/home/sabin/mswasm/mswasm-wasi-libc/sysroot",
  "-C", "opt-level=3",
  "-L", "/home/sabin/mswasm/mswasm-wasi-libc/sysroot/lib/wasm32-wasi"
]
```


## Compiling and Executing

Since, with this configuration, Rust does not find the library files for MS-Wasm, at the moment it is necessary to compile with cargo and specify to build ths core crate at compilation time:

```
cargo build -Zbuild-std=core --target wasm32-wasi --release
```

To generate and run the executable with rWasm, do the following commands:

```
cargo run -- -w --ms-wasm <filename>.wasm <output_directory>
cargo run --release
```
