#!/bin/bash

sudo apt-get -y install git curl htop vim-nox

sudo apt-get -y install python-pip python-dev
sudo pip install virtualenv
sudo pip install virtualenvwrapper

curl -sSL https://get.docker.com/ | sh
