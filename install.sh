#!/bin/bash

if [ ! -x "$(command -v git)" ]; then 
  echo "Installing xcode commandline tools..."
  sudo xcode-select --install
fi

if [ ! -x "$(command -v brew)" ]; then
  echo "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed."
fi 

if [ ! -d ~/.oh-my-zsh ]; then
  echo "Installing oh-my-zsh..."
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  chsh -s /bin/zsh
else
  echo "Oh-My-Zsh already installed."
fi 

if [ ! -d ~/.homesick ]; then
  echo "Installing homesick..."
  sudo gem install homesick
  homesick clone https://github.com/walkah/dotfiles.git
  homesick symlink
else
  echo "Homesick already installed."
fi

if [ ! -d ~/.asdf ]; then 
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.0
else 
  echo "asdf already installed."
fi

echo "Initial brew bundle..."
brew bundle --global
