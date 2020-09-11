#!/bin/bash


echo "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Installing virtualbox"
brew cask install virtualbox

echo "Installing vagrant"
brew cask install vagrant

echo "Downloading Vagrantfile"
curl -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/andrewmarklloyd/cbts/master/Vagrantfile > Vagrantfile

echo "Starting virtual machine"
vagrant up
