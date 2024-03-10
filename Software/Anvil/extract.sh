#!/bin/bash

rm -rf module_spider_output_* anvil*

# Load Lmod for CPU software https://www.rcac.purdue.edu/knowledge/anvil/software/provided_software
module load modtree/cpu

# Run module spider and redirect output to a file
module --redirect spider > module_spider_output_cpu.txt

# Use AWK to filter lines where the first word ends with a colon and extract the first word without the colon
awk '{if ($1 ~ /:$/) {sub(/:$/, "", $1); print $1}}' module_spider_output_cpu.txt > anvil-cpu-software.txt


# Load Lmod for GPU software https://www.rcac.purdue.edu/knowledge/anvil/software/provided_software
module unload modtree/cpu
module load modtree/gpu

# Run module spider and redirect output to a file
module --redirect spider > module_spider_output_gpu.txt

# Use AWK to filter lines where the first word ends with a colon and extract the first word without the colon
awk '{if ($1 ~ /:$/) {sub(/:$/, "", $1); print $1}}' module_spider_output_gpu.txt > anvil-gpu-software.txt
