#!/bin/bash

# Update the system
sudo apt-get update -y

# Upgrade the system
sudo apt-get upgrade -y

#Installation snapd
sudo apt-get install snapd -y

#Installation microk8s (https://microk8s.io/docs/getting-started)
sudo snap install microk8s --classic --channel=1.27

#Configuration microk8s
sudo usermod -a -G microk8s vagrantUser
mkdir -p ~/.kube
sudo chown -f -R vagrantUser ~/.kube

#Installation Docker
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#SSH
sudo apt update
sudo apt-get install openssh-server -y
sudo systemctl restart ssh

#Installation Helm
su - vagrant -c "microk8s enable helm3"
