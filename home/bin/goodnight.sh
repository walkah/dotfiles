#!/bin/sh

echo "* Shutdown vagrant..."
for box in $(vagrant global-status|grep running|awk '{ print $1 }'); do vagrant halt $box; done

echo "* Shutdown docker..."
for machine in $(docker-machine ls -q); do docker-machine stop $machine; done
for container in $(docker ps -a -q); do docker stop $container; done

echo "* Stop running services..."
brew services stop --all

echo "* Kill tmux sessions..."
tmux kill-server

echo "* Uncommitted projects..."
mr -m status

echo "* Homesick status..."
homesick status
