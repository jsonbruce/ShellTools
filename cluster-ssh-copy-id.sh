#! /bin/bash
# Requirements: 
# 1. all nodes in Cluster has the same username and password
# 2. All nodes installed expect
# execute in local compter 

NODES="node10 node20 node50 node60 node70 node80 node90 node120 node130"

for src in $NODES;
do
	# 1. install expect
	ssh root@$src "apt-get install -y expect"

	# 2. generate ssh pub key
	ssh root@$src "if [ ! -f /root/.ssh/id_rsa ];then ssh-keygen -t rsa -f /root/.ssh/id_rsa -P '';fi"

	# 3. copy expect script to nodes
	scp ssh-copy-id-with-expect.exp root@$src:

	# 4. establish with each other
	for dst in $NODES;
	do
		ssh root@$src "expect ssh-copy-id-with-expect.exp $dst"
	done
done

for src in $NODES;
do
	ssh root@$src "rm ssh-copy-id-with-expect.exp"
done
