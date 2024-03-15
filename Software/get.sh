#!/bin/bash

cd /home/beacon/software/anvil
ssh x-gazula@anvil.rcac.purdue.edu " cd /home/x-gazula/software; sh /home/x-gazula/software/extract.sh"
scp x-gazula@anvil.rcac.purdue.edu:/home/x-gazula/software/anvil* .

#waitng for ssh keys to get loaded
#cd /home/beacon/software/bridges2
#ssh gazula@bridges2.psc.edu " cd /jet/home/gazula/software; sh /jet/home/gazula/software/extract.sh"
#scp gazula@bridges2.psc.edu:/jet/home/gazula/software/* .

cd /home/beacon/software/darwin
ssh xsedeu2462@darwin.hpc.udel.edu " cd /home/2462/software ; sh /home/2462/software/extract.sh"
#scp xsedeu2462@darwin.hpc.udel.edu:/home/2462/software/*  .

cd /home/beacon/software/kyric
ssh gazula@kxc.ccs.uky.edu " cd /home/gazula/software ; sh /home/gazula/software/extract.sh"
scp gazula@kxc.ccs.uky.edu:/home/gazula/software/* .

