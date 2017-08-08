#########################################################################
# --------->    FILE: fixDNS.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 08/08/2017    TIME:15:07:19
#########################################################################

#!/bin/bash

if grep -q "8.8.[8.4]" /etc/resolv.conf ;
then
	echo "DNS is Normal."
else
	sudo sh -c 'echo "nameserver 8.8.8.8\nnameserver 8.8.4.4" >> /etc/resolv.conf'
	echo "DNS fixed."
fi
