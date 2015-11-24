export GOPATH="$HOME"
export PATH="$GOPATH/bin:$PATH";
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
    source ~/.dotfiles/linux/.profile
elif [[ "$unamestr" == 'Darwin' ]]; then
    source ~/.dotfiles/osx/.profile
fi

if [[ -a /usr/local/bin/virtualenvwrapper.sh ]]
then
    source /usr/local/bin/virtualenvwrapper.sh
fi

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

