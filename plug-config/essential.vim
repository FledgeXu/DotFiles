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

let g:mapleader = "\<Space>"
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

highlight Pmenu    ctermbg=DarkGray ctermfg=White
highlight PmenuSel ctermbg=LightGray ctermfg=White

au! BufWritePost $MYVIMRC source %
