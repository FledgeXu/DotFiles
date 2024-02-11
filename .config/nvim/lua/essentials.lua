local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Globol Settings --
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
option.completeopt = { "menuone", "noselect" }
option.cursorline = true
option.termguicolors = true
option.signcolumn = "yes:1"
option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.updatetime = 50
option.mouse = "n"
option.undofile = true
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
option.exrc = true
option.wrap = false
option.splitright = true
option.laststatus = 3
option.winblend = 10
option.foldcolumn = '1'
option.foldlevel = 99
option.foldlevelstart = 99
option.foldenable = true
option.jumpoptions = "stack"


global.netrw_liststyle = 3
global.netrw_winsize = 25
global.netrw_banner = 0
global.netrw_altv = 1

-- Buffer Settings --
buffer.fileenconding = { "utf-8" }

-- Global Settings --
global.mapleader = " "

-- grep --
global.grepprg = [[grepprg=rg\ --vimgrep\ --no-heading\ --smart-case]]


-- vim.keymap.set("n", "ts", ":tabNext<CR>")
-- vim.keymap.set("n", "tn", ":tabnew<CR>")
-- vim.keymap.set("n", "tc", ":tabclose<CR>")
-- vim.keymap.set("n", "to", ":tabonly<CR>")
vim.keymap.set("n", "<F10>", "<cmd>w<CR><cmd>make<CR><cmd>Trouble quickfix<cr>")

vim.keymap.set("n", "<A-Tab>", "<cmd>bNext<CR>")
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>")
-- vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "v", "n" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-f>", "<c-f>zz")
vim.keymap.set("n", "<c-b>", "<c-b>zz")

vim.keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>")

vim.keymap.set("n", "<leader>e", "<cmd>Lexplore<cr>")
vim.keymap.set("n", "<leader>E", "<cmd>E<cr>")

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

vim.api.nvim_create_user_command("UpdateAll", function()
    vim.cmd("Lazy update")
    vim.cmd("MasonUpdate")
end, {})
