#!/bin/bash
set -e

# Install & Configure GNS3
sudo apt update
sudo apt upgrade
sudo add-apt-repository ppa:gns3/ppa
sudo apt update
sudo apt-get install gns3-server gns3-gui
sudo dpkg --add-architecture i386
sudo apt update
sudo apt-get install gns3-iou

# Install & Configure Docker
sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker --now
sudo usermod -aG docker $USER
getent group docker
newgrp docker
