#########################################################################
# --------->    FILE: clusterDeployFiles.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 01/22/2018    TIME:19:40:03
#########################################################################

#!/bin/bash

USAGE="
Usage: $0 node_list_file file1 [file2 file3 ...]

Deploy Files to each node in cluster.

node_list_file                  a file. node name or ip per line
file[n]                         file or directory list seperated by blank

"


if [ -z $1 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi


USERNAME="root"

NODES=`cat $1`

FILES="$*"
FILES=${FILES#${1}}


for node in $NODES
do
	scp -r $FILES $USERNAME@$node:
done