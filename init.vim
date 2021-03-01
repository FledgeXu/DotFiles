set hidden
set smarttab
set expandtab
set showtabline=2
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround
set autoindent
set smartindent
set number
set wildmenu
set hlsearch
set incsearch
set ignorecase
set completeopt=menu,menuone
set encoding=utf-8
set noshowmode
set t_Co=256

au! BufWritePost $MYVIMRC source %

" Vim-Plugin Configuration.
call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mhinz/vim-startify'
    Plug 'Raimondi/delimitMate'
    Plug 'luochen1990/rainbow'
    Plug 'cespare/vim-toml'
    Plug 'honza/vim-snippets'
    Plug 'justinmk/vim-sneak'
    Plug 'mhinz/vim-signify'
    Plug 'liuchengxu/vim-which-key'
    Plug 'sheerun/vim-polyglot'
call plug#end()

" Global Value
" 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1 

" Key Binding 
let g:mapleader = "\<Space>"
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/sneak.vim
source $HOME/.config/nvim/plug-config/vim-which-key.vim
