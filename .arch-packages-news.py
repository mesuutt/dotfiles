#!/usr/bin/env python
#-*- encoding: utf8 -*-

"""

This code is written to retrieve latest
Arch Linux package updates from its
original RSS feed.

Written by: Alper KANAT (tunix@raptiye.org)

"""

from urllib2 import urlopen
from urllib2 import URLError
from xml.dom import minidom

BOLD = u'\033[1m'
NOBOLD = u'\033[0;0m'

def getHeaders(url, limit):
    try:
        updates = urlopen(url, timeout=3)
        xmlSource = "".join([tmp for tmp in updates.readlines()])
        xmlObject = minidom.parseString(xmlSource)
        xmlNewsNodes = xmlObject.getElementsByTagName("item")[:limit]
        for n in xmlNewsNodes:
            print(n.getElementsByTagName("title")[0].firstChild.nodeValue)
    except URLError:
        print("No Connection")
    except URLError:
        print("No Connection")

def getPackageNames(url, limit):
    try:
        updates = urlopen(url, timeout=3)
        xmlSource = "".join([tmp.decode("utf-8") for tmp in updates.readlines()])
        xmlObject = minidom.parseString(xmlSource)
        xmlPackageNodes = xmlObject.getElementsByTagName("item")[:limit]
        for package in xmlPackageNodes:
            print(package.getElementsByTagName("title")[0].firstChild.nodeValue)
    except URLError:
        print("No Connection")
    except URLError:
        print("No Connection")

if __name__ == '__main__':
    print(u'%sArch Linux Latest News%s\n' % (BOLD, NOBOLD))
    getHeaders('http://www.archlinux.org/feeds/news/', 10)
    print(u'\n\n%sArch Linux Package Updates%s\n' % (BOLD, NOBOLD))
    getPackageNames('http://www.archlinux.org/feeds/packages/', 10)

