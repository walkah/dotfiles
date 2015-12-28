#!/bin/sh

# shutdown vagrant boxes
for box in $(vagrant global-status|grep running|awk '{ print $1 }'); do vagrant halt $box; done

# kill tmux sessions
tmux kill-server

# quit apps
osascript -e 'quit app "emacs"'
osascript -e 'quit app "github desktop"'
osascript -e 'quit app "atom"'

uncommitted ~/Projects ~/.homesick
