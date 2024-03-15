#!/bin/bash
  
rm -rf *.txt

# Load Lmod for CPU software https://www.sdsc.edu/support/user_guides/expanse.html#modules
module load cpu

# Run module spider and redirect output to a file
module --redirect spider > module_spider_output_cpu.txt

# Use AWK to filter lines where the first word ends with a colon and extract the first word without the colon
awk -F'[:/]' '!/^ *$/ && $0 ~ /:/ {gsub(/^ +/, "", $1); gsub(/ +$/, "", $1); if (!seen[$1]++ && $1 !~ / /) print $1}' module_spider_output_cpu.txt > expanse-cpu-software.txt

# Load Lmod for GPU software https://www.sdsc.edu/support/user_guides/expanse.html#modules
module unload cpu
module load gpu

# Run module spider and redirect output to a file
module --redirect spider > module_spider_output_gpu.txt

# Use AWK to filter lines where the first word ends with a colon and extract the first word without the colon
awk -F'[:/]' '!/^ *$/ && $0 ~ /:/ {gsub(/^ +/, "", $1); gsub(/ +$/, "", $1); if (!seen[$1]++ && $1 !~ / /) print $1}' module_spider_output_gpu.txt > expanse-gpu-software.txt
#awk '{ if ($1 ~ /:$/) { sub("/", "\n", $1); print $1 } }' module_spider_output_gpu.txt > expanse-gpu-software.txt 
#awk '{if ($1 ~ /:$/) {sub(/:$/, "", $1); print $1}}' module_spider_output_gpu.txt > expanse-gpu-software.txt
