#!/bin/bash

USAGE="
Usage: $0 node_list_file deploy_ssh_pub_key_script password

Deploy local machine's Ssh Pub Key to each node in Cluster.

node_list_file                  node name or ip per line
deploy_ssh_pub_key_script       deploy_ssh_pub_key_script
password                        the password of node (all nodes have same password)

"

if [ -z $3 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi


NODES=$1
LOCAL_SCRIPT=$2
PASSWORD=$3


for node in `cat $NODES`;
do 
	expect $LOCAL_SCRIPT $node $PASSWORD
done