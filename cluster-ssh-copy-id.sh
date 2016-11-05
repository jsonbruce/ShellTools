#! /bin/bash
# Requirements: 
# 1. all nodes in Cluster has the same username and password
# 2. All nodes installed sshpass
# execute in node1

NODESE="node1 node2 node3 ..."

for src in $NODESE;
do
	ssh src
	ssh-keygen -t rsa -f /root/.ssh/id_rsa -P ""
	for dst in $NODESE;
	do
		sshpass -p "111111" ssh -o StrictHostKeyChecking=no dst "ssh-copy-id -i ~/.ssh/id_rsa.pub dst"
	done
done
