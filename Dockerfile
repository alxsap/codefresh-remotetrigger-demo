FROM ubuntu:latest

COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

ENTRYPOINT remoteTrigger.sh