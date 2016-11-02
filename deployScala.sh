#!/bin/bash

SCALA_FILE=""
SCALA_HOME=/usr/lib/scala

if [ -z $1 ]; then
	echo -e "Usage: deployScala -f scalafile -d scalahome"
	exit 0
else
	echo $0 $*
fi

# read args
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

# echo $SCALA_FILE ----- $SCALA_HOME

# 1. untar
tar -zxvf $SCALA_FILE -C $SCALA_HOME

#2. set environment in /etc/profile or ~/.bashrc
cd $SCALA_HOME
for f in `pwd`/*
do
	if [ -d $f ]; then
		SCALA_HOME=$f
		break
	fi
done

echo "SCALA_HOME=" $SCALA_HOME

echo export SCALA_HOME=$SCALA_HOME >> ~/.bashrc
echo 'export PATH=${SCALA_HOME}/bin:$PATH'  >> ~/.bashrc
source ~/.bashrc

# 3. set to /usr/bin
update-alternatives --install /usr/bin/scala scala $SCALA_HOME/bin/scala 300
update-alternatives --install /usr/bin/scalac scalac $SCALA_HOME/bin/scalac 300
update-alternatives --install /usr/bin/scalap scalap $SCALA_HOME/bin/scalap 300
update-alternatives --install /usr/bin/scaladoc scaladoc $SCALA_HOME/bin/scaladoc 300

update-alternatives --config scala


# 4. complete
echo "Deploy Completed!"
