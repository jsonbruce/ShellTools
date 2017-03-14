#!/bin/bash

NODES="node10 node20 node50 node60 node70 node80 node90 node120 node130"
USER=root
PASSWORD=111111

for node in $NODES;
do 
	scp change-hostname.sh root@$node:
	ssh root@$node "bash change-hostname.sh && rm change-hostname.sh && reboot"
done
