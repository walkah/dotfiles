#!/bin/bash

function install_latest() {
  version=$(asdf list-all $1 | grep -v '[a-z]' | tail -1)
  asdf install $1 $version 
  asdf global $1 $version
}

echo "* Updating homesick..."
homesick pull
homesick symlink

case "$OSTYPE" in 
  darwin*)
    echo "* Restoring mackup..."
    mackup restore
    
    echo "* Homebrew updates..."
    brew bundle --global --no-lock
    brew upgrade
    
    echo "* Upgrading mac app store apps..."
    mas upgrade
    ;;
  linux*)
    sudo apt update && sudo apt upgrade
    sudo snap refresh
  
    ;;
esac



echo "* asdf update..."
export R_CONFIGURE_OPTIONS="--with-x=no"
for plugin in $(cat ~/.tool-versions | awk '{print $1}'); do asdf plugin-add $plugin; done
asdf update
asdf plugin-update --all
asdf install
for plugin in $(cat ~/.tool-versions | awk '{print $1}'); do install_latest $plugin; done

echo "* Syncing repositories..."
mr -j 5 update

echo "* Upgrading oh-my-zsh..."
cd ~/.oh-my-zsh
git pull --rebase --stat origin master
