#!/bin/bash

CURRENTPATH=$(dirname "$0")

# Set default terminal to terminator
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'

git config --global core.excludesfile '~/.gitignore_global'

# Git diff to cat
git config --global core.pager cat

echo -n "Enter email and press [ENTER]: "
read email

git config --global user.email $email

# Kdiff3 as mergetool
git config --global --add merge.tool kdiff3
git config --global --add mergetool.kdiff3.path "$(which kdiff3)"
git config --global --add mergetool.kdiff3.trustExitCode false
git config --global mergetool.keepBackup false

git config --global --add diff.guitool kdiff3
git config --global --add difftool.kdiff3.path "$(which kdiff3)"
git config --global --add difftool.kdiff3.trustExitCode false


# Link .zshrc
rm ~/.zshrc
ln -s ~/joh-conf/conf/.zshrc ~/

echo "Reboot to activate zsh"
