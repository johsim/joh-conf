#!/bin/bash
echo "Running ansible host configuration..."

current_branch=$(git rev-parse --abbrev-ref HEAD)
if [[ $current_branch == 'master' ]]
then
    cd ../ansible
    ansible-playbook host-configuration.yaml -e user=$1
else
    echo "Git branch not master, aborting..."
fi
