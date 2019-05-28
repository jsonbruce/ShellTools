#!/bin/bash

USAGE="
Usage: $0 node_list_file deploy_ssh_pub_key_script username password port

Deploy local machine's Ssh Pub Key to each node in Cluster.

node_list_file                  node name or ip per line
deploy_ssh_pub_key_script       deploy_ssh_pub_key_script 
username                        username of each node
password                        the password of node (all nodes have same password)
port                            ssh port of each node(default to 22)

"

if [ -z $4 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi

if [ -z $5 ]; then
	printf "Using default ssh port 22."
	port=22
else
	port=$5
fi


NODES=$1
LOCAL_SCRIPT=$2
USERNAME=$3
PASSWORD=$4


for node in `cat $NODES`;
do 
	expect $LOCAL_SCRIPT $node $USERNAME $PASSWORD $port
done
