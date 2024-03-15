#!/bin/bash

rm -rf *.txt

# Also see https://docs.ncsa.illinois.edu/systems/bridges2/en/latest/user_guide/software.html

# Run module spider and redirect output to a file
module --redirect spider > bridges2_module_spider_output.txt

awk '{if ($1 ~ /:$/) {sub(/:$/, "", $1); print $1}}' bridges2_module_spider_output.txt > bridges2-cpu-software.txt
awk '/:/{sub(/^[[:space:]]+/,"",$0); sub(/: /,":",$0); sub(/ /,", ",$0); print}' bridges2_module_spider_output.txt > bridges2_software_version_numbers.txt

