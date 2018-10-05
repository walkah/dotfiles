#!/bin/sh

# Dock settings
defaults write com.apple.dock 'orientation' -string 'left'
defaults write com.apple.dock autohide -bool true
killall Dock

# Finder settings
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
killall Finder
