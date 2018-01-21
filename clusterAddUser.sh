#! /bin/bash
# Add new user to each node of Cluster.
# Note:
# New user will get `sudo` pribilege.

USAGE="
Usage: $0 node_list_file username password

Add new user to each node in Cluster.

node_list_file                 node name or ip per line
username                       Username to be added
password                       Password of added user

"


# Usage
if [ -z $3 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi


NODES=$1
USERNAME=$2
PASSWORD=$3

COMMAND="useradd -m -G root,sudo -s /bin/bash $USERNAME && echo '$USERNAME:$PASSWORD' | chpasswd"


for node in $NODES;
do
	ssh root@$node "$COMMAND"
done