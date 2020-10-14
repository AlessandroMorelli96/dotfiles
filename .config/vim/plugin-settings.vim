
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 15

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC-nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LightLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction


let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch' ] ],
      \   'right': [ [ 'lineinfo', 'percent', 'filetype' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ],
      \ },
      \ 'component': {
      \   'tagbar': '%{tagbar#currenttag("[%s]", "")}',
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \   'gitbranch': 'tabsel'
      \ },
      \ 'separator': {
	  \   'left': '', 'right': ''
      \ },
      \ 'subseparator': {
	  \   'left': '', 'right': ''
      \ }
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufferLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline#bufferline#show_number = 2

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
" Startify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction
let s:header = [
            \"=================     ===============     ===============   ========  ========",
            \"\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //",
            \"||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||",
            \"|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
            \"||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
            \"|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||",
            \"||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||",
            \"|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||",
            \"||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||",
            \"||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||",
            \"||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||",
            \"||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||",
            \"||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||",
            \"||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||",
            \"||   .=='    _-'          `-__\._-'         `-_./__-'         `' |. /|  |   ||",
            \"||.=='    _-'                                                     `' |  /==.||",
            \"=='    _-'                                                            \/   `==",
            \"\   _-'                                                                `-_   /",
            \" `''                                                                      ``'",
            \]

let g:startify_change_to_dir = 1
let g:startify_custom_header = s:center(s:header)
let g:startify_bookmarks = [
            \ { 't': '~/.config/tmux/tmux.conf' },
            \ { 'v': '~/.config/vim/' },
            \ { 'z': '~/.zshrc' },
            \ '~/Projects/writeup',
            \ '~/Projects/writeupPrivate',
            \ ]
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown Preview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
"let g:mkdp_auto_start = 1

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
"let g:mkdp_preview_options = {
"    \ 'mkit': {},
"    \ 'katex': {},
"    \ 'uml': {},
"    \ 'maid': {},
"    \ 'disable_sync_scroll': 0,
"    \ 'sync_scroll_type': 'middle',
"    \ 'hide_yaml_meta': 1,
"    \ 'sequence_diagrams': {},
"    \ 'flowchart_diagrams': {},
"    \ 'content_editable': v:false
"    \ }

" preview page title
" ${name} will be replace with the file name
"let g:mkdp_page_title = '「${name}」'
