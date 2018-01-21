#! /bin/bash
# Requirements: 
# 1. all nodes in Cluster has the same username and password
# 2. All nodes installed expect
# execute in local compter 

USAGE="
Usage: $0 node_list_file deploy_ssh_pub_key_script password

Interconnection in Cluster.

node_list_file                  node name or ip per line
deploy_ssh_pub_key_script       deploy_ssh_pub_key_script
password                        the password of node (all nodes have same password)

"

if [ -z $3 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi


USERNAME=root
NODES=$1
LOCAL_SCRIPT=$2
PASSWORD=$3


# Deploy SSH Public Key with each other
for src in `cat $NODES`;
do
	# 1. install expect
	ssh $USERNAME@$src "apt-get install -y expect"

	# 2. generate ssh pub key
	ssh $USERNAME@$src "if [ ! -f $HOME/.ssh/id_rsa ];then ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -P '';fi"

	# 3. copy expect script to nodes
	scp $LOCAL_SCRIPT $USERNAME@$src:

	# 4. establish with each other
	for dst in $NODES;
	do
		ssh $USERNAME@$src "expect $LOCAL_SCRIPT $dst $PASSWORD"
	done
done


# Delete the script
for src in $NODES;
do
	ssh $USERNAME@$src "rm $LOCAL_SCRIPT"
done