#!/bin/bash

ip=`ifconfig eth0 | grep inet | grep -v inet6 | awk '{print $2}' | tr -d "addr:"`
rack=`echo $ip | cut -d"." -f3`
server=`echo $ip | cut -d"." -f4`

nodename="node"${rack}"-"${server}

echo $nodename > /etc/hostname
sed -i "s/^127.0.1.1.*$/127.0.1.1       ${hostname}/" /etc/hosts
