#!/usr/bin/env bash

source functions.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  install_brew

  # installing brew packages
  brew install coreutils
  brew install findutils
  brew install bash

  # Install more recent versions of some OS X tools
  brew tap homebrew/dupes
  brew install homebrew/dupes/grep

  brew install icdiff

  brew cleanup

fi
