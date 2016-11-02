#ssh root@120.24.177.49
#pass: Bukeuscumarket601


connect(){
    sshpass -p $1 ssh -o StrictHostKeyChecking=no  $2@120.24.177.49
}

   # sshpass -p "Bukeuscumarket601" ssh -o StrictHostKeyChecking=no  root@120.24.177.49


# 1. via /etc/hosts
timeout 3 sshpass -p "111111" ssh -o StrictHostKeyChecking=no  root@$1

# 2. general connect function
if [ $? -ne 0 ]; then
	timeout 3 sshpass -p "111111" ssh -o StrictHostKeyChecking=no  root@10.107.$1
fi

#while getopts "u" arg
#do
#	case $arg in
#		u)
#			echo "-u:"
#			if [ $optarg='root' ]; then
#				connect Bukeuscumarket@601 root 
#			elif [ $optarg='max' ]; then
#				echo "max"
#			else
#				connect Terminal@207 yiave
#			fi
#		;;
#	esac
#done
