#!/usr/bin/env bash

apt-get update
apt-get install -y default-jre

# install docker (only when not installed)
if ! hash docker 2>/dev/null; then
  curl -sSL https://get.docker.com/ | sh
  # add vagrant user to docker group to run docker
  usermod -aG docker vagrant
fi
# install dita ot 2.1.1
curl -sSL https://github.com/dita-ot/dita-ot/releases/download/2.1.1/dita-ot-2.1.1.tar.gz \
  | tar -xzC /home/vagrant/

# build docker using tag "ot"
cd /vagrant/dita-ot
docker build -t ot .
docker run ot #this should display help
