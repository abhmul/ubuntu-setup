#!/bin/bash

log() {
	printf "\n"
	printf "$@"
	printf "\n\n"
}

SETUP_PATH=$(pwd)
log "Path to current directory $SETUP_PATH"
if [[ $SETUP_PATH != *ubuntu-setup ]]; then
	log "Must run from root of ubuntu-setup!"
	exit 1
fi

# Setup and upgrade
sudo apt -y update
sudo apt -y dist-upgrade

# Set up bashrc
log "Setting up bashrc"

cd $HOME && {
	rm .bashrc.extra
	ln -s $SETUP_PATH/.bashrc.extra .bashrc.extra
	printf "\n. $HOME/.bashrc.extra\n" >> .bashrc 
	rm .bash_aliases
	ln -s $SETUP_PATH/.bash_aliases .bash_aliases
	rm .bash_profile
	ln -s $SETUP_PATH/.bash_profile .bash_profile
	log "Current state of bash settings"
	ls -alh | grep .bash
	log "Using new bashrc"
	source ~/.bashrc
	rm .driverc
	ln -s $SETUP_PATH/.driverc .driverc
	log "Using new driver"
}

# Install tools
sudo apt -y install git
sudo apt -y install vim
sudo apt -y install ranger
sudo apt -y install scrot
sudo apt -y install shutter
sudo apt -y install xclip
sudo apt -y install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Setup software
sudo snap install go --classic
sudo snap install code --classic
sudo snap install emacs --classic
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.8.9/obsidian_0.8.9_amd64.snap
sudo snap install obsidian_0.8.9_amd64.snap --dangerous
sudo snap install zoom-client
go get -u github.com/odeke-em/drive/cmd/drive

# Install i3wm
sudo apt -y install i3

# Install screen layout manager
sudo apt -y install arandr

# Install applets
sudo apt -y install network-manager
sudo apt -y install blueman
sudo apt-add-repository -y ppa:yktooo/ppa
sudo apt -y update
sudo apt -y install indicator-sound-switcher
sudo apt -y install redshift

# Setup background
sudo apt -y install feh

# Set up more symbolic links
log "set up symbolic links"

cd $HOME && {
	rm .gitconfig
	ln -s $SETUP_PATH/.gitconfig .gitconfig
}
mkdir $HOME/.config
cd $HOME/.config && {
	rm -rf i3
	ln -s $SETUP_PATH/.config/i3 i3
	rm -rf i3status
	ln -s $SETUP_PATH/.config/i3status i3status
}
cd $HOME && {
	rm -rf .scripts
	ln -s $SETUP_PATH/.scripts .scripts
}
cd $HOME && {
	rm -rf indicators
	ln -s $SETUP_PATH/indicators indicators
}
mkdir $HOME/Pictures
cd $HOME/Pictures && {
	rm normandy-destruction.jpg
	ln -s $SETUP_PATH/Pictures/normandy-destruction.jpg normandy-destruction.jpg
}



# Install Docker
log "Install docker at https://docs.docker.com/engine/install/ubuntu/#installation-methods"
log "Test installation with dktest"

# Install Opera and Firefox
log "Install opera at https://www.opera.com/download"
sudo flatpak install flathub org.mozilla.firefox



# Setup git ssh key
log "Setup git ssh key"

# Setup workstation
cd $HOME && {
	mkdir dev
	mkdir gdrive && \
	drive init && \
	drive pull sync-documents

}

# Matlab setup
echo "Will you use matlab? [y,N]: "
read input
if [[ $input == "Y" || $input == "y" ]]; then
        log "Creating matlab desktop file"
	mkdir $HOME/matlab
	sudo cp ./matlab.desktop /usr/share/applications/
	log "Please install matlab to your $HOME/matlab folder"
else
        :
fi

# Run alias commands that do some setup
up
p
o

