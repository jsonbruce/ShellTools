#!/bin/sh

ifconfig eth0 | grep inet | grep -v inet6 | awk '{print $2}' | tr -d "addr:"
