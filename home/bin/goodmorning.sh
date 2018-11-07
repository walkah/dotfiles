#!/bin/sh

function install_latest() {
  version=$(asdf list-all $1 | grep -v - | tail -1)
  asdf install $1 $version 
  asdf global $1 $version
}

echo "* Updating homesick..."
homesick pull
homesick symlink

echo "* Restoring mackup..."
mackup restore

echo "* Homebrew updates..."
brew bundle --global
brew upgrade
brew cleanup

echo "* Upgrading mac app store apps..."
mas upgrade

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
