#!/bin/bash
# Install ansible

# To test
# $ docker run --name ubuntu_xenial -v $(pwd):/workspace -w /workspace -id --rm ubuntu:xenial
# $ docker exec -it ubuntu_xenial /bin/bash

sudo apt -y update
sudo apt install -y python3-pip virtualenv
virtualenv default
pip3 install ansible
cd ansible/
sudo ansible-playbook host-configuration.yaml

# Setup cron job
# Example: https://github.com/ansible/ansible-examples/blob/master/language_features/ansible_pull.yml
