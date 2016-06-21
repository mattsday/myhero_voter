import urllib2
import thread
import time
import sys

my_hero = sys.argv[1]
base_url = "http://myhero-web.metacloud.mrsmiggins.net/results?hero="

def vote (name):
	url = base_url + name
	while (True):
		urllib2.urlopen(url)

for i in range(0, 3):
	thread.start_new_thread(vote, (urllib2.quote(my_hero),))

while (True):
	time.sleep(100)

