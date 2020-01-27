#!/bin/sh
# Inspired by https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Dock settings
defaults write com.apple.dock 'orientation' -string 'left'
defaults write com.apple.dock autohide -bool true
killall Dock

# Finder settings
# TODO: turn on stacks? 
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
killall Finder

# Safari

# Enable the Develop menu
defaults write -app Safari IncludeDevelopMenu -bool true
defaults write -app Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write -app Safari WebKitPreferences.developerExtrasEnabled -bool true 
# Disable AutoFill
defaults write -app Safari AutoFillFromAddressBook -bool false
defaults write -app Safari AutoFillPasswords -bool false
defaults write -app Safari AutoFillCreditCardData -bool false
defaults write -app Safari AutoFillMiscellaneousForms -bool false

# Mail
# TODO: notifications for contacts only 
# TODO: disable sounds

# Sharing 
# Turn on SSH
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
# TODO: turn on VNC? 

# iTerm 2
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/SynologyDrive/Config/iTerm/"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
