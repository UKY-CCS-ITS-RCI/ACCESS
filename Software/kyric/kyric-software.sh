#!/bin/bash
cd /home/gazula/software
sh extract.sh
scp -o IdentitiesOnly=yes -i ~gazula/.ssh/id_rsa *.txt beacon@access-ara.ccs.uky.edu:software/kyric
scp -o IdentitiesOnly=yes -i ~gazula/.ssh/id_rsa extract.sh beacon@access-ara.ccs.uky.edu:software/kyric
