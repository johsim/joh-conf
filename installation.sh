#!/bin/bash

CURRENTPATH=$(dirname "$0")

echo -n "Enter host name and press [ENTER]: "
read hostname

echo $hostname > ~/hostname

# Link terminator settings
mkdir -p ~/.config/terminator
ln -s ~/joh-conf/conf/terminator/config ~/.config/terminator/

# Emacs conf.
cp -p $CURRENTPATH/conf/init.el ~/.emacs.d/

# Set default terminal to terminator
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'

# Global gitignore
cp -p $CURRENTPATH/conf/.gitignore_global ~/
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
