vim.keymap.set("n", "<F10>", "<cmd>w<CR><cmd>make<CR>")

vim.keymap.set("n", "<A-Tab>", "<cmd>bNext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bNext<CR>")
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>bo", function()
    local cur = vim.api.nvim_get_current_buf()
    vim.cmd("bufdo bd")
    vim.cmd("enew")
    vim.api.nvim_set_current_buf(cur)
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "v", "n" }, "<leader>y", '"+y')

vim.keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>")

-- Termainl
vim.keymap.set("t", "<esc><esc>", [[<c-\><c-n>]])

-- Modified
vim.keymap.set("n", "<leader>lk", "<cmd>set nomodifiable<cr>")
vim.keymap.set("n", "<leader>ul", "<cmd>set modifiable<cr>")

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
