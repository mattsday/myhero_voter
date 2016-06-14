import urllib2
import thread

def vote (name, url):
	url = base_url + name
	while (True):
		f =  urllib2.urlopen(url)



base_url = 'http://myhero-web.green.browndogtech.com/results?hero='

for i in range(0, 1000):
	thread.start_new_thread(vote, ("Robin", base_url, ) )


while (True):
	pass
