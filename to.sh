#ssh root@120.24.177.49
#pass Terminal@207:


connect(){
    sshpass -p $1 ssh -o StrictHostKeyChecking=no  $2@120.24.177.49
}

   # sshpass -p "Bukeuscumarket601" ssh -o StrictHostKeyChecking=no  root@120.24.177.49


# 1. via /etc/hosts
# TODO: ssh -o BatchMode=yes
sshpass -p "111111" ssh -o ConnectTimeout=3 -o StrictHostKeyChecking=no  root@$1

# 2. general connect function
if [ $? -ne 0 ]; then
	sshpass -p "111111" ssh -o ConnectTimeout=3 -o StrictHostKeyChecking=no  root@10.107.$1
fi

#while getopts "u" arg
#do
#	case $arg in
#		u)
#			echo "-u:"
#			if [ $optarg='root' ]; then
#				connect Terminal@207 root 
#			elif [ $optarg='max' ]; then
#				echo "max"
#			else
#				connect Terminal@207 yiave
#			fi
#		;;
#	esac
#done
