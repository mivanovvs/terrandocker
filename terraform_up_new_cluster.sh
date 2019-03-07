#!/usr/bin/env bash

MOUNTS="-v $PWD/temp:/tmp/temp -v $PWD/egp-envs/:/egp-envs -v $PWD/egp-devops/:/egp-devops"


docker run -it $MOUNTS -w /tmp/temp terrandocker:latest terraform $@
