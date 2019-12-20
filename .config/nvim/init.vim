"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. General
" 2. Plugins
" 3. Colors and Fonts
" 4. Space and Tabs
" 5. UI Config
" 6. Searcing
" 7. Folding
" 8. Custom Movements
" 9. Leader Shortcut
" 10. Backups
" 11. Custom Functions
" 12. Status Line
" 13. Window Managment
" 14. Custom Mapping
" 15. NERDTree
" 16. NCM2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2. Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install Vim Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install pluggins
call plug#begin('~/.vim/plugged')

" GO
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'tpope/vim-sensible'

" FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Better commit editor
Plug 'rhysd/committia.vim'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree'

" syntastic"
Plug 'vim-syntastic/syntastic'

" NCM2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-go'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python3_host_prog="/Users/clownfire/.config/pyenv/shims/python"
set shell=/bin/zsh
set title

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Set mouse
set mouse=a
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3. Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4. Spaces and Tubs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" Number of space in 
set tabstop=4

" show existing tab with 4 spaces width
set softtabstop=4

" tabs are spaces
set expandtab

set smarttab
set smartindent
set autoindent
set ignorecase                     " Make searching case insensitive
set smartcase                      " Make search sensitive to capital letters

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 5. UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Set numbers of line
set number

" Line Number
set relativenumber

" show command in bottom bar
set showcmd

" highlight current line
set cursorline

" Enable filetype plugins
filetype plugin on
filetype indent on

" Visual autocomplete for command menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 6. Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 7. Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable folding
set foldenable

" open most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10

" fold based on indent level
set foldmethod=indent

" When open new split window, change directory to actual
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 8. Custom Movements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 9. Leader Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast saving
nmap <leader>w :w!<cr>

" Fast close
nmap <leader>q :q!<cr>

" jk is escape
inoremap jk <esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 10. Backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 11. Custom Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""
" 12. Status line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

""""""""""""""""""""""""""""""
" 13. Window Management
""""""""""""""""""""""""""""""

" Split mode
nmap \ :vsplit<cr>
nmap - :split<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""
" 14. Custom Mapping
""""""""""""""""""""""""""""""

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
nnoremap è [{
nnoremap + ]}
nnoremap à [(
nnoremap ù ])

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 15. NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let g:NERDSpaceDelims = 1
autocmd StdinReadPre * let s:std_in=1                   " Open NERDTree automatically when folder is opened
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim when only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Clean NERDTree's UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Open NERDTree on current file
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 16. NCM2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
