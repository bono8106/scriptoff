#!/usr/bin/python

import urllib2
import json

for n in range(11):
	contents = urllib2.urlopen("https://api.github.com/legacy/repos/search/:java?language=java&start_page=%s" % n).read()

	j = json.loads(contents)

	for item in j['repositories']:
		print item['url']
