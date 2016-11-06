#ssh root@120.24.177.49


connect(){
    sshpass -p $1 ssh -o StrictHostKeyChecking=no  $2@120.24.177.49
}

# 1. via /etc/hosts
# TODO: ssh -o BatchMode=yes
sshpass -p "111111" ssh -o ConnectTimeout=3 -o StrictHostKeyChecking=no  root@$1

# 2. general connect function
if [ $? -ne 0 ]; then
	sshpass -p "111111" ssh -o ConnectTimeout=3 -o StrictHostKeyChecking=no  root@10.107.$1
fi
