#!/bin/bash
cd /home/gazula/software 
sh /etc/profile.d/lmod.sh 
. /opt/ohpc/admin/lmod/lmod/init/bash
export MODULEPATH=/opt/ohpc/pub/compiler/intel/oneapi/modulefiles:$MODULEPATH
export MODULEPATH=/share/kyric/modulefiles:$MODULEPATH
sh /home/gazula/software/extract.sh
