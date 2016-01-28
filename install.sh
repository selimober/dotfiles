#!/usr/bin/env bash

set -e

source scripts/functions.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  install_xcode
  install_brew

  echo "› brew bundle"
  brew bundle

  clone_dotfiles_from_github

  echo "> installing zprezto"
  /bin/zsh zsh/install.sh

  echo "> setting up vim"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  curl -fLo ~/.vim/colors/badwolf.vim --create-dirs \
    https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim
  echo "alias vi=vi -u $HOME/.dotfiles/vim/.vimrc" >> $HOME/.zprofile
  vim -u $HOME/.dotfiles/vim/.vimrc +PlugInstall +qall

fi
