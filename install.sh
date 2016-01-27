#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  if test ! $(xcode-select -p); then
    echo "Installing xcode command line tools"
    xcode-select --install
  else
    echo "Xcode command line tools already installed. Skipping.."
  fi
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "Homebrew already installed. Skipping.."
  fi

  # TODO git pull if .dotfiles exist
  git clone git@github.com:selimober/dotfiles.git $HOME/.dotfiles

  source $HOME/.dotfiles/scripts/bootsrap.sh

fi
