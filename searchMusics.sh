#/*************************************************************************
# *  --------->    FILE: searchMusics.sh
# *  --------->    AUTHOR: Max Xu
# *  --------->    MAIL: xuhuan@live.cn
# *  --------->    DATE: 02/17/2017    TIME:16:03:06
# ************************************************************************/
#

sudo mount -t cifs -o username=root //10.0.0.11/Public/ ~/Public/11
find ~/Public/11/Musics -name $1
