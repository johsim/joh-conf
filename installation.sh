#!/bin/bash
# Install ansible to run ansible playbook

sudo apt -y update
sudo apt install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt -y update
sudo apt install -y ansible

versions=$(cat ansible/group_vars/all.yaml)

msg="""The current versions will be installed:
$versions
Is this correct? (y/n)"""

read -p " > $msg " yn
case $yn in
  [Yy]* ) ;;
  * ) echo "Change versions in ansible/group_vars/all.yaml" && exit 1;;
esac

cd ansible/
ansible-playbook host-configuration.yaml --ask-become-pass
