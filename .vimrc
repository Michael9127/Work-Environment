filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set number

set hlsearch

map 0 ^
nmap <F1> vi
nnoremap <F9> :tabprevious<Enter>
nnoremap <F10> :tabnext<Enter>
set cursorline
filetype plugin on
syntax on
