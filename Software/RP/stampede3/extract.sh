#!/bin/bash
  
rm -rf *.txt

# Run module spider and redirect output to a file
module --redirect spider > module_spider_output_cpu.txt

# Use AWK to filter output to required format
awk -F'[:/]' '!/^ *$/ && $0 ~ /:/ {gsub(/^ +/, "", $1); gsub(/ +$/, "", $1); if (!seen[$1]++ && $1 !~ / /) print tolower($1)}' module_spider_output_cpu.txt > stampede3-cpu-software.txt

