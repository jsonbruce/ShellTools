#########################################################################
# --------->    FILE: apt-download.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 10/15/2018    TIME:16:56:28
#########################################################################

#!/bin/bash

apt-get download $@
apt-cache depends $@ | awk '/Depends:/ {print $2}' | xargs apt-get download

#for i in $(apt-cache depends $@ | grep -E 'Depends|Recommends|Suggests' | cut -d ':' -f 2,3 | sed -e s/'<'/''/ -e s/'>'/''/);
#do
#	apt-get download $i 2>>errors.log
#done
