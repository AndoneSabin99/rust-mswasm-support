# rust-mswasm-support
This repository contains some Rust source code files which have been used for experimenting with different methods in compiling Rust to MS-Wasm (Memory Safe Web Assembly). MS-Wasm is a variant of Wasm which introduces new features for granting safety inside memory. These features can be implemented using CHERI capabilities. More details about MS-Wasm can be found [here](https://github.com/PLSysSec/ms-wasm).

Note: this repository is only intended to be a support for initial work, not an actual complete implementation of Rust with MS-Wasm support!

## Toolchain
Compiling Rust to MS-Wasm requires some tools to be installed on the machine. First of all, it is necessary to acquire a Rust compiler with `wasm32-wasi` target installed. This can be achieved by either using [rustup](https://rustup.rs/) or building the Rust compiler by following the instructions on the official [Rust project repository](https://github.com/rust-lang/rust). The only method that instead uses another fork of Rust is the second method, which uses a fork of the Rust compiler with CHERI support (see that directory instructions for more details). Once installed the Rust compiler, install the following tools:

* [mswasm-llvm](https://github.com/PLSysSec/mswasm-llvm): source code for the compiler from C to MS-Wasm bytecode. It is an extension of the [CHERI fork of LLVM](https://github.com/CTSRD-CHERI/llvm-project) with modifications to produce MSWasm bytecode. Since we want to generate MS-Wasm bytecode from Rust code, this Clang compiler is used as a linker.
* [mswasm-wasi-libc](https://github.com/PLSysSec/mswasm-wasi-libc): source code for supporting compilation of executables to MSWasm bytecode. Consists of WASI-libc with modifications to support MSWasm bytecode. In the case of Rust compilation, it is used since `wasm32-wasi` target requires the 'wasi-root'.
* [rWasm](https://github.com/secure-foundations/rWasm/tree/mswasm): source code for a AOT compiler from MSWasm bytecode. Consists of rWasm with modifications to support compiling from MSWasm bytecode.


## Repository structure
For each one of these methods there is one directory that contains some files used for exploration, instructions for setting up the tools needed for the compilation and commands used for that specific method for the compilation process.

```
│
└─── rust_mswasm
│   │
│   └─── 
└─── rust_cheri
│   │
│   └─── 
└─── rust_c
│   │
│   └─── 
└─── rust_wasm2c
│   │
│   └─── 
└─── rust_llcm-cbe
│   │
│   └─── 
```
