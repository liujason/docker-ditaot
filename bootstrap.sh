#!/usr/bin/env bash

apt-get update
apt-get install -y default-jdk

# install docker
curl -sSL https://get.docker.com/ | sh
# add vagrant user to docker group to run docker
usermod -aG docker vagrant

# install dita ot 2.1.1
curl -SL https://github.com/dita-ot/dita-ot/releases/download/2.1.1/dita-ot-2.1.1.tar.gz \
  | tar -xzC /home/vagrant/
