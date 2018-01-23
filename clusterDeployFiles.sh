#########################################################################
# --------->    FILE: clusterDeployFiles.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 01/22/2018    TIME:19:40:03
#########################################################################

#!/bin/bash

USAGE="
Usage: $0 node_list_file dst_dir file1 [file2 file3 ...]

Deploy Files to each node in cluster.

node_list_file                  a file. node name or ip per line
dst_dir                         directory in node  to be deployed
file[n]                         file or directory list seperated by blank

"


if [ -z $3 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi


USERNAME="root"

NODES=`cat $1`
DST_DIR=$2
shift 2
FILES="$*"


for node in $NODES
do
	scp -r $FILES $USERNAME@$node:$DST_DIR
done
