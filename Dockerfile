FROM alpine:latest

MAINTAINER Mike Ivanov mivanov@edgegravity.ericsson.com


RUN apk --update add sudo                                     && \
    \
    \
    apk --update add openssh-client ansible python3 py3-pip openssl ca-certificates  && \
    apk --update add --virtual build-dependencies \
                python3-dev libffi-dev openssl-dev build-base  && \
    pip3 install --upgrade pip cffi                            && \
    \
    \
    \
    \
    apk --update add wget unzip  && \
    \
    \
    export VER="0.11.11" && wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip && \
    unzip terraform_${VER}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ &&\
    \
    \
    apk del build-dependencies            && \
    rm -rf /var/cache/apk/*
