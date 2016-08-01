import urllib2, os, thread, time, sys

try:
	# Construct URL:
	vote_url = os.environ['MY_HERO_URL'] + "/results?hero=" + os.environ['MY_HERO']
	# Thread count
	vote_threads = int(os.environ['MY_HERO_THREADS'])
except KeyError:
	print "You must set MY_HERO, MY_HERO_URL, MY_HERO_THREADS"
	exit(1)
except ValueError:
	print "MY_HERO_THREADS must be a number (e.g. 3)"
	exit(1)

def vote (url):
	while (True):
		urllib2.urlopen(url)

for i in range(0, (vote_threads - 1)):
	thread.start_new_thread(vote, (urllib2.quote(vote_url),))

while (True):
	time.sleep(100)

