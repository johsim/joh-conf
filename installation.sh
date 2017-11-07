#!/bin/bash
# Install ansible

# To test
# $ cd ~/joh-conf
# $ docker build -t ubuntutest:xenial
# $ docker run -v $(pwd):/home/test --name utest ubuntutest:xenial
# $ docker exec -it utest /bin/bash

sudo apt -y update
sudo apt install -y python3-pip virtualenv
virtualenv -p python3 default
source default/bin/activate
pip3 install ansible
cd ansible/
ansible-playbook host-configuration.yaml

# Setup cron job
# Example: https://github.com/ansible/ansible-examples/blob/master/language_features/ansible_pull.yml
