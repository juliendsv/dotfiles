if [[ `ssh-add -l` != *id_?sa* ]]; then 
    ssh-add ~/.ssh/id_rsa 
fi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

PS1="\[\033[1;32m\]juliendsv \[\033[1;30m\]:\w\[\033[1;34m\]\$(parse_git_branch)\[\033[00m\] "

ulimit -n 1024

