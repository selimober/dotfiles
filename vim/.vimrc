call plug#begin('~/.vim/plugged')

" Clojure, Java
Plug 'tpope/vim-classpath', { 'for': ['clojure', 'java'] }

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
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'

" Tab completion
" Plug 'ervandew/supertab'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'mattn/emmet-vim', {'for': ['javascript.jsx', 'html', 'xml', 'xhtml']}
Plug 'lfilho/cosco.vim', { 'for': 'javascript' }

" Go
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'majutsushi/tagbar', {'for': 'go'}

call plug#end()

filetype plugin indent on    " required

source .vim/helper.vim
source .vim/settings.vim
source .vim/mappings.vim
source .vim/colors.vim
