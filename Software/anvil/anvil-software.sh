cd /home/x-gazula/software
sh extract.sh
scp -o IdentitiesOnly=yes -i ~x-gazula/.ssh/id_rsa *.txt beacon@access-ara.ccs.uky.edu:software/anvil
scp -o IdentitiesOnly=yes -i ~x-gazula/.ssh/id_rsa extract.sh beacon@access-ara.ccs.uky.edu:software/anvil
