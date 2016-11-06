#!/bin/bash
IPDETECT=`ip addr show eno1 | grep inet | grep -v inet6 | awk '{print $2}'`
echo ${IPDETECT%/*}
