#!/bin/zsh
notify()
{
    heading=$1
    message=$2
    if [ `uname` = "Darwin" ]; then
        growlnotify -t ${heading} -m ${message}
    else
        notify-send ${heading} ${message}
    fi
}

(ssh irc.walkah.net -o PermitLocalCommand=no \
    ": > .irssi/fnotify ; tail -f .irssi/fnotify " | \
    while read heading message; do \
        notify "${heading}" "${message}"; \
    done)&

