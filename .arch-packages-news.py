#!/usr/bin/env python
#-*- encoding: utf8 -*-

"""

This code is written to retrieve latest
Arch Linux package updates from its
original RSS feed.

Written by: Alper KANAT (tunix@raptiye.org)

"""

import urllib2
from xml.dom import minidom

def getPackageNames (address, lines):
	try:
		urllib2.socket.setdefaulttimeout = 3
		temp = urllib2.urlopen(address)
		xmldoc = minidom.parse(temp)
		temp.close()
		items = xmldoc.getElementsByTagName('item')
		for item in items[:lines]:
			title = item.getElementsByTagName('title')[0].firstChild.nodeValue
			print title,
	except urllib2.URLError:
		print "No Connection"

if __name__ == '__main__':
	getPackageNames('http://www.archlinux.org/feeds/packages/', 10)
