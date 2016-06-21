# Wicked Voter
This is proof of concept code to cause massive votes for Star Lord in Hank Preston's ["My Hero"](https://github.com/hpreston/myhero_demo/) app.

It comprises of two parts:

1. ```docker-image``` - a docker file with a small piece of python code
2. ```mantl-service``` - basic mantl service and shell script to deploy

It is designed as a proof of concept to show microservices, not as a malicious death rays from space destroyer.

Have fun!

## Docker Image
This comrpises of ```voter.py``` a small multi-threaded python app which takes a single CLI argument (the hero you wish to vote for). For this to be any use in future that argument should really be passed by Mantl and not statically in the container.

It only launches 4 threads which is more than sufficient to cause lots of votes, especially when scaled up to 50 or so instances ;-)

## Mantl Service
This is a simple [DCOS](https://github.com/mesosphere/universe) service file defining the vote and a small shell script to help you deploy it.

If you clone this you should change the docker container location to something you have customised.
