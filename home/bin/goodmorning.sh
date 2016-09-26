#!/bin/sh

# system setup
sudo chef-client

# upgrade homebrew
brew upgrade --all
brew cleanup

# update all repositories
mr -j 5 update

# updates from the app store
mas upgrade
