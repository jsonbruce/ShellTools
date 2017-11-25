#########################################################################
# --------->    FILE: update-hosts.py
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 10/26/2017    TIME:18:00:55
#########################################################################

#!/usr/bin/env python
# coding=utf-8

import os
import sys
import requests
import urllib.request
from shutil import copyfile


def main(args):
    hosts = "/etc/hosts"
    hosts_bak = "/etc/hosts.bak"
    copyfile(hosts, hosts_bak)

    is_update_available = False
    
    with open(hosts, "r") as fp:
        hosts_lines = fp.readlines()

        # Ipv4 Update
        ipv4_url = "https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts"

        ipv4_start = hosts_lines.index("# IPv4_HOSTS_START\n")
        ipv4_end = hosts_lines.index("# IPv4_HOSTS_END\n")

        ## Check Version
        urllib.request.urlretrieve(ipv4_url, "ipv4")
        with open("ipv4") as f:
            ipv4_lines = f.readlines()

        old_version_ipv4 = hosts_lines[ipv4_start + 3][len("# Last updated: "):]
        new_version_ipv4 = ipv4_lines[2][len("# Last updated: "):]

        if old_version_ipv4 != new_version_ipv4:
            hosts_lines[ipv4_start + 1:ipv4_end] = ipv4_lines
            is_update_available = True

        # IPv6 Update
        ipv6_url = "https://github.com/lennylxx/ipv6-hosts/raw/master/hosts"

        ipv6_start = hosts_lines.index("# IPv6_HOSTS_START\n")
        ipv6_end = hosts_lines.index("# IPv6_HOSTS_END\n")

        ## Check Version
        urllib.request.urlretrieve(ipv6_url, "ipv6")
        with open("ipv6") as f:
            ipv6_lines = f.readlines()

        old_version_ipv6 = hosts_lines[ipv6_start + 12][len("## |         Update : "):]
        new_version_ipv6 = ipv6_lines[11][len("## |         Update : "):]

        if old_version_ipv6 != new_version_ipv6:
            hosts_lines[ipv6_start + 1:ipv6_end] = ipv6_lines
            is_update_available = True


    if is_update_available:
        with open(hosts, "w") as fp:
            fp.writelines(hosts_lines)
            print("Hosts Updated Success!")
    else:
        print("Hosts not Updated.")

    os.remove("ipv4")
    os.remove("ipv6")




if __name__ == "__main__":
    main(sys.argv[1:])
