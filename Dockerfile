FROM alpine:latest

MAINTAINER Mike Ivanov mivanov@edgegravity.ericsson.com


RUN apk --update add sudo                                     && \
    \
    \
    apk --update add python py-pip openssl ca-certificates    && \
    apk --update add --virtual build-dependencies \
                python-dev libffi-dev openssl-dev build-base  && \
    pip install --upgrade pip cffi                            && \
    \
    \
    pip install ansible==2.7.5                && \
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
