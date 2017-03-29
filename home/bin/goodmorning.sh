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
brew cask cleanup

# update gems
gem update

# update all repositories
mr -j 5 update
