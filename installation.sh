#!/bin/bash

# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

#nodejs
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

sudo apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade

sudo apt-get -y install emacs24 emacs24-el emacs24-common-non-dfsg terminator texlive autojump zsh tree python3-dev python3-pip npm python-pygments google-chrome-stable curl nodejs tig httpie kdiff3

pip3 install --user thefuck
sudo pip install virtualenv virtualenvwrapper

sudo npm install -g git-standup
sudo npm install -g tiny-care-terminal

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

# Oh my zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

ZSH_CUSTOM=$CURRENTPATH/conf/zsh_custom

# Zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Link .zshrc
rm ~/.zshrc
ln -s ~/joh-conf/conf/.zshrc ~/

echo "Reboot to activate zsh"
