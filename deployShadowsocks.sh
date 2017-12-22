#########################################################################
# --------->    FILE: deployShadowsocks.sh
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 12/17/2017    TIME:19:45:58
#########################################################################

#!/bin/bash

if [ -z $1 ];then
	echo "Usage: deployShadowsocks.sh password"
	exit 0

# 0. Read ss pass from args
SS_PASS=$1

# 1. Upgrade Kernel and Open BBR
if [ ! -f bbr.sh ];then
  wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh
fi


# 2. Upgrade
apt update && apt upgrade -y
apt autoremove -y && apt autoclean -y

# 3. DigitalOcean Agent for Monitoring
curl -sSL https://agent.digitalocean.com/install.sh | sh


# 4. Shadowsocks Server
apt install -y python-gevent python-pip python-m2crypto
export LC_ALL=C
pip install -U pip
pip install shadowsocks


# 5. Create /etc/shadowsocks.json
SS_CONF=/etc/shadowsocks.json
if [ ! -f $SS_CONF ];then
  touch $SS_CONF
fi

cat>$SS_CONF<<EOF
{
  "server":"::",
  "local_address":"127.0.0.1",
  "local_port":1080,
  "port_password":{
      "8381":"$SS_PASS",
      "8382":"$SS_PASS",
      "8383":"$SS_PASS",
      "8384":"$SS_PASS",
      "8385":"$SS_PASS",
      "8386":"$SS_PASS"
  },
  "timeout":300,
  "method":"aes-256-cfb",
  "fast_open":false
}
EOF


# 6. Optimization
cat>/etc/security/limits.conf<<EOF
* soft nofile 51200
* hard nofile 51200
EOF

ulimit -n 51200


# 7. Start Shadowsocks Server
ssserver -c /etc/shadowsocks.json -d start


# 8. Add to startup
echo "ssserver -c /etc/shadowsocks.json -d start" >> /etc/rc.local
