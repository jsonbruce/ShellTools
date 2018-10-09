#########################################################################
# --------->    FILE: msdi_auth.py
# --------->    AUTHOR: Max Xu
# --------->    MAIL: xuhuan@live.cn
# --------->    DATE: 08/07/2018    TIME:10:13:16
#########################################################################

#!/usr/bin/env python
# coding=utf-8

# msdi_auth.py
# Auto Portal Auth tool in MSDI.
#
# Usage: python3 msdi_auth.py
#
# v1.1.0  2018.09.10  Retrive deviceid automatically.
# v1.0.0  2018.08.07  Portal Auth success for Single Accout in Single Device


import os
import sys
import json
import requests

os.environ['no_proxy'] = "10.219.2.25"

# Config
user_name = "MDI4OTI:"
password = "eHVodWFuMTk5Mg::"
deviceid = "96328"
tokenkey = "27e7f032037670502c818d9d7bfde1a9"

# Endpoint
url = "http://10.219.2.25/a/ajax.php"

params0 = {'tradecode': 'getdeviceinfoprocess',
          'gettype': 'ipgetmac'} 
params1 = {'tradecode': 'net_auth',
          'type': 'User',
          'NewMobile': 1} 
params2 = {"tradecode": "mobileresult"}

data0 = {'newMobile': 1,
        'is_guest': 0,
        'os_platform': 'Linux',
        'browser': 'Chrome/69.0.349',
        'UrlAscid': '',
        'UrlAswid': '',
        'wechatid': 0}
data1 = {'user_name': user_name,
        'password': password,
	'deviceid': deviceid, 
	'saveuserpass': '1',
	'tokenkey': tokenkey}
data2 = {'deviceid': deviceid,
	'itemsid': '',
	'checkres': '',
	'is_safecheck': '0',
	'roleid': '1',
	'LastAuthID': '0',
	'firsturl': '',
	'ascid': '',
	'tbclientip4': '',
	'IsPhoneClient': '0'}

headers = {"Content-Type": "application/x-www-form-urlencoded",
           "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36"}


def check():
    try:
        r = requests.get("https://httpbin.org", timeout=5)
        if r.ok:
            return True
        else:
            return False
    except Exception as e:
        return False
    return False


def auth():
    global deviceid
    global data1
    global data2

    # 1. Get DeviceID
    response0 = requests.post(url, data0, params=params0, headers=headers)
    if response0.ok:
        d = response0.text.strip("'<>() _res=").replace('\'', '\"').replace("Boolean(false)", '"Boolean(false)"').replace("Boolean(true)", '"Boolean(true)"')
        d = json.loads(d)
        deviceid = d["DeviceID"]
        print("DeviceID=", deviceid)
    else:
        print("MSDI Authenticated Failed!")
        return

    data1["deviceid"] = deviceid
    data2["deviceid"] = deviceid

    # 2. Auth
    response1 = requests.post(url, data1, params=params1, headers=headers)

    # 3. Submit
    response2 = requests.post(url, data2, params=params2, headers=headers)
    if response1.ok and response2.ok:
        print("MSDI Network Authenticated!")
    else:
        print("MSDI Authenticated Failed!")


def main(args):
    if not check():
        auth()


if __name__ == "__main__":
    main(sys.argv[1:])
