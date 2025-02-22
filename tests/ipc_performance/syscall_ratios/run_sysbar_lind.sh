#!/bin/bash

echo "Copying scripts to lindfs"
lindfs cp /home/lind/lind_project/tests/ipc_performance/syscall_ratios/scripts/pstime2.sh /pstime2.sh
lindfs cp /home/lind/lind_project/tests/ipc_performance/syscall_ratios/scripts/write_var_time.nexe /write_var_time
lindfs cp /home/lind/lind_project/tests/ipc_performance/syscall_ratios/scripts/read_var_time.nexe /read_var_time

echo -e "\nVarying write and read buffers"
./gen_sysbar_lind.sh a $1 | tee data/sysbar_lind_n_n

echo -e "\nVarying write buffers"
./gen_sysbar_lind.sh r $1 | tee data/sysbar_lind_n_16

echo -e "\nVarying read buffers"
./gen_sysbar_lind.sh w $1 | tee data/sysbar_lind_16_n
