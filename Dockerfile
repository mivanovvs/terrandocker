FROM ubuntu:latest

MAINTAINER Mike Ivanov mivanov@edgegravity.ericsson.com


RUN apt update && \
    \
    \
    apt install openssh-client ansible python3 py3-pip openssl ca-certificates  && \
    apt-install build-dependencies \
                python3-dev libffi-dev openssl-dev build-base  && \
    pip3 install --upgrade pip cffi                            && \
    \
    pip3 install ansible==2.7.5  && \
    \
    \
    apt install wget unzip  && \
    \
    \
    export VER="0.11.11" && wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip && \
    unzip terraform_${VER}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ &&\
    \
    \
    apt remove build-dependencies            && \
    rm -rf /var/cache/apt/*
