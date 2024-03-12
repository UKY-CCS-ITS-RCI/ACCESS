#!/bin/bash

cd /home/gazula/ACCESS/Software/Anvil
ssh x-gazula@anvil.rcac.purdue.edu " cd /home/x-gazula/software; sh /home/x-gazula/software/extract.sh"
scp x-gazula@anvil.rcac.purdue.edu:/home/x-gazula/software/anvil* .
git add .
git push -u origin main
