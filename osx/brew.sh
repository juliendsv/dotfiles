#!/bin/bash

brew install zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

brew install mysql --client-only
pip install virtualenv

git clone git://github.com/powerline/fonts.git
cd fonts; ./install.sh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
