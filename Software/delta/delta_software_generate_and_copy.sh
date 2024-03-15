#!/bin/bash
cd /u/gazula/software
sh extract.sh
scp *.txt beacon@access-ara.ccs.uky.edu:software/delta
scp extract.sh beacon@access-ara.ccs.uky.edu:software/delta
