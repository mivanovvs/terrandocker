FROM ubuntu:16.04

MAINTAINER Mike Ivanov mivanov@edgegravity.ericsson.com

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip \
  && pip3 install ansible==2.7.5 \
