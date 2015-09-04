# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export GOPATH="$HOME"

if [[ `ssh-add -l` != *id_?sa* ]]; then 
    ssh-add ~/.ssh/id_rsa 
fi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Add timestamp to history
HISTFILESIZE=10000000
export HISTTIMEFORMAT="%F %T  "
# Erase duplicates in history
export HISTCONTROL=erasedups
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

PS1="\[\033[1;32m\]\u\[\033[1;34m\]@\h \[\033[1;33m\]\w\[\033[1;35m\]\$(parse_git_branch)\[\033[00m\] "

ulimit -n 1024


unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    source ~/.dotfile/linux/.profile
elif [[ "$unamestr" == 'Darwin' ]]; then
    source ~/.dotfile/osx/.profile
fi

echo $platform

if [[ -a /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ]]
then
    alias subl3="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
fi

if [[ -a /usr/local/bin/virtualenvwrapper.sh ]]
then
    source /usr/local/bin/virtualenvwrapper.sh
fi

alias a="alias"
alias l="ls -l"
alias la="ls -laF"
alias timestamp="date +%s"
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias v="vagrant"

# Git shortcuts
alias gs="git status --short"
alias gpo="git pull origin"
alias gl="git pretty-log"
alias gup="git pull --rebase --prune $@ && git submodule update --init --recursive"
alias gcob="git checkout -b"
alias git-delete="git push origin --delete"
alias git-prune="git remote prune origin"

# List Go dependencies of a project excluding standard libs
alias gdeps="go list -f '{{.Deps}}' | tr \"[\" \" \" | tr \"]\" \" \" | xargs go list -f '{{if not .Standard}}{{.ImportPath}}{{end}}'"

# Load private configs (out of the public repo)
if [[ -a ~/.env-vars ]]
then
  source ~/.env-vars
fi

# Shortcut for go repo
if [[ "$GOPATH" ]];
then
    alias cdgo="cd $GOPATH/src/github.com/$USER"
fi

# Docker
if [ "$(boot2docker status)" = "running" ] ; then
    eval "$(boot2docker shellinit)"
fi

alias d="docker"
alias dc="docker-compose"
alias dremoveall='docker rm $(docker ps -a -q)'
alias dstopall='docker rm $(docker ps -a -q)'

