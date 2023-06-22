local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Globol Settings --
option.expandtab = true
option.backspace = { "indent", "eol", "start" }
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.shiftround = true
option.autoindent = true
option.smartindent = true
option.number = true
option.wildmenu = true
option.hlsearch = true
option.ignorecase = true
option.smartcase = true
option.completeopt = { "menu", "menuone" }
option.cursorline = true
option.termguicolors = true
option.autoread = true
option.title = true

-- Buffer Settings --
buffer.fileenconding = [[utf-8]]

-- Global Settings --
global.mapleader = " "

-- Key mappings --
vim.keymap.set({ "n", "i" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Right>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i" }, "<Down>", "<Nop>")
vim.keymap.set("n", "<A-Tab>", ":tabNext<CR>")
vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "tc", ":tabclose<CR>")
vim.keymap.set("n", "to", ":tabonly<CR>")

vim.keymap.set("n", "<A-Tab>", ":bNext<CR>", { silent = true })
