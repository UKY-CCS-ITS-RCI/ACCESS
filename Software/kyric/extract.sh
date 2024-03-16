#!/bin/bash
  
rm -rf *.txt

sh /etc/profile.d/lmod.sh
. /opt/ohpc/admin/lmod/lmod/init/bash

export MODULEPATH=/opt/ohpc/pub/compiler/intel/oneapi/modulefiles:$MODULEPATH
export MODULEPATH=/share/kyric/modulefiles:$MODULEPATH

# Run module spider and redirect output to a file
module --redirect spider > kyric_module_spider_output.txt

# Extract the contents to our required format
awk -F':' '{for(i=1; i<NF; i++) {sub(/-[0-9].*/, "", $i); if ($i !~ /:$/) print tolower($i)}}' kyric_module_spider_output.txt | awk 'NF==1' > kyric-software-list.txt

