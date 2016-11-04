#! /bin/bash
# Usage: execute useradd command in each node of Cluster
# er:
# ssh root@node25 "{command}"

COMMAND=useradd -p '111111' max && echo 'max:111111' | chpasswd && usermod -aG wheel dcos

NODES="node1 node2 node3"

for node in $NODES;
do
	ssh root@node "$COMMAND"
done
fi
