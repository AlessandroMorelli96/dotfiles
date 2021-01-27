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
" BufferLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

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
