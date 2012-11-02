set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" github bundles
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
" Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-repeat'
 
" Bundle 'jondistad/vimclojure'
" Bundle 'edsono/vim-matchit'
" Bundle 'kana/vim-surround'
" Bundle 'plasticboy/vim-markdown'
 Bundle 'markabe/bufexplorer'
" Bundle 'cakebaker/scss-syntax.vim'
" Bundle 'chrismetcalf/vim-yankring'
" Bundle 'itspriddle/vim-jquery'
Bundle 'duff/vim-scratch'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-powerline'

Bundle 'altercation/vim-colors-solarized'
" Bundle 'Zenburn'

filetype plugin indent on

filetype plugin indent on

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

" Syntax highlighting
syntax on

" Diff
set diffopt+=vertical,iwhite

" Backups
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups

" vim 7.3 specific
if v:version >= 703
    set colorcolumn=85
    set undofile
    set undodir=~/.vim/tmp/undo// " undo files
    set relativenumber
else
    set number
endif

language English

" Color scheme (solarized)
colors solarized
set t_Co=256 " Explicitly tell vim that the terminal has 256 colors
let g:solarized_termcolors=256
set background=light

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
" cnoremap %% <C-R>=expand('%:p:h').'/'<cr>

" CtrlP
" nnoremap <leader>f :CtrlP<cr>
" nnoremap <leader>F :CtrlPCurFile<cr>

" set wildignore+=.git\*,.svn\*
let g:ctrlp_by_filename = 1
let g:ctrlp_dotfiles = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|target)$',
    \ 'file': '\v\.(exe|so|dll|class)$',
    \ }
	" \ 'link': 'some_bad_symbolic_link',

nnoremap <silent> <F11> :YRShow<CR>

