#!/bin/bash
  
rm -rf *.txt

# Run module spider and redirect output to a file
module --redirect spider > module_spider_output_cpu.txt

# Use AWK to filter lines where the first word ends with a colon and extract the first word without the colon
awk -F'[:/]' '!/^ *$/ && $0 ~ /:/ {gsub(/^ +/, "", $1); gsub(/ +$/, "", $1); if (!seen[$1]++ && $1 !~ / /) print tolower($1)}' module_spider_output_cpu.txt | sort -u > aces-cpu-software.txt

