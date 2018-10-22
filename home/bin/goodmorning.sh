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

# asdf 
asdf update
asdf plugin-update --all
asdf install

# update all repositories
mr -j 5 update

# upgrade app store apps
mas upgrade
