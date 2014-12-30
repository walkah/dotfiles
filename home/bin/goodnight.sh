#!/bin/sh

# shutdown vagrant boxes
for box in $(vagrant global-status|grep running|awk '{ print $1 }'); do vagrant halt $box; done

# kill tmux sessions
tmux kill-server

# quit apps
osascript -e 'quit app "emacs"'
osascript -e 'quit app "textual 5"'
osascript -e 'quit app "adium"'
osascript -e 'quit app "flowdock"'
osascript -e 'quit app "skype"'
osascript -e 'quit app "slack"'

uncommitted ~/Projects ~/.homesick
