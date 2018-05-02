FROM ubuntu:latest

RUN echo invalidate image 1
RUN apt-get -y update
RUN apt-get -y install curl

COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

RUN chmod +x remoteTrigger.sh

ENTRYPOINT remoteTrigger.sh
