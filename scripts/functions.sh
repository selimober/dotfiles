#!/bin/bash

set -e

function install_brew {
  if test ! $(which brew); then
    echo ""
    echo "> Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "> Homebrew already installed. Skipping.."
  fi
}

function software_update {
  echo ""
  echo "> Running software update"
  sudo softwareupdate --install --all
}

function brew_bundle {
  echo ""
  echo "› brew bundle"
  brew bundle --file=$HOME/.dotfiles/Brewfile
}

function npm_packages {
  npm install -g cloc nativefier
}

function install_zprezto {
  echo ""
  echo "> installing zprezto"
  /bin/zsh $HOME/.dotfiles/zsh/install.sh
}

function setup_go {
  echo ""
  echo "> setting up Go 1.5.3"
  echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.zprofile
  echo 'export GOPATH=$HOME/prj/go' >> $HOME/.zprofile
}

function setup_vi {
  echo ""
  echo "> setting up vim"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  curl -fLo ~/.vim/colors/badwolf.vim --create-dirs \
    https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim

  alias vi="mvim -v -u $HOME/.dotfiles/vim/.vimrc"

  vi -u $HOME/.dotfiles/vim/.vimrc +PlugInstall +qall
  cp $HOME/.dotfiles/vim/tern-project $HOME/.tern-project
  $HOME/.vim/plugged/YouCompleteMe/install.py --clang-completer --gocode-completer --tern-completer
}

