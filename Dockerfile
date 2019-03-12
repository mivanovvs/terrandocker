FROM ubuntu:16.04

MAINTAINER Mike Ivanov mivanov@edgegravity.ericsson.com

ENV pip_packages "ansible==2.7.5 netaddr jinja2>=2.9.6 pbr>=1.6 hvac cryptography==2.4.2"

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       python-setuptools \
       python-pip \
       software-properties-common \
       sudo \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Install Ansible via Pip.
RUN pip install $pip_packages
