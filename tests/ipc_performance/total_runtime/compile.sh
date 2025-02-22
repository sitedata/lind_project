#!/bin/bash

echo "Compiling native test binaries"
gcc scripts/write16var.c -o scripts/write16var -lpthread
gcc scripts/read16var.c -o scripts/read16var -lpthread

echo "Compiling lind test binaries"
x86_64-nacl-gcc scripts/write16var.c -o scripts/write16var.nexe -std=gnu99 -lpthread
x86_64-nacl-gcc scripts/read16var.c -o scripts/read16var.nexe -std=gnu99 -lpthread

echo "Compiling user test binaries"
cargo build --release --manifest-path=scripts/userpipe/Cargo.toml
cp scripts/userpipe/target/release/userpipe scripts/userpipetest
