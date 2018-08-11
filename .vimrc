filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Show line numbers
set number

" Highlight all search results
set hlsearch

" Scroll by half pages instead of full
map <PageUp> <C-U>
map <PageDown> <C-D>

" Map 0 to first char on line, not beginning of line
map 0 ^

" Double slash to disable search highlight
nmap // :noh<Enter>

" F1<Char> to select text between two <Char> in normal or insert mode
nmap <F1> vi
imap <F1> <Esc>vi

" F2 to enable paste mode
set pastetoggle=<F2>

" F3 to save
nmap <F3> :w<Enter>
imap <F3> <Esc>:w<Enter>

" Change tabs with F9 and F10
nnoremap <F9> :tabprevious<Enter>
nnoremap <F10> :tabnext<Enter>

" Highlight currentline
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
