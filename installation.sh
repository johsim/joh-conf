#!/bin/bash
# Install ansible

# To test
# $ cd ~/joh-conf
# $ docker build -t ubuntutest:xenial
# $ docker run -v $(pwd):/home/test --name utest ubuntutest:xenial
# $ docker exec -it utest /bin/bash

# Don't use pip3 for ansible
sudo apt -y update
sudo apt install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt -y update
sudo apt install -y ansible
cd ansible/
ansible-playbook host-configuration.yaml

# Setup cron job
# Example: https://github.com/ansible/ansible-examples/blob/master/language_features/ansible_pull.yml
