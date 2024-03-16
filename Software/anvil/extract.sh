#!/bin/bash

rm -rf *.txt

# Load Lmod for CPU software https://www.rcac.purdue.edu/knowledge/anvil/software/provided_software
module load modtree/cpu

# Run module spider and redirect output to a file
module --redirect spider > module_spider_output_cpu.txt

# Use AWK to filter lines  to the format we require in lower case
awk '{if ($1 ~ /:$/) {sub(/:$/, "", $1); print $1}}' module_spider_output_cpu.txt | tr '[:upper:]' '[:lower:]' > anvil-cpu-software.txt


# Load Lmod for GPU software https://www.rcac.purdue.edu/knowledge/anvil/software/provided_software
module unload modtree/cpu
module load modtree/gpu

# Run module spider and redirect output to a file
module --redirect spider > module_spider_output_gpu.txt

# Use AWK to filter lines  to the format we require in lower case
awk '{if ($1 ~ /:$/) {sub(/:$/, "", $1); print $1}}' module_spider_output_gpu.txt | tr '[:upper:]' '[:lower:]' > anvil-gpu-software.txt
