## Deploy k8s with Terraform and Ansible

Pre-requisities
-------------

* Docker installed

Clone EGP repos to working dir(example ~/work)

``git clone git@github.com:VidScale/egp-devops.git
  git clone git@github.com:VidScale/egp-envs.git``

Build docker
-------------

Build docker image

``docker build -t terrandocker .``

Spin up new nodes for  k8s cluster
--------
Run bash script and define working dir with EGP repos
For example, ~/work

``bash terraform_up_new_cluster.sh ~/work``

TODO
--------

* Different layers in Docker for Terraform, Ansible, Kubectl
* Terraform copy bin file instead of wget
