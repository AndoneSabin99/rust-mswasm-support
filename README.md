# rust-mswasm-support
This repository contains some Rust source code files which have been used for experimenting with different methods in compiling Rust to MS-Wasm (Memory Safe Web Assembly). MS-Wasm is a variant of Wasm which introduces new features for granting safety inside memory which can be implemented using CHERI capabilities. More details about MS-Wasm can be found [here](https://github.com/PLSysSec/ms-wasm).

Note: this repository is only intended as a support for initial work, not an actual complete implementation of Rust with MS-Wasm support!

## Toolchain
Compiling Rust to MS-Wasm requires some tools to be installed on the machine. First of all, it is necessary to acquire a Rust version with `wasm32-wasi` target installed. This can be achieved by either using [rustup](https://rustup.rs/) or building the Rust compiler by following the instructions on the official [Rust project repository](https://github.com/rust-lang/rust). The only exception that uses another fork of Rust is the second method, which uses a fork of the Rust compiler with CHERI support (see that directory instructions for more details).

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
