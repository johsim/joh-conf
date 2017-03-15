#!/bin/bash
sudo apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade

sudo apt-get -y install emacs24 emacs24-el emacs24-common-non-dfsg terminator texlive autojump zsh tree python3-dev python3-pip

pip3 install --user thefuck

CURRENTPATH=$(dirname "$0")

# Copy terminator settings
mkdir -p ~/.config/terminator
cp -p $CURRENTPATH/conf/terminator/config ~/.config/terminator/
cp -p $CURRENTPATH/conf/init.el ~/.emacs.d/

# Set default terminal to terminator
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'

# Global gitignore
cp -p $CURRENTPATH/conf/.gitignore_global ~/
git config --global core.excludesfile '~/.gitignore_global'

# Oh my zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

ZSH_CUSTOM=$CURRENTPATH/conf/zsh_custom

# Zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

cp -p $CURRENTPATH/conf/.zshrc ~/

echo "Reboot to activate zsh"
