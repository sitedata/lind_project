#!/bin/bash

echo -e "Compiling bash and coreutils"
/home/lind/lind_project/src/scripts/base/compile_bash.sh
/home/lind/lind_project/src/scripts/base/compile_coreutils.sh

echo -e "Compiling postgres"
/home/lind/lind_project/src/scripts/postgres/compile_postgres.sh
