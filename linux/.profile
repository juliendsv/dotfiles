export PATH="/usr/local/go/bin:$PATH"

ssh-auth() {
    # Start the SSH agent only if not running
    [[ -z $(ps -A | grep ssh-agent) ]] && echo $(ssh-agent) > /tmp/ssh-agent-data.sh

    # Identify the running SSH agent
    [[ -z $SSH_AGENT_PID ]] && source /tmp/ssh-agent-data.sh > /dev/null

    # Authenticate
    [[ -z $(ssh-add -l | grep "/home/$(whoami)/.ssh/id_rsa") ]] && ssh-add 
}

ssh-auth

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
