#!/bin/sh

echo "* Shutdown docker..."
# for machine in $(docker-machine ls -q); do docker-machine stop $machine; done
for container in $(docker ps -a -q); do docker stop $container; done
docker system prune -f

echo "* Stop running services..."
brew services stop --all

echo "* Uncommitted projects..."
mr -m status

