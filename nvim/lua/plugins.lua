-- Mandatory Settings --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins ---
local plugins = {
    -- Beautify Plugin --
    "folke/tokyonight.nvim",
    {
        "utilyre/barbecue.nvim",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    },
    "nvim-lualine/lualine.nvim",
    "itchyny/vim-cursorword",
    -- Utils ---
    "rhysd/accelerated-jk",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
        },
    },
    "kamykn/spelunker.vim",
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-tree.lua",
    "ethanholz/nvim-lastplace",
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    "ellisonleao/glow.nvim",
    "windwp/nvim-autopairs",
    "mhinz/vim-startify",
    -- Treesitter --
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    --- LSP ---
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "jose-elias-alvarez/null-ls.nvim",
    -- Snippets --.
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    "saadparwaiz1/cmp_luasnip",
}
local opts = {}

require("lazy").setup(plugins, opts)
