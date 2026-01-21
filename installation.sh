#!/bin/bash
# Install ansible to run ansible playbook
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required but not found. Please install Homebrew from https://brew.sh first."
  exit 1
fi

brew update
brew install ansible

cd ansible/
ansible-playbook host-configuration.yaml --ask-become-pass
