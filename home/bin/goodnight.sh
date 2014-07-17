#!/bin/sh

# shutdown vagrant boxes
for box in $(vagrant global-status|grep running|awk '{ print $1 }'); do vagrant halt $box; done

# kill tmux sessions
tmux kill-server

# quit apps
osascript -e 'tell application "emacs" to quit'
osascript -e 'tell application "textual" to quit'
osascript -e 'tell application "adium" to quit'
osascript -e 'tell application "flowdock" to quit'
osascript -e 'tell application "skype" to quit'
osascript -e 'tell application "slack" to quit'

uncommitted ~/Projects ~/.homesick
