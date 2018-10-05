#!/bin/bash

echo "Installing xcode commandline tools..."
sudo xcode-select --install
# Mojave fix
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing oh-my-zsh..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/sh

echo "Installing homesick..."
sudo gem install homesick
homesick clone git@github.com:walkah/dotfiles.git
homesick symlink -f

echo "Initial brew bundle..."
brew bundle --global
