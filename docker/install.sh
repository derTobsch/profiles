#!/bin/bash

echo "/> Docker and K8s"
echo "> Installing Docker..."

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg-agent \
     software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
echo "> Docker installed"


echo "> Installing Docker-Compose..."
sudo apt-get install docker-compose
echo "> Docker-Compose installed"

sudo snap install kubectl --classic
echo "> K8s installed"

echo "> Installing Docker-Compose..."
