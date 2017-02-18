#!/bin/bash

# Run as root. This script assumes joh-conf/ is placed at $HOME

apt-get -y install emacs24 emacs24-el emacs24-common-non-dfsg terminator texlive autojump

CURRENTPATH=$(dirname "$0")
echo $CURRENTPATH

# Copy terminator settings
cp $CURRENTPATH/conf/terminator/config ~/.config/terminator/
cp $CURRENTPATH/conf/init.el ~/.emacs.d/


#Set default terminal to terminator
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'

