" be iMproved, required
set nocompatible

call plug#begin('~/.vim/plugged')

" Clojure, Java
" Plug 'tpope/vim-classpath', { 'for': ['clojure', 'java'] }

" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'gregspurrier/vim-midje', { 'for': 'clojure' }
" Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
" Plug 'guns/vim-sexp', { 'for': 'clojure' }

" General
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'Valloric/YouCompleteMe'
Plug 'raimondi/delimitMate'
Plug 'SirVer/ultisnips'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'

" Tab completion
" Plug 'ervandew/supertab'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'mattn/emmet-vim', {'for': ['javascript.jsx', 'html', 'xml', 'xhtml']}
Plug 'lfilho/cosco.vim', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim' ,{ 'for': 'Javascript' }
Plug 'digitaltoad/vim-pug' ,{ 'for': 'pug' }

" Go
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'majutsushi/tagbar', {'for': 'go'}

" Custom
Plug '~/prj/self/autohighlight'

" Theme
Plug 'joshdick/onedark.vim'

call plug#end()

filetype plugin indent on    " required

" temporary hack because of a regression in macOSx Sierra
" see: https://github.com/tmux/tmux/issues/543#issuecomment-248980734
set clipboard=unnamed


source $HOME/.dotfiles/vim/.vim/helper.vim
source $HOME/.dotfiles/vim/.vim/settings.vim
source $HOME/.dotfiles/vim/.vim/mappings.vim
source $HOME/.dotfiles/vim/.vim/colors.vim
