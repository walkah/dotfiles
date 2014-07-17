#!/bin/sh

# system setup
chef-client
rvm gemset reset_env # rvm cookbook breaks this
brew upgrade 
brew cleanup
for cask in $(brew cask list); do brew cask install $cask; done
brew cask cleanup

open $(mdfind Emacs.app)

