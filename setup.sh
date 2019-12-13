#!/bin/bash

# Setup and upgrade
sudo apt update
sudo apt dist-upgrade

# Install i3wm
sudo apt install i3

# Install screen layout manager
sudo apt install arandr

# Install applets
sudo apt install network-manager
sudo apt install blueman
sudo apt-add-repository ppa:yktooo/pp
sudo apt update
sudo apt install indicator-sound-switcher

# Install msi rgb keyboard manager
# cd indicators
# git clone https://github.com/Askannz/msi-perkeyrgb
# cd msi-perkeyrgb/
# sudo python3 setup.py install
# sudo cp 99-msi-rgb.rules /etc/udev/rules.d/

# Setup background
sudo apt install feh

# Set up symbolic links
rm -rf .config/i3
ln -s .config/i3 ~/.config/i3
ln -s .scripts ~/.scripts
ln -s indicators ~/.indicators
ln -s Pictures/normandy-destruction.jpg ~/Pictures/normandy-destruction.jpg

