#!/usr/bin/env python
#-*- encoding: utf8 -*-

"""

This code is written to retrieve latest
Arch Linux package updates from its
original RSS feed.

Written by: Alper KANAT (tunix@raptiye.org)

"""

from urllib import request
from xml.dom import minidom

def getPackageNames(url, limit):
    try:
        with request.urlopen(url, timeout=3) as updates:
            xmlSource = "".join([tmp.decode("utf-8") for tmp in updates.readlines()])
            xmlObject = minidom.parseString(xmlSource)
            xmlPackageNodes = xmlObject.getElementsByTagName("item")[:limit]
            for package in xmlPackageNodes:
                print(package.getElementsByTagName("title")[0].firstChild.nodeValue, end="")
    except urllib.error.HTTPError:
        print("No Connection", end="")
    except urllib.error.URLError:
        print("No Connection", end="")

if __name__ == '__main__':
	getPackageNames('http://www.archlinux.org/feeds/packages/', 10)

