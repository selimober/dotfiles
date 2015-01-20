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

function install_brew {
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
}
