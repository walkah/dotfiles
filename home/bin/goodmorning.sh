#!/bin/sh

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
asdf update
asdf plugin-update --all
asdf install

echo "* Syncing repositories..."
mr -j 5 update

echo "* Upgrading oh-my-zsh..."
cd ~/.oh-my-zsh
git pull --rebase --stat origin master
