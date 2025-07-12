local option = vim.opt

-- Globol Settings --
option.autoread = true
option.showmode = false
option.backspace = { "indent", "eol", "start" }
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.shiftround = true
option.autoindent = true
option.smartindent = true
option.number = true
option.relativenumber = true
option.wildmenu = true
option.hlsearch = false
option.ignorecase = true
option.smartcase = true
option.completeopt = { "menuone", "noselect", "noinsert" }
-- option.cursorline = true
option.termguicolors = true
option.signcolumn = "yes"
option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.updatetime = 50
option.mouse = "a"
option.undofile = true
option.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo")
option.exrc = true
option.wrap = false
option.splitright = true
option.laststatus = 3
option.winblend = 10
option.foldcolumn = "auto"
option.foldlevel = 99
option.foldlevelstart = 99
option.foldenable = true
option.jumpoptions = "stack"
-- option.winbar = "=%F"
option.confirm = true

-- grep --
option.grepprg = "rg --vimgrep --no-heading --smart-case"
