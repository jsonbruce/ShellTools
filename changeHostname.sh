#!/bin/bash

ip=`ifconfig eth0 | grep inet | grep -v inet6 | awk '{print $2}' | tr -d "addr:"`
rack=`echo $ip | cut -d"." -f3`
server=`echo $ip | cut -d"." -f4`

nodename="node"${rack}"-"${server}
oldname=`hostname`

echo $nodename > /etc/hostname
#sed -i "s/^127\.0.*$oldname$/$ip       $nodename/" /etc/hosts
sed -i -e "s/^127\.0.*$oldname$/#&/" /etc/hosts
