#########################################################################
# --------->    FILE: clusterDeployFiles.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 01/22/2018    TIME:19:40:03
#########################################################################

#!/bin/bash

USAGE="
Usage: $0 node_list_file username port dst_dir file1 [file2 file3 ...]

Deploy Files to each node in cluster.

node_list_file                  a file. node name or ip per line
username                        username of each node
port                            ssh port of each node(default to 22)
dst_dir                         directory in node  to be deployed
file[n]                         file or directory list seperated by blank

"


if [ -z $5 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi



NODES=`cat $1`
USERNAME=$2
port=$3
DST_DIR=$4
shift 4
FILES="$*"


for node in $NODES
do
	scp -P $port -r $FILES $USERNAME@$node:$DST_DIR
done
