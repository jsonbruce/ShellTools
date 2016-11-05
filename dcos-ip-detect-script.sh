#!/bin/bash
IPDETECT=`ip addr show eno2 | grep inet | grep -v inet6 | awk '{print $2}'"`
echo "$IPDETECT"
