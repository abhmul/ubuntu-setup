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

# Setup software
snap install go --classic
snap install vscode --classic
snap install emacs --classic
snap install obsidian
snap install zoom-client

# Setup background
sudo apt install feh

# Set up symbolic link
echo "Setting up symbolic links"
SETUP_PATH=$(pwd)
echo "Path to current directory $SETUP_PATH"
if [[ $SETUP_PATH != *ubuntu-setup ]]; then
	echo "Must run from root of ubuntu-setup!"
	exit 1
fi

cd $HOME/.config && \
	rm -rf i3 && \
	ln -s $SETUP_PATH/.config/i3 i3 && \
	rm -rf i3status && \
	ln -s $SETUP_PATH/.config/i3status i3status
cd $HOME && \
	rm -rf .scripts && \
	ln -s $SETUP_PATH/.scripts .scripts
cd $HOME && \
	rm -rf indicators && \
	ln -s $SETUP_PATH/indicators indicators
cd $HOME/Pictures && \
	rm normandy-destruction.jpg && \
	ln -s $SETUP_PATH/Pictures/normandy-destruction.jpg normandy-destruction.jpg
cd $HOME && \
	rm .bashrc.extra && \
	ln -s $SETUP_PATH/.bashrc.extra .bashrc.extra && \
	echo "\n. $HOME/.bashrc.extra" >> .bashrc && \ 
	rm .bash_aliases && \
	ln -s $SETUP_PATH/.bash_aliases .bash_aliases && \
	rm .bash_profile && \
	ln -s $SETUP_PATH/.bash_profile .bash_profile && \
	echo "\n\nCurrent state of bash settings" && \
	l -alh | grep .bash
	echo "\nUsing new bashrc"
	source ~/.bashrc



# Install Docker
echo "\n\nInstall docker at https://docs.docker.com/engine/install/ubuntu/#installation-methods"

# Setup workstation
cd $HOME
mkdir dev
mkdir sync-documents
