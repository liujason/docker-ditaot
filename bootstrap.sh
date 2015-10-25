#!/usr/bin/env bash

apt-get update
apt-get install -y default-jre
# ==============================================================================
# install nodejs
curl -O https://raw.githubusercontent.com/nodesource/distributions/master/deb/setup_4.x
chmod +x setup_4.x
./setup_4.x
apt-get install -y nodejs
npm install -g yo grunt-cli bower # dependencies needed to run `grunt serve`
apt-get install -y ruby-full # ruby needed to install sass
gem install sass # sass is needed for running grunt
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
#mkdir -p /mnt/data/mongo /mnt/logs
docker create -v /data/db --name mongodata ubuntu:14.04 /bin/true
docker run -d --volumes-from mongodata --name mongodb -p 27017:27017 mongo
# docker run -it --volumes-from mongodata -p 27017:27017 -u mongo --entrypoint "/bin/bash" mongo

# ==============================================================================
# build docker-redis
cd /vagrant/redis
docker build -t redis .
docker create -v /data/redis --name redisdata ubuntu:14.04 /bin/true
docker run -d --volumes-from redisdata --name redisdb -p 6379:6379 redis

# ==============================================================================
# Install phantomJS for testing
# https://gist.github.com/julionc/7476620#file-install_phantomjs-sh
cd ~
wget https://gist.githubusercontent.com/julionc/7476620/raw/e8f36f2a2d616720983e8556b49ec21780c96f0c/install_phantomjs.sh
chmod +x install_phantomjs.sh
./install_phantomjs.sh
export PHANTOMJS_BIN=/usr/local/bin/phantomjs
