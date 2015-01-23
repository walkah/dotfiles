#!/bin/sh

# system setup
sudo chef-client
rvm gemset reset_env # rvm cookbook breaks this
brew upgrade
brew cleanup
# updates from the app store
softwareupdate -i -a
