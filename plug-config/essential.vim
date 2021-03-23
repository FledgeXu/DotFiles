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
set cursorline
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

" About Tab
nnoremap <A-Tab> :tabNext<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap to :tabonly<CR>

fun! GotoWindow(id)
    call win_gotoid(a:id)
endfun

au! BufWritePost $MYVIMRC source %
autocmd BufReadPost * normal! g`"
