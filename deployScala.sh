#!/bin/bash

SCALA_FILE=""
SCALA_HOME=/usr/lib/scala
SCALA_HOME_NAME="SCALA_HOME"
SHELL_PROFILE=~/.zshrc

# Usage
if [ -z $1 ]; then
	echo -e "Usage: deployScala -f scalafile -d scalahome"
	exit 0
else
	echo $0 $*
fi

# 0. read args
while getopts "f:d:" arg
do
	case $arg in
		f)
			SCALA_FILE=$OPTARG
			test ! -e $SCALA_FILE && echo "Error: File $SCALA_FILE do not exit!" && exit 0
			echo "f's arg: $OPTARG"
			;;
		d)
		    SCALA_HOME=$OPTARG	
			if [ ! -d $SCALA_HOME ]; then
				sudo mkdir $SCALA_HOME
			fi
			echo "d's arg: $OPTARG"
			;;
		?)
			echo "unknow arg"
			exit 1
			;;
	esac
done


# 1. untar

# 1. untar
if [ ! -d $SCALA_HOME ]; then
	sudo mkdir $SCALA_HOME
else
	# Delete Older Scala Folder
	rm -rf $SCALA_HOME/*
fi

tar -zxvf $SCALA_FILE -C $SCALA_HOME


# 2. set environment in ~/.zshrc [/etc/profile or ~/.bashrc]
cd $SCALA_HOME
for f in `pwd`/*
do
	if [ -d $f ]; then
		SCALA_HOME=$f
		break
	fi
done

echo "SCALA_HOME=" $SCALA_HOME

if [ -z `grep -q $SCALA_HOME_NAME $SHELL_PROFILE` ]; then
	echo "Replace SCALA_HOME..."
	sed -i "s:^export ${SCALA_HOME_NAME}.*:export ${SCALA_HOME_NAME}=${SCALA_HOME}:" $SHELL_PROFILE
else
	echo "Init SCALA_HOME..."
	echo export SCALA_HOME=$SCALA_HOME >> $SHELL_PROFILE
	echo 'export PATH=${SCALA_HOME}/bin:$PATH'  >> $SHELL_PROFILE
fi

source $SHELL_PROFILE


# 3. unset Older Scala 
update-alternatives --remove-all scala
update-alternatives --remove-all scalac
update-alternatives --remove-all scalap
update-alternatives --remove-all scaladoc 

update-alternatives --install /usr/bin/scala scala $SCALA_HOME/bin/scala 1
update-alternatives --install /usr/bin/scalac scalac $SCALA_HOME/bin/scalac 1
update-alternatives --install /usr/bin/scalap scalap $SCALA_HOME/bin/scalap 1
update-alternatives --install /usr/bin/scaladoc scaladoc $SCALA_HOME/bin/scaladoc 1


# 4. complete
echo "Scala Deploy Completed!"
