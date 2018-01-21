#!/bin/bash

USAGE="
Usage: $0 node_list_file change_hostname_script

Cluster Change Hostname.

node_list_file                 node name or ip per line
change_hostname_script         local change hostname script

"


# Usage
if [ -z $2 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi


USERNAME=root
NODES=$1
LOCAL_SCRIPT=$2


for node in `cat $NODES`;
do 
	scp $LOCAL_SCRIPT $USERNAME@$node:
	ssh $USERNAME@$node "bash $LOCAL_SCRIPT && rm $LOCAL_SCRIPT && reboot"
done
