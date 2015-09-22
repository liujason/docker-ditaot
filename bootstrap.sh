#!/usr/bin/env bash

apt-get update
apt-get install -y default-jre
# ==============================================================================
# install nodejs
curl -O https://raw.githubusercontent.com/nodesource/distributions/master/deb/setup_4.x
chmod +x setup_4.x
./setup_4.x
apt-get install -y nodejs
npm install -g yo grunt-cli bower
# ==============================================================================
# install docker (only when not installed)
if ! hash docker 2>/dev/null; then
  curl -sSL https://get.docker.com/ | sh
  # add vagrant user to docker group to run docker
  usermod -aG docker vagrant
fi
# ==============================================================================
# install dita ot 2.1.1 on vagrant [optional]
# curl -sSL https://github.com/dita-ot/dita-ot/releases/download/2.1.1/dita-ot-2.1.1.tar.gz | tar -xzC /home/vagrant/

# ==============================================================================
# build docker using tag "ot"
# Windows doesn't support symlink, so the following dita-ot is just plain text
# cd /vagrant/dita-ot
cd /vagrant/dita-ot-2.1.1
docker build -t ot .
docker run ot #this should display OT help

# Sample ot command
# docker run \
# -v /vagrant/tests/input/DITA1.2-spec:/tmp/ot/input:ro \
# -v /vagrant/tests/output:/tmp/ot/output \
# ot \
# -i /tmp/ot/input/dita-1.2-specification.ditamap \
# -o /tmp/ot/output \
# -f html5

# ==============================================================================
# build docker-mongo
cd /vagrant/mongodb
docker build -t mongo .
mkdir -p /mnt/data/mongo /mnt/logs
docker run -d -v /mnt/data:/data -v /mnt/logs:/logs -p 27017:27017 mongo
