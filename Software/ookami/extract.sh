#!/bin/bash
  
rm -rf *.txt

# Run module spider and redirect output to a file
module load all-architectures
module avail > module_spider_output_cpu.txt

# Use AWK to filter lines where the first word ends with a colon and extract the first word without the colon
grep -oP '\b[a-zA-Z]+\b' module_spider_output_cpu.txt | sed 's/\<[0-9]\+\>//g' | sort -u | tr '[:upper:]' '[:lower:]' > ookami-software_list.txt
