#!/bin/bash

#########################################################################
# --------->    FILE: clusterDeployFiles.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 01/22/2018    TIME:19:40:03
#########################################################################

ARGS=`getopt -o n:u:p:d:h -l nodes:,user:,port:,dir:,help -- "$@"`

if [ $? != 0 ]; then
    echo "Terminating..."
    exit 1
fi

eval set -- "${ARGS}"

USAGE="
Usage: $0 -n|--nodes node_list_file [-u|--user user -p|--port port -d|--dir dst_dir] file1 [file2 file3 ...]

Deploy Files to each node in cluster.

node_list_file                  a file. node name or ip per line
user                            username of each node
port                            ssh port of each node(default to 22)
dst_dir                         directory in node  to be deployed
file[n]                         file or directory list seperated by blank
"

function usage() {
	printf "%s\\n" "$USAGE"
}

if [ -z $1 ];then
	usage
	exit 0
fi

while true
do
	case "$1" in
		-n|--nodes)
			#echo "Option -n", $2
            NODES=`cat $2`
			shift 2
			;;
		-u|--user)
			case "$2" in
				"")
					#echo "Option -u, no arg"
					U=""
					shift 2
					;;
				*)
					#echo "Option -u, arg $2"
					U="$2@"
					shift 2
					;;
			esac
			;;
		-p|--port)
			case "$2" in
				"")
					#echo "Option -p, no arg"
					PORT=""
					shift 2
					;;
				*)
					#echo "Option -p. arg $2"
					PORT="-P $2"
					shift 2
					;;
			esac
			;;
		-d|--dir)
			case "$2" in
				"")
					#echo "Option -d, no arg"
					shift 2
					;;
				*)
					#echo "Option -d, arg $2"
                    DST_DIR=$2
					shift 2
					;;
			esac
			;;
		-h|--help)
			usage
			exit 0
			;;
		--)
			shift
			break
			;;
		*)
			echo "$1 is not an option!"
			exit 1
			;;
	esac
done


FILES=$*

for node in $NODES
do
	scp $PORT -r $FILES $U$node:$DST_DIR
done
