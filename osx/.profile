if [[ -a /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ]]
then
    alias subl3="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
fi

if [ "$(boot2docker status)" = "running" ] ; then
    eval "$(boot2docker shellinit)"
fi

alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"