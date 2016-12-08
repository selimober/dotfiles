selim does dotfiles
===================

Simple dotfile configuration for my own use.

Run

```
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/selimober/dotfiles/master/bootsrap.sh)"
```

Inspired by [holman/dotfiles](https://github.com/holman/dotfiles) and [isa/environments](https://github.com/isa/environments)

Note: While running `brew update && brew upgrade` if macvim is upgraded you need to run `./install.py --clang-completer --gocode-completer --tern-completer` in the folder `.vim/plugged/YouCompleteMe`
