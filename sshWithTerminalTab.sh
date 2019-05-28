#!/bin/bash


#########################################################################
#   Copyright (C) 2019 All rights reserved.
#   
#   FILE: sshWithTerminalTab.sh
#   AUTHOR: Max Xu
#   MAIL: xuhuan@live.cn
#   DATE: 2019.05.28 10:34:02
#
#########################################################################

USAGE="
Usage: $0 node_list_file

SSH connect to each node within a new terminal tab.

node_list_file             host:port perline
"

if [ -z $1 ];then
	printf "%s\\n" "$USAGE"
	exit 0
fi

for np in `cat $1`;do
	arr=(${np//:/ })
	node=${arr[0]}
	port=${arr[1]}
	if [[ $port == "" ]];then
		port=22
	fi
	echo "node:" $node "port:" $port
    gnome-terminal -e "ssh -t -p $port $node tmux a" --tab-with-profile="GreenOnBlack"
done
