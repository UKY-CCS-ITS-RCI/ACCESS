#!/bin/bash

rm -rf *.txt

# Run module spider and redirect output to a file
vpkg_list > vpkg_list_output_cpu.txt
cp vpkg_list_output_cpu.txt darwin-cpu-software.txt
sed -i '1,3d'  darwin-cpu-software.txt
scp * beacon@access-ara.ccs.uky.edu:/home/beacon/software/darwin
