FROM ubuntu:latest

RUN apt-get -y upgrade & apt-get -y install curl

COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

RUN chmod +x remoteTrigger.sh

ENTRYPOINT remoteTrigger.sh
