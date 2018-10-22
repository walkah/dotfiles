#!/bin/bash

if [ ! -x "$(command -v git)" ]; then 
  echo "Installing xcode commandline tools..."
  sudo xcode-select --install
  # Mojave fix
  sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

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
  homesick clone git@github.com:walkah/dotfiles.git
  homesick symlink -f
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
