FROM alpine:latest

MAINTAINER Mike Ivanov mivanov@edgegravity.ericsson.com


RUN apk --update add sudo \
    \
    \
    && apk --update add python3 py3-pip openssl py3-ipaddr ca-certificates \
    && apk --update add --virtual build-dependencies python3-dev py3-netaddr libffi-dev openssl-dev build-base \
    && pip3 install --upgrade pip cffi  \
    \
    \
    && pip3 install ansible==2.7.5 netaddr pbr>=1.6 jinja2>=2.9.6 hvac \
    && pip3 install netaddr  \
    \
    \
    && apk --update add wget unzip \
    \
    \
    && export VER="0.11.11" && wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip \
    && unzip terraform_${VER}_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    \
    \
    && apk del build-dependencies \
    && rm -rf /var/cache/apk/*
