#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

apt-get -y install emacs24 emacs24-el emacs24-common-non-dfsg terminator texlive autojump zsh tig

CURRENTPATH=$(dirname "$0")

# Copy terminator settings
mkdir -p ~/.config/terminator
cp $CURRENTPATH/conf/terminator/config ~/.config/terminator/
cp $CURRENTPATH/conf/init.el ~/.emacs.d/

# Set default terminal to terminator
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'

# Oh my zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

echo "Reboot to activate zsh"
