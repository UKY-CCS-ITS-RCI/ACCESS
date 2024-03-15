#!/bin/bash

rm -rf *.txt

# Also see https://docs.ncsa.illinois.edu/systems/delta/en/latest/user_guide/software.html

# Run module spider and redirect output to a file
module --redirect spider > delta_module_spider_output.txt

awk '{if ($1 ~ /:$/) {sub(/:$/, "", $1); print $1}}' delta_module_spider_output.txt > delta-cpu-software.txt
awk '/:/{sub(/^[[:space:]]+/,"",$0); sub(/: /,":",$0); sub(/ /,", ",$0); print}' delta_module_spider_output.txt > delta_software_version_numbers.txt
