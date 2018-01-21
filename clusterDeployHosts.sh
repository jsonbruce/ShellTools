#!/bin/bash
# Deploy cluster's hosts file from local to each node.
# cluster's hosts file is below:
# 10.107.9.10     node9-10
# 10.107.9.20     node9-20
# 10.107.9.50     node9-50
# 10.107.9.60     node9-60
# 10.107.9.70     node9-70
# 10.107.9.80     node9-80
# 10.107.9.90     node9-90
# 10.107.9.120    node9-120
# 10.107.9.130    node9-130
#
# Note: you should prepare this hosts file manually in local.

USAGE="
Usage: $0 node_list_file hosts_file

Deploy cluster hosts file to each node from local.

node_list_file                  node name or ip per line
hosts_file                      'ip   hostname' per line

"

if [ -z $2 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi


USERNAME=root
NODES=$1
HOSTS_FILE=$2


for node in `cat $NODES`;
do 
	scp $HOSTS_FILE $USERNAME@$node:
	ssh $USERNAME@$node "cat $HOSTS_FILE >> /etc/hosts && rm $HOSTS_FILE"
done
