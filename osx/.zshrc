# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH="$HOME"
export PATH="$GOPATH/bin:$PATH";

# Add timestamp to history
HISTFILESIZE=10000000
export HISTCONTROL=erasedups

# Path to your oh-my-zsh installation.
export ZSH=/Users/juliendsv/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=15

HIST_STAMPS="dd.mm.yyyy"

plugins=(git bundler osx rake ruby)

source $ZSH/oh-my-zsh.sh

alias subl3="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias a="alias"
alias l="ls -l"
alias la="ls -laF"
alias timestamp="date +%s"
alias v="vagrant"

# Git shortcuts
alias gs="git status --short"
alias gpo="git pull origin"
alias gl="git pretty-log"
alias gup="git pull --rebase --prune $@ && git submodule update --init --recursive"
alias gcob="git checkout -b"
alias git-delete="git push origin --delete"
alias git-prune="git remote prune origin"
# alias git-clean="git branch -d $(git branch --merged |tail -n +2)"

# Docker
alias dstopall='docker stop $(docker ps -a -q)'
alias drmall='docker rm $(docker ps -a -q)'
alias drmiall='docker rmi $(docker images -q)'
# proto gen
alias protog="protoc --go_out=. *.proto"

# List Go dependencies of a project excluding standard libs
alias gdeps="go list -f '{{.Deps}}' | tr \"[\" \" \" | tr \"]\" \" \" | xargs go list -f '{{if not .Standard}}{{.ImportPath}}{{end}}'"

# Load private configs (out of the public repo)
if [[ -a ~/.env-vars ]]
then
  source ~/.env-vars
fi
