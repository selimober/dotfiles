#!/bin/bash

set -e

function setup_system_defaults {
  # show IP address in the login screen
  sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo IPAddress

  # enable keyboard access for all controls
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

  # speed up the keyboard
  defaults write NSGlobalDomain InitialKeyRepeat -int 12
  defaults write NSGlobalDomain KeyRepeat -int 1

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

  # use all f1-12 keys as standard function keys
  defaults write -g com.apple.keyboard.fnState -boolean true

  # change the screensot image format to jpg, defaults to png and higher quality
  defaults write com.apple.screencapture type jpg; killall SystemUIServer
}
