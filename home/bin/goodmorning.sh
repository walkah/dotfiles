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

# update ruby + gems
LATEST_RUBY=$(rbenv install -l | grep -v - | awk '{print $1}'| tail -1)
if [ $LATEST_RUBY != $(rbenv global) ]; then
  rbenv install $LATEST_RUBY
  rbenv global $LATEST_RUBY
fi
gem update

# update latest node
LATEST_NODE=$(nodenv install -l |grep -v - |awk '{print $1}'|egrep '[0-9]+\.\d*[0-9]\.[0-9]+'|sort -n|tail -1)
if [ $LATEST_NODE != $(nodenv global) ]; then
  nodenv install $LATEST_NODE
  nodenv global $LATEST_NODE
fi

# update python
LATEST_PYTHON=$(pyenv install -l | grep -v - | awk '{print $1}'|egrep '^2'| tail -1)
if [ $LATEST_PYTHON != $(pyenv global) ]; then
  pyenv install $LATEST_PYTHON
  pyenv global $LATEST_PYTHON
fi

# update all repositories
mr -j 5 update

# install atom packages
apm stars --install

# upgrade app store apps
mas upgrade
