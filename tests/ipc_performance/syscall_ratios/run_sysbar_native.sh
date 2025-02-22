#!/bin/bash

echo "Varying write and read buffers"
./gen_sysbar_native.sh a $1 | tee data/sysbar_native_n_n

echo -e "\nVarying write buffers"
./gen_sysbar_native.sh r $1 | tee data/sysbar_native_n_16

echo -e "\nVarying read buffers"
./gen_sysbar_native.sh w $1 | tee data/sysbar_native_16_n
