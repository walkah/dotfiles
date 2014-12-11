#!/bin/sh

# system setup
sudo chef-client
rvm gemset reset_env # rvm cookbook breaks this
brew upgrade 
brew cleanup
for cask in $(brew cask list); do brew cask install $cask; done
brew cask cleanup
# updates from the app store
softwareupdate -i -a
