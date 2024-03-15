#!/bin/bash
  
rm -rf *.txt

cd /home/gazula/software
sh /etc/profile.d/lmod.sh
. /opt/ohpc/admin/lmod/lmod/init/bash

export MODULEPATH=/opt/ohpc/pub/compiler/intel/oneapi/modulefiles:$MODULEPATH
export MODULEPATH=/share/kyric/modulefiles:$MODULEPATH

# Run module spider and redirect output to a file
module --redirect spider > kyric_module_spider_output.txt

# Extract first word before a colon and copy it to output file
awk -F':' '{for(i=1; i<NF; i++) {sub(/-[0-9].*/, "", $i); if ($i !~ /:$/) print $i}}' kyric_module_spider_output.txt  |  awk 'NF==1' > software_names-kyric.txt
