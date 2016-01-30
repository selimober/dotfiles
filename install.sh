#!/usr/bin/env bash

function install_xcode {
  if test ! $(xcode-select -p); then
    echo ""
    echo "> We need xcode for macvim"
    echo "> Do you want to provide a path for it or just install xcode command line tools and skip macvim?"
    echo "> Type 1 for xcode, 2 for xcode command line tools"
    select yn in "1" "2"; do
        case $yn in
            1 ) install_xcode_from_path; break;;
            2 ) xcode-select --install; break;;
            esac
    done
  else
    echo "> Xcode command line tools already installed. Skipping.."
  fi
}

function install_xcode_from_path {
  if [ ! -d "/Applications/Xcode.app" ]; then
    read -p "Provide path of the dmg file for xcode: " XCODE_DMG
    if [ ! -e "$XCODE_DMG" ]; then
      echo "> $XCODE_DMG does not exists"; exit 1;
    fi

    hdiutil attach "$XCODE_DMG"
    export __CFPREFERENCES_AVOID_DAEMON=1
    echo "> Copying XCode, this will take a while"
    read -p "> Press Enter when installation is completed" XCODE_DONE
    hdiutil detach '/Volumes/XCode'
    sudo /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -license accept
  fi
}

function install_brew {
  if test ! $(which brew); then
    echo ""
    echo "> Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "> Homebrew already installed. Skipping.."
  fi
}

function clone_dotfiles_from_github {
  echo ""
  echo "> Cloning dotfiles repository from github"
  if [[ ! -d $HOME/.dotfiles ]]; then
    git clone https://github.com/selimober/dotfiles.git $HOME/.dotfiles
  else
    echo "> dotfiles are already clonned. Skipping. (You might think of updating it.)"
  fi
}

if [[ "$OSTYPE" == "darwin"* ]]; then

  install_xcode
  install_brew

  echo ""
  echo "> Running software update"
  sudo softwareupdate --install --all

  clone_dotfiles_from_github

  echo ""
  echo "› brew bundle"
  brew bundle --file=$HOME/.dotfiles/Brewfile

  echo ""
  echo "> installing zprezto"
  /bin/zsh $HOME/.dotfiles/zsh/install.sh

  echo ""
  echo "> setting up Go 1.5.3"
  sudo -s 'curl https://storage.googleapis.com/golang/go1.5.3.darwin-amd64.tar.gz | tar xz -C /usr/local'
  echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.zprofile
  echo 'export GOPATH=$HOME/prj/go'

  echo ""
  echo "> setting up vim"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  curl -fLo ~/.vim/colors/badwolf.vim --create-dirs \
    https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim
  echo "alias vi=vi -u $HOME/.dotfiles/vim/.vimrc" >> $HOME/.zprofile

  vim -u $HOME/.dotfiles/vim/.vimrc +PlugInstall +qall

  echo "source $HOME/.dotfiles/vim/.vim/helper.vim" >> $HOME/.dotfiles/vim/.vimrc
  echo "source $HOME/.dotfiles/vim/.vim/settings.vim" >> $HOME/.dotfiles/vim/.vimrc
  echo "source $HOME/.dotfiles/vim/.vim/mappings.vim" >> $HOME/.dotfiles/vim/.vimrc
  echo "source $HOME/.dotfiles/vim/.vim/colors.vim" >> $HOME/.dotfiles/vim/.vimrc

fi
