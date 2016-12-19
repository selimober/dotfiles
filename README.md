selim does dotfiles
===================

Simple dotfile configuration for my own use.

Run

```
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/selimober/dotfiles/master/bootsrap.sh)"
```

Inspired by [holman/dotfiles](https://github.com/holman/dotfiles) and [isa/environments](https://github.com/isa/environments)

Note: While running `brew update && brew upgrade` if macvim is upgraded you need to run `./install.py --clang-completer --gocode-completer --tern-completer` in the folder `.vim/plugged/YouCompleteMe`

Note: Because we clone with https first, after fixing ssh keys and before pushing changes to dotfiles, you need to set remote url to git protocol:

```
git remote set-url origin git@github.com:selimober/dotfiles.git
```
