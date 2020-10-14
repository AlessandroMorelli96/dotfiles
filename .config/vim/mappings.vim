let mapleader = ","
inoremap jk <esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Movements
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Script
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command R !clear; ./%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map Ctrl-f for search
"nnoremap <c-f> :/

" turn off highlight
"nnoremap <leader><c-f> :nohlsearch<CR>

" highlight last inserted text
"nnoremap gV `[v`]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window Management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Split mode
nmap / :vsplit<cr>
nmap ? :split<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" W sudo saves the file
command W w !sudo tee % > /dev/null

" Saving
nmap <leader>w :w!<cr>

" Close
nmap <leader>q :q!<cr>

" Copy and paste using system clipboard
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<Esc>"+p
imap <C-v> <C-r><C-o>+"

" Keep text selected after indentation
vnoremap < <gv
vnoremap > >gv
