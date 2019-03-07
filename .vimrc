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

" Ctr-t to vsplit
nmap <C-t> :vsplit<Enter>
imap <Esc><C-t> :vsplit<Enter>

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


" Dont replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

" Set file tab completion
set wildmenu
set wildmode=longest:full,full

" Remap window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
