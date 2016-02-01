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

  clone_dotfiles_from_github

fi
