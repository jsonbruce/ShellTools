#########################################################################
# --------->    FILE: clusterDeployVim.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 01/22/2018    TIME:19:40:03
#########################################################################

#!/bin/bash

USAGE="
Usage: $0 [node_list_file | node1 node2 ...]

Deploy Vim develop environment to each node in cluster.

node_list_file                  a file. node name or ip per line
node1 node2                     node name or ip seperated by blank

"


if [ -z $1 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi


USERNAME="root"
VIM=".vim"
VIMRC=".vimrc"


# Parse file or string to array
if [ -f $1 ]; then
	NODES=`cat $1`
else
	NODES="$@"
fi


for node in $NODES
do
	ssh $USERNAME@$node "apt-get install vim ctags vim-nox vim-gtk vim-gnome vim-athena -y"
	scp -r $VIM $USERNAME@$node:
	scp $VIMRC $USERNAME@$node:
done