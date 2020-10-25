""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shell=zsh
set title
set history=1000                                    " Sets how many lines of history VIM has to remember
set autoread                                        " Set to auto read when a file is changed from the outside
set mouse=a                                         " Set mouse for all

set laststatus=2
set showtabline=2
set noshowmode
set background=dark

" Theme
if has('nvim') || has('termguicolors')
  set termguicolors
endif

" Make cliccable the buffers tab
if has('nvim')
    let g:lightline.component_raw = {'buffers': 1}
    let g:lightline#bufferline#clickable = 1
endif
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spaces and Tubs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shiftwidth=4                                    " when indenting with '>', use 4 spaces width
set tabstop=4                                       " Number of space in Tab
set softtabstop=4                                   " show existing tab with 4 spaces width
set expandtab                                       " tabs are spaces
set smartindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable                                       " Enable syntax highlighting
set ffs=unix,dos,mac                                " Use Unix as the standard file type
set scrolloff=7                                            " Set 7 lines to the cursor - when moving vertically using j/k
set number                                          " Set numbers of line
set relativenumber                                  " Line Number
set lazyredraw                                      " Don't redraw while executing macros (good performance config)
set foldcolumn=1                                    " Add a bit extra margin to the left
set cmdheight=2                                     " Height of the command bar
set hidden                                             " A buffer becomes hidden when it is abandoned

" Enable filetype plugins
filetype plugin on
filetype indent on
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store   " Ignore compiled files

" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
"set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase                                      " Ignore case when searching
"set smartcase                                       " When searching try to be smart about cases

" Stark highlighting is enough to see the current match; don't need the
" centering, which can be annoying.
let g:LoupeCenterResults=0

" And it turns out that if we're going to turn off the centering, we don't even
" need the mappings; see: https://github.com/wincent/loupe/pull/15
map <Nop><F1> <Plug>(LoupeN)
nmap <Nop><F2> <Plug>(Loupen)
