#########################################################################
# --------->    FILE: clusterDeployJava.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 01/19/2018    TIME:16:06:49
#########################################################################

#!/bin/bash

USAGE="
Usage: $0 node_list_file deploy_java_script jdk_file

Deploy Java to Cluster.

node_list_file              node name or ip per line
deploy_java_script          single node java deplpy script
jdk_file                    JDK File

"

# Usage
if [ -z $3 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi

NODES=$1
SCRIPT=$2
JDKFILE=$3

for node in `cat $NODES`
do
	printf "Deploy to $node ... \n"

	scp $SCRIPT $JDKFILE root@$node:
	ssh root@$node "bash $SCRIPT -f $JDKFILE -d /usr/local/lib/java"
done
