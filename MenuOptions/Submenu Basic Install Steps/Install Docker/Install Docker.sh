#!/bin/bash

# install_docker () {
#   sudo apt-get remove docker docker-engine docker.io containerd runc
#   sudo apt-get update
#   sudo apt-get install ca-certificates curl gnupg lsb-release
#   sudo rm /usr/share/keyrings/docker-archive-keyring.gpg
#   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
#   echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#   sudo apt-get update
#   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
#   sudo groupadd docker
#   sudo usermod -aG docker $USER 
# }

create_docker_network () {
  read -p "Choose the name for your custome docker network (ex. ibranet) : " customnetwork
  customnetwork=${customnetwork:-ibranet}
  sed -i "s/^dockernet=.*$/dockernet=$customnetwork/" /opt/ibracorp/ibramenu/.profile

  docker network create $customnetwork > /dev/null 2>&1
}
 install_docker () {
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt update -y
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
 }
make_user_docker () {
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
}

install_docker
make_user_docker
#create_docker_network
