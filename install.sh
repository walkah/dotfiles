#!/bin/bash

add_omz() {
  if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh..."
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    chsh -s /bin/zsh
  else
    echo "Oh-My-Zsh already installed."
  fi 
}

add_homesick() {
  if [ ! -d ~/.homesick ]; then
    echo "Installing homesick..."
    homesick clone https://github.com/walkah/dotfiles.git
    homesick symlink
  else
    echo "Homesick already installed."
  fi

}

install_macos() {
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

  add_omz

  sudo gem install homesick
  add_homesick

  echo "Initial brew bundle..."
  brew bundle --global
}

install_linux() {
  sudo apt install zsh curl git homesick
  sudo snap install starship

  add_omz

  add_homesick

  if [ ! -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
  fi
}

# Actual installer
case "$OSTYPE" in
  darwin*)
    install_macos
    ;;
  linux*)
    install_linux
    ;;
esac
