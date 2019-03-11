FROM ubuntu:16.04

MAINTAINER Mike Ivanov mivanov@edgegravity.ericsson.com

ENV pip_packages "ansible"

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       python-setuptools \
       python-pip \
       openssh-client \
       software-properties-common \
       rsyslog systemd systemd-cron sudo \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean
RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf

# Install Ansible via Pip.
RUN pip install $pip_packages
