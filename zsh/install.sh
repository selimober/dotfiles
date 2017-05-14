#!/bin/bash

if [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then

  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  chsh -s /bin/zsh

  cp $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
  cp $HOME/.dotfiles/zsh/zshenv $HOME/.zshenv
  cp $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
  cp $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
  cp $HOME/.dotfiles/git/gitignore_global $HOME/.gitignore_global
  cp $HOME/.dotfiles/spacemacs $HOME/.spacemacs

fi
