#########################################################################
# --------->    FILE: tra.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 04/20/2017    TIME:10:58:41
#########################################################################

#!/bin/bash

#!bin/sh
for file in ./*
do
    if test -f $file
    then
        echo $file is File 
    else
        echo $file is Directory
    fi
done
