
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install Vim Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install pluggins
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'               " Vim Tmux navigator
Plug '/usr/local/opt/fzf'                           " FZF
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'                              " Theme
Plug 'tpope/vim-fugitive'                           " Git Plugin
Plug 'ncm2/ncm2'                                    " NCM2
Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-tern'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shell=zsh
set title
set history=1000                                    " Sets how many lines of history VIM has to remember
set autoread                                        " Set to auto read when a file is changed from the outside
set mouse=a                                         " Set mouse for all
let mapleader = ","
command W w !sudo tee % > /dev/null                 " :W sudo saves the file
inoremap jk <esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Variable
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:python3_host_prog="~/.config/pyenv/shims/python"
let g:ncm2_pyclang#library_path = '/Library/Developer/CommandLineTools/usr/lib/'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spaces and Tubs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shiftwidth=4                                    " when indenting with '>', use 4 spaces width
set tabstop=4                                       " Number of space in Tab
set softtabstop=4                                   " show existing tab with 4 spaces width
set expandtab                                       " tabs are spaces
set smarttab
set smartindent
set autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable                                       " Enable syntax highlighting
set ffs=unix,dos,mac                                " Use Unix as the standard file type
set so=7                                            " Set 7 lines to the cursor - when moving vertically using j/k
set number                                          " Set numbers of line
set relativenumber                                  " Line Number
set showcmd                                         " show command in bottom bar
"set cursorline                                      " highlight current line
set lazyredraw                                      " Don't redraw while executing macros (good performance config)
set magic                                           " For regular expressions turn magic on
set showmatch                                       " Show matching brackets when text indicator is over them
set foldcolumn=1                                    " Add a bit extra margin to the left
set ruler                                           " Always show current position
set cmdheight=2                                     " Height of the command bar
set hid                                             " A buffer becomes hidden when it is abandoned

" Enable filetype plugins
filetype plugin on
filetype indent on
set wildmenu                                        " Visual autocomplete for command menu
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store   " Ignore compiled files

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase                                      " Ignore case when searching
set smartcase                                       " When searching try to be smart about cases
set hlsearch                                        " Highlight search results
set incsearch                                       " Makes search act like search in modern browsers

" Map Ctrl-f for search
nnoremap <c-f> :/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set foldenable                                      " enable folding
"set foldlevelstart=10                               " open most folds by default
"set foldnestmax=10                                  " 10 nested fold max
"set foldmethod=indent                               " fold based on indent level
"set autochdir                                       " When open new split window, change directory to actual

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

" highlight last inserted text
nnoremap gV `[v`]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" turn off highlight
nnoremap <leader><c-f> :nohlsearch<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Fast close
nmap <leader>q :q!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window Management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Split mode
nmap / :vsplit<cr>
nmap ? :split<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Copy and paste using system clipboard
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<Esc>"+p
imap <C-v> <C-r><C-o>+"

" Select text inserted during last insert mode usage
nnoremap gV `[v`]

" Keep text selected after indentation
vnoremap < <gv
vnoremap > >gv

" Move between code blocks
" nnoremap è [{
" nnoremap + ]}
" nnoremap à [(
" nnoremap ù ])

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NCM2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>
    
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
    \ 'name' : 'css',
    \ 'priority': 9,
    \ 'subscope_enable': 1,
    \ 'scope': ['css','scss'],
    \ 'mark': 'css',
    \ 'word_pattern': '[\w\-]+',
    \ 'complete_pattern': ':\s*',
    \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    \ })
