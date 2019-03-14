FROM ubuntu:16.04

MAINTAINER Mike Ivanov mivanov@edgegravity.ericsson.com

ENV pip_packages "ansible==2.7.5 netaddr jinja2>=2.9.6 pbr>=1.6 hvac cryptography==2.4.2"

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       openssh-client \
       unzip \
       wget \
       python-setuptools \
       python-pip \
       software-properties-common \
       sudo \
    && sudo snap install kubectl --classic \   
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean \
    && export VER="0.11.11" && wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip \
    && unzip terraform_${VER}_linux_amd64.zip \
    && mv terraform /usr/local/bin/

# Install Ansible via Pip.
RUN pip install $pip_packages
