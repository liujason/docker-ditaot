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

# create ditahs temp
mkdir /tmp/ditahs

# THE FOLLOWING ISN'T WORKING
# vagrant@vagrant-ubuntu-trusty-64:/vagrant/temp/authoring$ docker run -v /vagrant/temp/authoring:/tmp/ot/input:ro -v /vagrant/temp/output:/tmp/ot/output ot -i /tmp/ot/input -o /tmp/ot/output -f html5
# Error: [DOTA069F][FATAL] Input file '/tmp/ot/input' cannot be located or read. Ensure that file was specified properly and that you have permission to access it.
