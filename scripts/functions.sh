function install_xcode {
  if test ! $(xcode-select -p); then
    echo "We need xcode for macvim\n"
    echo "Do you want to provide a path for it or just install xcode command line tools and skip macvim?"
    echo "Type 1 for xcode, 2 for xcode command line tools"
    select yn in "1" "2"; do
        case $yn in
            1 ) install_xcode; break;;
            2 ) xcode-select --install; break;;
            esac
    done
  else
    echo "Xcode command line tools already installed. Skipping.."
  fi
}

function install_xcode_from_path {
  if [ ! -d "/Applications/Xcode.app" ]; then
    read -p "Provide path of the dmg file for xcode" XCODE_DMG
    if [ ! -e "$XCODE_DMG" ]; then
      echo "$XCODE_DMG does not exists"; exit 1;
    fi

    hdiutil attach "$XCODE_DMG"
    export __CFPREFERENCES_AVOID_DAEMON=1
    sudo installer -pkg '/Volumes/XCode/XCode.pkg' -target /
    hdiutil detach '/Volumes/XCode'
  fi
}

function install_brew {
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "Homebrew already installed. Skipping.."
  fi
}

function clone_dotfiles_from_github {
  echo "Cloning dotfiles repository from github\n"
  if [[ ! -d $HOME/.dotfiles ]]; then
    git clone https://github.com/selimober/dotfiles.git $HOME/.dotfiles
  else
    echo "dotfiles are already clonned. Skipping. (You might think of updating it.)"
  fi
}

function dot_copy {
  homedot="$HOME/$(basename $1)"
  if [[ -d $1 ]]; then
    if [[ -d $homedot ]]; then
      read -p "$homedot is a directory and will be recursively overwritten. Are you sure? [y/n]:" -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp $1/. $homedot -R
        echo "Done."
      else
        echo "Skipping.."
      fi
    else
      echo "Copying $1 to $homedot"
      mkdir -p $homedot
      cp -R $1 $homedot
    fi
  else
    cp_prompting_diff $1 $homedot
  fi
}

function cp_prompting_diff {
  echo "Copying $1 to $2..."
  if [[ -e $2 ]]; then
    icdiff $1 $2
    read -p "File already exist in your home folder. Do you want to overwrite? [y/n]:" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      cp $1 $2
      echo "Done."
    else
      echo "Not overwriting $2 file"
    fi
  fi

}

