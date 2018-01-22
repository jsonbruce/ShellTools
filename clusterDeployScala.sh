#########################################################################
# --------->    FILE: clusterDeployScala.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 01/19/2018    TIME:16:06:49
#########################################################################

#!/bin/bash

USAGE="
Usage: $0 node_list_file deploy_scala_script scala_file

Deploy Scala to Cluster.

node_list_file              node name or ip per line
deploy_scala_script         single node scala deplpy script
scala_file                  Scala File

"

# Usage
if [ -z $3 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi

NODES=$1
SCRIPT=$2
SCALFILE=$3

for node in `cat $NODES`
do
	printf "Deploy to $node ... \n"

	scp $SCRIPT $SCALFILE root@$node:
	ssh root@$node "bash $SCRIPT -f $SCALFILE -d /usr/local/lib/scala && rm $SCRIPT $SCALFILE"
done