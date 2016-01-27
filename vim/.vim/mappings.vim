" map jj to ESC
:inoremap jj <Esc>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Nerd tree
map <C-n> :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>

" Insert new line without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Cosco
autocmd FileType javascript,css inoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

""""""""""""""""""""""""""""""
" => Go
""""""""""""""""""""""""""""""

au FileType go nmap <leader>r :w<CR><Plug>(go-run)
au FileType go nmap <leader>b :w<CR><Plug>(go-build)
au FileType go nmap <leader>t :w<CR><Plug>(go-test)
au FileType go nmap <leader>c :w<CR><Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap <Leader>e <Plug>(go-rename)

nmap <F8> :TagbarToggle<CR>


""""""""""""""""""""""""""""""
" => Ultisnips
""""""""""""""""""""""""""""""
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
