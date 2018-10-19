#!/usr/bin/env bash

# https://gist.github.com/wdullaer/f1af16bd7e970389bad3

# Ask for the user password
# Script only works if sudo caches the password for a few minutes
sudo true

# Add docker to USER to allow non-sudo docker-compose up
sudo groupadd docker
sudo gpasswd -a $USER docker

# Install docker
wget -qO- https://get.docker.com/ | sh

# Install docker-compose
COMPOSE_VERSION=`git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oP "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | tail -n 1`
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

# Install docker-machine
MACHINE_VERSION=`git ls-remote https://github.com/docker/machine | grep refs/tags | grep -oP "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | tail -n 1`
curl -L https://github.com/docker/machine/releases/download/v${MACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine