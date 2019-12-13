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
sudo apt-add-repository ppa:yktooo/ppa
sudo apt update
sudo apt install indicator-sound-switcher

# Install msi rgb keyboard manager
# cd indicators
# git clone https://github.com/Askannz/msi-perkeyrgb
# cd msi-perkeyrgb/
# sudo python3 setup.py install
# sudo cp 99-msi-rgb.rules /etc/udev/rules.d/

# Install tools
sudo apt install vim
sudo apt install ranger
sudo apt install scrot
sudo apt install shutter
sudo apt install xclip

# Setup background
sudo apt install feh

# Set up symbolic link
echo "Setting up symbolic links"
SETUP_PATH=$(pwd)
echo "Path to current directory $SETUP_PATH"

cd ~/.config
rm -rf i3
ln -s $SETUP_PATH/.config/i3 i3
cd ~
rm -rf .scripts
ln -s $SETUP_PATH/.scripts .scripts
rm -rf indicators
ln -s $SETUP_PATH/indicators indicators
cd ~/Pictures
rm normandy-destruction.jpg
ln -s $SETUP_PATH/Pictures/normandy-destruction.jpg normandy-destruction.jpg

