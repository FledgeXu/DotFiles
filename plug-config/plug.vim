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
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'matze/vim-move'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'ap/vim-css-color'
    Plug 'puremourning/vimspector'
    Plug 'tpope/vim-fugitive'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'TovarishFin/vim-solidity'
    Plug 'tpope/vim-commentary'
call plug#end()
