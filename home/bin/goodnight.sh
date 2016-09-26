#!/bin/sh

# shutdown vagrant boxes
for box in $(vagrant global-status|grep running|awk '{ print $1 }'); do vagrant halt $box; done

# shutdown docker machines
for machine in $(docker-machine ls -q); do docker-machine stop $machine; done
for container in $(docker ps -a -q); do docker stop $container; done

# kill tmux sessions
tmux kill-server

# quit apps
osascript -e 'quit app "emacs"'
osascript -e 'quit app "github desktop"'
osascript -e 'quit app "atom"'

# report repo status
mr -m status
