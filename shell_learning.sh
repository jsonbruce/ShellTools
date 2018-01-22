#########################################################################
# --------->    FILE: shell_learning.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 01/21/2018    TIME:17:08:58
#########################################################################

#!/bin/bash

# This file is for Shell Script Learning.
# Including:
# 1. Basic Shell Grammar.
# 2. Advanced Shell Operation.
# 3. File Manipulation.


# Float Computing
x=$(echo '0.02' | bc -l)
k=$(awk 'BEGIN{print 3.14}')

for i in $(seq 5); 
do
	y=$(echo $x \* $i \* $k| bc -l)
	echo $y
done


# Using grep Check file contains specific string.
if [ `echo $SHELL` == "/bin/bash" ]; then
    SHELL_PROFILE="$HOME"/.bashrc
elif [ `echo $SHELL` == "/usr/bin/zsh" ]; then
    SHELL_PROFILE="$HOME"/.zshrc
fi   

A="JAVA_HOME"
B="max"
C="xuhuan"
if grep -q $C $SHELL_PROFILE; then
	echo "Find"
else
	echo "404"
fi


# Read File
for line in $(cat nodes.txt)
do
	printf "$line\n"
done


# echo vs. printf
printf "A\n"
echo "B \n"
echo "C"

# Array
if [ -f $1 ];then
	nodes=`cat $1`
else
	nodes="$@"
fi

for node in $nodes 
do
	echo $node
done
