#!/bin/sh

# system setup
# sudo chef-client

# homesick 
homesick pull 
homesick symlink

# mackup 
mackup restore

# upgrade homebrew
brew bundle --global
brew upgrade
brew cleanup

# update all repositories
mr -j 5 update
