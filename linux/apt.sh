#!/bin/bash

sudo apt-get -y install git curl htop vim-nox
sudo apt-get -y install python-pip python-dev
sudo pip install virtualenv
sudo pip install virtualenvwrapper

hash docker &> /dev/null
if [ $? -eq 1 ]; then
    curl -sSL https://get.docker.com/ | sh
fi
