#!/bin/bash
# Deploy cluster's hosts file to each nodes.
# cluster's hosts file is below:
# 10.107.9.10     node10
# 10.107.9.20     node20
# 10.107.9.50     node50
# 10.107.9.60     node60
# 10.107.9.70     node70
# 10.107.9.80     node80
# 10.107.9.90     node90
# 10.107.9.120    node120
# 10.107.9.130    node130
#
# Note: you should prepare this hosts file manually

NODES="node10 node20 node50 node60 node70 node80 node90 node120 node130"

for node in $NODES;
do 
	scp hosts root@$node:
	ssh root@$node "cat hosts >> /etc/hosts && rm hosts"
done
