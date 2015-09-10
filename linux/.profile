if [ ! -f ~/.dir_colors ]; then
    dircolors -p > ~/.dir_colors
fi
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias d="docker"
alias dc="docker-compose"
alias dremoveall='docker rm $(docker ps -a -q)'
alias dstopall='docker stop $(docker ps -a -q)'
