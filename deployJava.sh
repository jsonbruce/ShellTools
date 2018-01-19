#!/bin/bash

JDK_FILE=""
JDK_HOME="/usr/local/lib/java"
JAVA_HOME_NAME="JAVA_HOME"
SHELL_PROFILE="$HOME"/.zshrc

USAGE="
Usage: $0 [OPTIONS]

Deploy Java in Single Node.

-f     JDK File
-d     JDK Home
"

# Usage
if [ -z $1 ]; then
	printf "%s\\n" "$USAGE"
	exit 0
fi

printf "Welcome to Java Deploy\\n"

# Shell Profile Detect
if [ `echo $SHELL` = "/bin/bash" ]; then
	SHELL_PROFILE="$HOME"/.bashrc
elif [ `echo $SHELL` = "/usr/bin/zsh" ]; then
	SHELL_PROFILE="$HOME"/.zshrc
fi

echo "Shell Profile=$SHELL_PROFILE"


# 0. read args
while getopts "f:d:" arg
do
	case $arg in
		f)
			JDK_FILE=$OPTARG
			test ! -e $JDK_FILE && echo "Error: File $JDK_FILE do not exit!" && exit 0
			#echo "JDK File is: $OPTARG"
			;;
		d)
		    JDK_HOME=$OPTARG	
			#echo "JDK Home is: $OPTARG"
			;;
		?)
			echo "unknow arg"
			exit 1
			;;
	esac
done


# 1. untar
if [ ! -d $JDK_HOME ]; then
	sudo mkdir $JDK_HOME
else
	# Delete Older JDK Folder
	rm -rf $JDK_HOME/*
fi

tar -zxf $JDK_FILE -C $JDK_HOME


# 2. set environment in ~/.zshrc [/etc/profile or ~/.bashrc]
cd $JDK_HOME
for f in `pwd`/*
do
	if [ -d $f ]; then
		JAVA_HOME=$f
		break
	fi
done

echo "JAVA_HOME="$JAVA_HOME

if grep -q $JAVA_HOME_NAME $SHELL_PROFILE; then
	echo "Replace JAVA_HOME..."
	sed -i "s:^export ${JAVA_HOME_NAME}.*:export ${JAVA_HOME_NAME}=${JAVA_HOME}:" $SHELL_PROFILE
else
	echo "Init JAVA_HOME..."
	echo "export ${JAVA_HOME_NAME}=$JAVA_HOME" >> $SHELL_PROFILE
	echo 'export JRE_HOME=${JAVA_HOME}/jre'  >> $SHELL_PROFILE
	echo 'export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib' >> $SHELL_PROFILE
	echo 'export PATH=${JAVA_HOME}/bin:$PATH'  >> $SHELL_PROFILE
fi

source $SHELL_PROFILE


# 3. unset openJDK and Older JDK
update-alternatives --remove-all java
update-alternatives --remove-all javac
update-alternatives --remove-all jar
update-alternatives --remove-all javah
update-alternatives --remove-all javap

update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 1
update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 1
update-alternatives --install /usr/bin/jar jar $JAVA_HOME/bin/jar 1
update-alternatives --install /usr/bin/javah javah $JAVA_HOME/bin/javah 1
update-alternatives --install /usr/bin/javap javap $JAVA_HOME/bin/javap 1


# 4. complete
printf "Java Deploy Completed!\n\n"
