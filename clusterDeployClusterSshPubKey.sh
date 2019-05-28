#! /bin/bash
# Requirements: 
# 1. all nodes in Cluster has the same username and password
# 2. All nodes installed expect
# execute in local compter 

USAGE="
Usage: $0 node_list_file deploy_ssh_pub_key_script username password port

Interconnection in Cluster.

node_list_file                  node name or ip per line
deploy_ssh_pub_key_script       deploy_ssh_pub_key_script
username                        username of each node
password                        the password of node (all nodes have same password)
port                            ssh port of each node(default to 22)

"

if [ -z $4 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi

if [ -z $5 ]; then
	printf "Using default ssh port 22"
	port=22
else
	port=$5
fi


NODES=$1
LOCAL_SCRIPT=$2
USERNAME=$3
PASSWORD=$4


# 0. copy expect script to each node
for src in `cat $NODES`;
do
	scp -P $port $LOCAL_SCRIPT $USERNAME@$src:
done

# Deploy SSH Public Key with each other
for src in `cat $NODES`;
do
	# 1. install expect
	#ssh -p $port $USERNAME@$src "sudo apt-get install -y expect"

	# 2. generate ssh pub key
	ssh -p $port $USERNAME@$src "if [ ! -f $HOME/.ssh/id_rsa ];then ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -P '';fi"

	# 3. copy expect script to nodes
	#scp -P $port $LOCAL_SCRIPT $USERNAME@$src:

	# 4. establish with each other
	for dst in `cat $NODES`;
	do
		ssh -p $port $USERNAME@$src "expect $LOCAL_SCRIPT $dst $USERNAME $PASSWORD $port"
	done
done


# Delete the script
for src in $NODES;
do
	ssh -p $port $USERNAME@$src "rm $LOCAL_SCRIPT"
done
