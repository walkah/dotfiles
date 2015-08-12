#!/bin/sh

# system setup
sudo chef-client
# rvm gemset reset_env # rvm cookbook breaks this
brew upgrade --all
for i in $(brew cask list); do brew cask install $i; done
brew cleanup
# atom updates
apm stars --install
apm upgrade --no-confirm

# updates from the app store
softwareupdate -i -a
