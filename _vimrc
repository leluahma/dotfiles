" Check if we are in a restricted mode
silent! call writefile([], '')
" In restricted mode, this fails with E145: Shell commands not allowed in rvim
" In non-restricted mode, this fails with E482: Can't create file <empty>
let isRestricted = (v:errmsg =~# '^E145:')

" Vundle support				{{{
" http://github.com/gmarik/vundle
" Setup: git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" vim :BundleInstall

if filereadable(expand("~/.vim/bundle/vundle/autoload/vundle.vim"))
    set nocompatible
    filetype off
    
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " List of bundles {{{
    " github repositories
    Bundle 'gmarik/vundle'
    Bundle "nathanaelkane/vim-indent-guides"
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-repeat'
    Bundle 'stephpy/vim-yaml'
    Bundle 'chase/vim-ansible-yaml'
    Bundle 'mattn/webapi-vim'
    Bundle 'mattn/gist-vim'

    Bundle 'kana/vim-surround'
    Bundle 'markabe/bufexplorer'
    Bundle 'duff/vim-scratch'
    Bundle 'kien/ctrlp.vim'
    Bundle 'mattn/emmet-vim'
    Bundle 'tomtom/tcomment_vim'
    Bundle 'pangloss/vim-javascript'
    Bundle 'Lokaltog/vim-powerline'

    Bundle 'altercation/vim-colors-solarized'

    " github.com/vim-scripts repositories
    Bundle "nginx.vim"

    " }}}
endif " }}}

filetype plugin indent on

" General options
set nocompatible
set modeline

" Tabs & Spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
set smarttab
set nojoinspaces
set scrolloff=3
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set directory=.,~/tmp,/var/tmp
" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" Long line handling
set wrap
set ruler
set textwidth=0
set formatoptions=qrn1




if isRestricted
    set showmode
endif

" Backups
set nobackup
set writebackup
set backupdir=.,./backup~,~/backup~

" Text encoding                     {{{1
set printencoding=utf-8
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=bom,utf-8,iso-8859-2,latin2,cp1250,default,latin1 " }}}1

" Beeping turned off
set noerrorbells visualbell t_vb=

" Syntax highlighting
if has("syntax")
    syntax on
    set synmaxcol=120
endif

" Diff
set diffopt+=vertical,iwhite


if exists('+relativenumber')
    set relativenumber
else
    set number
endif

" vim 7.3 specific
if v:version >= 703
    set colorcolumn=85
endif

if $term == 'xterm'
    set t_Co=256 " Explicitly tell vim that the terminal has 256 colors
    let g:solarized_termcolors=256
else
    set t_Co=16 " Explicitly tell vim that the terminal has 16 colors
    let g:solarized_termcolors=16
    let g:solarized_underline=0
endif

" Color scheme (solarized)
silent! colorscheme solarized
set background=dark

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

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

" System clipboard integration {{{1
" Yank selection to system clipboard
noremap <Leader>y "*y

" Yank current line to system clipboard
noremap <Leader>yy "*Y

" Paste text from system clipboard
noremap <Leader>p :set paste<CR>"*p<Esc>:set nopaste<CR>
"nnoremap <leader>p :pu<cr>

"
" Plugins
"
" cnoremap %% <C-R>=expand('%:p:h').'/'<cr>

" CtrlP
" nnoremap <leader>f :CtrlP<cr>
" nnoremap <leader>F :CtrlPCurFile<cr>

let g:ctrlp_by_filename = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_show_hidden = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.?(git|hg|svn|target)$',
    \ 'file': '\v\.(exe|so|dll|class|orig)$',
    \ }

" Don't backup files in temp directories or shm
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
endif

" Don't keep swap files in temp directories or shm
if has('autocmd')
    augroup swapskip
        autocmd!
        silent! autocmd BufNewFile,BufReadPre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noswapfile
    augroup END
endif

" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
    augroup undoskip
        autocmd!
        silent! autocmd BufWritePre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noundofile
    augroup END
endif

" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
    if has('autocmd')
        augroup viminfoskip
            autocmd!
            silent! autocmd BufNewFile,BufReadPre
                \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
                \ setlocal viminfo=
        augroup END
    endif
endif

" Source a local configuration file if available		{{{1
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif " }}}

