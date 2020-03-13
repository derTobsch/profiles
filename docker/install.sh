#!/bin/bash

echo "/> Docker and K8s"
echo "> Installing Docker..."

sudo apt update
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt install docker-ce
echo "> Docker installed"


echo "> Installing Docker-Compose..."
# get latest version
LATEST=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/docker/compose/releases/latest)
VERSION=$(echo $LATEST | sed 's:.*/::')
echo ">> Latest Docker-Compose version is $VERSION"

sudo curl -L "https://github.com/docker/compose/releases/download/$VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
echo "> Docker-Compose installed"

sudo snap install kubectl --classic
echo "> K8s installed"
