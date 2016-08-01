FROM python:2-alpine
ADD docker-image/ .
CMD [ "python", "./voter.py" ]
