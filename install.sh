#!/bin/bash

brew cask install virtualbox
brew cask install vagrant

curl -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/andrewmarklloyd/cbts/master/Vagrantfile > Vagrantfile

vagrant up
