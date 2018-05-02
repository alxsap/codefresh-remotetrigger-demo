FROM ubuntu:latest

COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

RUN chmod +x /usr/src/myapp/remoteTrigger.sh

ENTRYPOINT /usr/src/myapp/remoteTrigger.sh
