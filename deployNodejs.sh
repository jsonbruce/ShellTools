#!/bin/bash


#########################################################################
#   Copyright (C) 2018 All rights reserved.
#   
#   FILE: deployNodejs.sh
#   AUTHOR: Max Xu
#   MAIL: xuhuan@live.cn
#   DATE: 11/28/2018    TIME:22:23:02
#
#########################################################################

NODEJS_FILE=""
NODEJS_HOME="/usr/local/lib/nodejs"
NODEJS_HOME_NAME="NODEJS_HOME"
SHELL_PROFILE="$HOME"/.zshrc

USAGE="
Usage: $0 [OPTIONS]

Deploy Nodejs in Single Node.

-f     Nodejs File
-d     Nodejs Home (Default to /usr/local/lib/nodejs)
"

# Usage
if [ -z $1 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi


printf "Welcome to Nodejs Deploy!\\n"
if [ -z $3 ]; then
	printf "Default install to $NODEJS_HOME [ENTER or Input] "
	read value
	if [ "$value"x = ""x ]; then
		NODEJS_HOME=$NODEJS_HOME
	else
		NODEJS_HOME=$value
	fi
fi


# Shell Profile Detect
if [ `echo $SHELL` = "/bin/bash" ]; then
	SHELL_PROFILE="$HOME"/.bashrc
elif [ `echo $SHELL` = "/usr/bin/zsh" ]; then
	SHELL_PROFILE="$HOME"/.zshrc
fi

echo -e "Shell Profile=$SHELL_PROFILE"


# 0. read args
while getopts "f:d:" arg
do
	case $arg in
		f)
			NODEJS_FILE=$OPTARG
			test ! -e $NODEJS_FILE && echo "Error: File $NODEJS_FILE do not exit!" && exit 0
			;;
		d)
		    NODEJS_HOME=$OPTARG	
			;;
		?)
			echo "unknow arg"
			exit 1
			;;
	esac
done


# 1. untar
if [ ! -d $NODEJS_HOME ]; then
	sudo mkdir $NODEJS_HOME
    sudo chown -R $(id -u):$(id -g) $NODEJS_HOME
else
	# Delete Older JDK Folder
	rm -rf $NODEJS_HOME/*
fi

tar -xf $NODEJS_FILE -C $NODEJS_HOME


# 2. set environment in ~/.zshrc [/etc/profile or ~/.bashrc]
cd $NODEJS_HOME
for f in `pwd`/*
do
	if [ -d $f ]; then
		NODEJS_HOME=$f
		break
	fi
done

mv $NODEJS_HOME ${NODEJS_HOME%-linux*}
NODEJS_HOME=${NODEJS_HOME%-linux*}
echo "NODEJS_HOME="$NODEJS_HOME

if grep -q $NODEJS_HOME_NAME $SHELL_PROFILE; then
	echo "Replace NODEJS_HOME..."
	sed -i "s:^export ${NODEJS_HOME_NAME}.*:export ${NODEJS_HOME_NAME}=${NODEJS_HOME}:" $SHELL_PROFILE
else
	echo "Init NODEJS_HOME..."
	echo "export ${NODEJS_HOME_NAME}=$NODEJS_HOME" >> $SHELL_PROFILE
	echo 'export PATH=${NODEJS_HOME}/bin:$PATH'  >> $SHELL_PROFILE
fi

source $SHELL_PROFILE


# 3. unset openJDK and Older JDK
update-alternatives --remove-all node
update-alternatives --remove-all npm

update-alternatives --install /usr/local/bin/node node $NODEJS_HOME/bin/node 1
update-alternatives --install /usr/local/bin/npm npm $NODEJS_HOME/bin/npm 1


# 4. complete
printf "Nodejs Deploy Completed!\n\n"