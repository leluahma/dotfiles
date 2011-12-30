" Menu languages
language English
set langmenu=none

" Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on


set nocompatible
set modelines=0

" Tabs & Spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2

" Leader character
let mapleader = ","

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %


" Long line handling
set wrap
set ruler
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Syntax highlighting
syntax on

" Diff
set diffopt+=vertical,iwhite

" Statusline
"set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [FORMAT=%{&ff}]\ [ENC=%{&fenc}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Backups
set backupdir=~/vimfiles/tmp/backup// " backups
set directory=~/vimfiles/tmp/swap//   " swap files
set backup                        " enable backups

" vim 7.3 specific
if v:version >= 703
    set undofile
    set undodir=~/vimfiles/tmp/undo// " undo files
    set relativenumber
else
    set number
endif

if has("gui_running")
    
    " Set gui font as Consolas 10pt
    set guifont=Consolas:h10
    colors zenburn

    " Maximize window on startup
    au GUIEnter * simalt ~x

endif

" Save on losing focus
"au FocusLost * :wa

" Windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>wm <C-w>_<C-w>|

" Movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap j gj
nnoremap k gk

" Folding
set foldlevelstart=0
nnoremap <Space> za
vnoremap <Space> za
"noremap <leader>ft Vatzf

"
" Plugins
"

" CtrlP
nnoremap <F2> :CtrlP<cr>
set wildignore+=.git/*,.svn/*

