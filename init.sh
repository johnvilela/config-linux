#!/bin/bash

echo "Setting up Ubuntu..."

print() {
    echo "=========================="
    echo $1
    echo "=========================="
}

print "Installing essential packages..."
sudo add-apt-repository ppa:git-core/ppa
sudo apt update && sudo apt upgrade -y
sudo apt install -y ninja-build gettext cmake unzip build-essential curl git fish

print "Installing Neovim..."
mkdir ~/apps && cd ~/apps
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

print "Installing starship..."
curl -sS https://starship.rs/install.sh | sh

chsh -s $(which fish)
