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
    "goolord/alpha-nvim",
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    "norcalli/nvim-colorizer.lua",
    "folke/trouble.nvim",
    -- Utils ---
    "rhysd/accelerated-jk",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    "kamykn/spelunker.vim",
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-tree.lua",
    "ethanholz/nvim-lastplace",
    "folke/which-key.nvim",
    "ellisonleao/glow.nvim",
    "windwp/nvim-autopairs",
    "akinsho/bufferline.nvim",
    "lukas-reineke/indent-blankline.nvim",
    -- Treesitter --
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    --- LSP ---
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
    },
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
