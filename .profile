if [[ `ssh-add -l` != *id_?sa* ]]; then 
    ssh-add ~/.ssh/id_rsa 
fi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Add timestamp to history
export HISTTIMEFORMAT="%F %T  "

function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

# solarize light
# PS1="\[\033[1;32m\]juliendsv \[\033[1;30m\]:\w\[\033[1;34m\]\$(parse_git_branch)\[\033[00m\] "

# pro
PS1="\[\033[1;35m\]juliendsv \[\033[1;33m\]:\w\[\033[1;34m\]\$(parse_git_branch)\[\033[00m\] "

ulimit -n 1024

alias l="ls -l"
alias la="ls -laF"
alias timestamp="date +%s"
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Git shortcuts
alias gs="git status --short"
alias gpo="git pull origin"
alias gl="git pretty-log"