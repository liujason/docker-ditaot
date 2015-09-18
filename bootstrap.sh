#!/usr/bin/env bash

apt-get update
apt-get install -y default-jdk

# install docker
curl -sSL https://get.docker.com/ | sh
# add vagrant user to docker group to run docker
usermod -aG docker vagrant
