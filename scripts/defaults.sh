#!/bin/bash

set -e

function setup_system_defaults {
  # show IP address in the login screen
  sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo IPAddress

  # revert back to real "natural scrolling"
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

  # enable keyboard access for all controls
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

  # speed up the keyboard
  defaults write NSGlobalDomain InitialKeyRepeat -int 4
  defaults write NSGlobalDomain KeyRepeat -int 0

  # disable re-opening apps on logon
  sudo defaults write com.apple.loginwindow TALLogoutSavesState -bool false

  # enable subpixel font rendering on non-Apple LCDs
  defaults write NSGlobalDomain AppleFontSmoothing -int 2

  # show all file extensions and remove the warning when changing extension
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  # disable are you sure you want to open this app thing
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  # Use AirDrop over every interface. srsly this should be a default.
  defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

  # Show the ~/Library folder.
  chflags nohidden ~/Library

}
