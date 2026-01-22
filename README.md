# joh-conf

This project contains my preferred development setup for MacOs. The configuration is done with ansible,
to make the setup immutable.

## Prerequisites
- Brew installed

## Installation

```sh
cd ~/
git clone https://github.com/johsim/joh-conf.git
./installation.sh
```

The shell script will install ansible and then run an ansible playbook for the rest of the setup.
The repo can currently only be cloned to the home directory.