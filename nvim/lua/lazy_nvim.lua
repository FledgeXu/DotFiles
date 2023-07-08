-- Mandatory Settings --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins ---
local opts = {
    checker = {
        -- automatically check for plugin updates
        enabled = true,
        notify = true,      -- get the notification when new updates are found
        frequency = 604800, -- check for updates every week
    },
    install = {
        colorscheme = { "tokyonight" }
    }
}

require("lazy").setup("plugins", opts)
