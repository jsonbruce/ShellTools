#########################################################################
# --------->    FILE: clusterDeployZSH.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 01/22/2018    TIME:19:40:03
#########################################################################

#!/bin/bash

USAGE="
Usage: $0 [node_list_file | node1 node2 ...]

Deploy ZSH Shell environment to each node in cluster.

node_list_file                  a file. node name or ip per line
node1 node2                     node name or ip seperated by blank

"


if [ -z $1 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi


USERNAME="root"
ZSH=".oh-my-zsh"
ZSHRC=".zshrc"


# Parse file or string to array
if [ -f $1 ]; then
	NODES=`cat $1`
else
	NODES="$@"
fi


for node in $NODES
do
	ssh $USERNAME@$node "apt-get install git git-core zsh -y"
	scp -r $ZSH $USERNAME@$node:
	scp $ZSHRC $USERNAME@$node:
	ssh $USERNAME@$node "chsh -s `which zsh` && init 6"
done
