#!/bin/bash

JDK_FILE=""
JDK_HOME=/usr/lib/java

if [ -z $1 ]; then
	echo -e "Usage: deployJava -f jdkfile -d jdkhome"
	exit 0
else
	echo $0 $*
fi

# read args
while getopts "f:d:" arg
do
	case $arg in
		f)
			JDK_FILE=$OPTARG
			test ! -e $JDK_FILE && echo "Error: File $JDK_FILE do not exit!" && exit 0
			echo "f's arg: $OPTARG"
			;;
		d)
		    JDK_HOME=$OPTARG	
			if [ ! -d $JDK_HOME ]; then
				sudo mkdir $JDK_HOME
			fi
			echo "d's arg: $OPTARG"
			;;
		?)
			echo "unknow arg"
			exit 1
			;;
	esac
done

# echo $JDK_FILE ----- $JDK_HOME

# 1. untar
tar -zxvf $JDK_FILE -C $JDK_HOME

#2. set environment in /etc/profile or ~/.bashrc
cd $JDK_HOME
for f in `pwd`/*
do
	if [ -d $f ]; then
		JAVA_HOME=$f
		break
	fi
done

echo "JAVA_HOME=" $JAVA_HOME

echo export JAVA_HOME=$JAVA_HOME >> ~/.bashrc
echo 'export JRE_HOME=${JAVA_HOME}/jre'  >> ~/.bashrc
echo 'export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib' >> ~/.bashrc
echo 'export PATH=${JAVA_HOME}/bin:$PATH'  >> ~/.bashrc
source ~/.bashrc

# 3. unset openJDK

update-alternatives --remove-all java
update-alternatives --remove-all javac
update-alternatives --remove-all jar
update-alternatives --remove-all javah
update-alternatives --remove-all javap


update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 300
update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 300
update-alternatives --install /usr/bin/jar jar $JAVA_HOME/bin/jar 300
update-alternatives --install /usr/bin/javah javah $JAVA_HOME/bin/javah 300
update-alternatives --install /usr/bin/javap javap $JAVA_HOME/bin/javap 300

update-alternatives --config java

# 4. complete
echo "Deploy Completed!"
