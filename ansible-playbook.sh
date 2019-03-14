#!/usr/bin/env bash

MOUNTS="-v $PWD/temp:/tmp/temp -v $PWD/egp-envs/:/egp-envs -v $PWD/egp-devops/:/egp-devops -v $PWD/ssh_keys:/ssh -v $PWD/egp-devops/platform/system/ansible/ansible.cfg:/etc/ansible/ansible.cfg"

#docker run -it $MOUNTS -w /tmp/temp rm.cdx-dev.unifieddeliverynetwork.net/terr-ansible-test/terransible cat /etc/ansible/ansible.cfg

docker run -it $MOUNTS -w /tmp/temp rm.cdx-dev.unifieddeliverynetwork.net/terr-ansible-test/terransible ansible-playbook $@
