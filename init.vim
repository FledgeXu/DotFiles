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
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'honza/vim-snippets'
    Plug 'justinmk/vim-sneak'
call plug#end()

" Global Value
" 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1 

" Key Binding 
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

let mapleader=','

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/sneak.vim
