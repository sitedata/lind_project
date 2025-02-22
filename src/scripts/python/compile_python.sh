#!/bin/bash

# Builds openssl and libraries in nacl.
echo "Compiling Openssl"
cd /home/lind/lind_project/tests/applications/openssl
./bootstrap_nacl

# Builds python executable for lind.
echo "Building python"
cd /home/lind/lind_project/tests/applications/python/;
./bootstrap_nacl;
./fastcompile.sh

echo "Compiling markupsafe/_speedups.so..."
cd /home/lind/lind_project/tests/applications/python-modules/site-packages/markupsafe
x86_64-nacl-gcc -DPY_FORMAT_LONG_LONG=ll -std=c99 -fPIC -fno-strict-aliasing -march=x86-64 -mtune=generic -O2 -pipe -DNDEBUG -I. -I/home/lind/lind_project/tests/applications/python/Include/ -I/home/lind/lind_project/tests/applications/python -c _speedups.c -o _speedups.o
x86_64-nacl-gcc _speedups.o -o _speedups.so -pthread -shared -Wl,-O1 -Wl,-Bsymbolic-functions -std=c99 -L. -L/home/lind/lind_project/tests/applications/python -lpython2.7
rm _speedups.o



