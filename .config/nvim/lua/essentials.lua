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
option.completeopt = { "menuone", "noselect", "noinsert" }
-- option.cursorline = true
option.termguicolors = true
option.signcolumn = "auto"
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

global.netrw_liststyle = 3
global.netrw_winsize = 25
global.netrw_banner = 0
global.netrw_altv = 1

-- Buffer Settings --
buffer.fileenconding = { "utf-8" }

-- Global Settings --
global.mapleader = " "
global.maplocalleader = ","

-- grep --
global.grepprg = [[grepprg=rg\ --vimgrep\ --no-heading\ --smart-case]]

-- vim.keymap.set("n", "<A-Tab>", ":tabNext<CR>")
-- vim.keymap.set("n", "tn", ":tabnew<CR>")
-- vim.keymap.set("n", "tc", ":tabclose<CR>")
-- vim.keymap.set("n", "to", ":tabonly<CR>")
vim.keymap.set("n", "<F10>", "<cmd>w<CR><cmd>make<CR>")

vim.keymap.set("n", "<A-Tab>", "<cmd>bNext<CR>")
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "v", "n" }, "<leader>y", '"+y')
-- vim.keymap.set("n", "<c-d>", "<c-d>zz")
-- vim.keymap.set("n", "<c-u>", "<c-u>zz")
-- vim.keymap.set("n", "<c-f>", "<c-f>zz")
-- vim.keymap.set("n", "<c-b>", "<c-b>zz")

vim.keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>")

vim.keymap.set("n", "<leader>e", "<cmd>Lexplore<cr>")
vim.keymap.set("n", "<leader>E", "<cmd>E<cr>")

-- Termainl
vim.keymap.set("t", "<esc><esc>", [[<c-\><c-n>]])

-- Modified
vim.keymap.set("n", "<leader>lk", "<cmd>set nomodifiable<cr>")
vim.keymap.set("n", "<leader>ul", "<cmd>set modifiable<cr>")

-- vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

vim.api.nvim_create_user_command("UpdateAll", function()
    vim.cmd("Lazy update")
    vim.cmd("MasonUpdate")
end, {})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd([[clearjumps]])
    end,
    pattern = "*",
})

-- diagnostic
vim.keymap.set("n", "sd", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- quickfix and locallist
vim.keymap.set("n", "<leader>xl", function()
    local win = vim.api.nvim_get_current_win()
    local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
    local action = qf_winid > 0 and "lclose" or "lopen"
    action = next(vim.fn.getloclist(0)) == nil and "lclose" or action
    vim.cmd(action)
end, {})

vim.keymap.set("n", "<leader>xq", function()
    local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
    local action = qf_winid > 0 and "cclose" or "copen"
    vim.cmd("botright " .. action)
end, {})

-- vim.diagnostic.config({
--     underline = true,
--     signs = true,
--     virtual_text = false,
--     float = {
--         show_header = true,
--         source = "always",
--         border = "rounded",
--         focusable = true,
--     },
--     update_in_insert = false, -- default to false
--     severity_sort = false, -- default to false
-- })
-- custom signs
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
