#!/bin/bash
# Install ansible to run ansible playbook

sudo apt -y update
sudo apt install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt -y update
sudo apt install -y ansible

cd ansible/
ansible-playbook host-configuration.yaml --ask-become-pass
