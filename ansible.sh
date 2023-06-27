#!/bin/bash

sudo apt-get update 
sudo apt-get upgrade -y
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
service ansible status
ansible --version

