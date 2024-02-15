# rust-mswasm-support
This repository contains some Rust source code files which have been used for experimenting with different methods in compiling Rust to MS-Wasm (Memory Safe Web Assembly). MS-Wasm is a variant of Wasm which introduces new features for granting safety inside memory. More details about MS-Wasm can be found [here](https://github.com/PLSysSec/ms-wasm).

Note: this repository is only intended as a support for initial work, not an actual complete implementation of Rust with MS-Wasm support

## Repository structure
For each one of these methods there is one directory that contains some files used for exploration, instructions for setting up the tools needed for the compilation and commands used for that specific method for the compilation process.

```
│
└─── rust_mswasm
└─── rust_cheri
└─── rust_c
└─── rust_wasm2c
└─── rust_llcm-cbe
```
