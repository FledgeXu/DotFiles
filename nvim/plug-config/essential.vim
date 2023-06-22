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
set termguicolors
set autoread
filetype plugin indent on


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

" Terminal ESC
tnoremap <esc><esc> <c-\><c-n>

"
nnoremap <silent> <Leader><Leader> :call SourceConfig()<cr>


fun! GotoWindow(id)
    call win_gotoid(a:id)
endfun

if (!exists('*SourceConfig'))
  function SourceConfig() abort
    " Your path will probably be different
    for f in split(glob('~/.config/nvim/autoload/*'), '\n')
      exe 'source' f
    endfor

    source $MYVIMRC
  endfunction
endif
