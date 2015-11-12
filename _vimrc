" Check if we are in a restricted mode
silent! call writefile([], '')
" In restricted mode, this fails with E145: Shell commands not allowed in rvim
" In non-restricted mode, this fails with E482: Can't create file <empty>
let isRestricted = (v:errmsg =~# '^E145:')

" Vundle support				{{{
" http://github.com/gmarik/vundle
" Setup: git clone http://github.com/VundleVim/Vundle.vim ~/.vim/bundle/
" vim +PluginInstall +qall

if isdirectory(expand("~/.vim/bundle/Vundle.vim/"))
    set nocompatible
    filetype off
    
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()

    " List of bundles {{{
    " github repositories
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'nathanaelkane/vim-indent-guides'
    "Plugin 'Raimondi/YAIFA'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-repeat'
    Plugin 'stephpy/vim-yaml'
    Plugin 'chase/vim-ansible-yaml'
    Plugin 'mattn/webapi-vim'
    Plugin 'mattn/gist-vim'

    Plugin 'kana/vim-surround'
    Plugin 'jlanzarotta/bufexplorer'
    Plugin 'duff/vim-scratch'
    Plugin 'kien/ctrlp.vim'
    Plugin 'mattn/emmet-vim'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'pangloss/vim-javascript'
    Plugin 'Lokaltog/vim-powerline'
    Plugin 'PProvost/vim-ps1'
    " Plugin 'editorconfig/editorconfig-vim'
    Plugin 'altercation/vim-colors-solarized'

    " github.com/vim-scripts repositories
    Plugin 'nginx.vim'

    call vundle#end()

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
if has("gui_running")
    " English menu language
    set langmenu=none

    if has("gui_gtk2")
        set guifont=Sourec\ Code\ Pro\ Medium\ 12,Inconsolata\ 12
    elseif has("gui_win32")
        set guifont=Source\ Code\ Pro\ Medium:h12,Consolas:h12

        language English
    endif

    set background=light
else
    set background=dark
endif

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

"
" Plugins
"
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" CtrlP
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

