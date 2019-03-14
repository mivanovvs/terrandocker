FROM ubuntu:16.04

MAINTAINER Mike Ivanov mivanov@edgegravity.ericsson.com

ENV pip_packages "ansible==2.7.5 netaddr jinja2>=2.9.6 pbr>=1.6 hvac cryptography==2.4.2"

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       openssh-client \
       unzip \
       wget \
       python-setuptools \
       python-pip \
       software-properties-common \
       curl \
       sudo \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean \
    && export VER="0.11.11" && wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip \
    && unzip terraform_${VER}_linux_amd64.zip \
    && mv terraform /usr/local/bin/

# Install Ansible via Pip
RUN pip install $pip_packages

# Install Helm

ENV HELM_VERSION v2.4.0
ENV HELM_FILENAME helm-${HELM_VERSION}-linux-amd64.tar.gz
ENV HELM_URL https://storage.googleapis.com/kubernetes-helm/${HELM_FILENAME}

RUN echo $HELM_URL

RUN curl -o /tmp/$HELM_FILENAME ${HELM_URL} \
  && tar -zxvf /tmp/${HELM_FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && rm -rf /tmp

# Install Kubectl

ENV KUBECTL_URL=https://storage.googleapis.com/kubernetes-release/release/stable.txt

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s ${KUBECTL_URL})/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin 
