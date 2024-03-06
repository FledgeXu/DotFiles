return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            local auto_theme_custom = require("lualine.themes.auto")
            require("lualine").setup({ theme = auto_theme_custom })
        end,
    },
    {
        "utilyre/barbecue.nvim",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            show_modified = true,
            custom_section = function()
                return "%F"
            end,
        },
    },
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("alpha").setup(require("alpha.themes.startify").config)
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {
            scope = {
                enabled = false,
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            attach_to_untracked = true,
        },
        config = true,
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            {
                "css",
                "javascript",
                "typescript",
                "html",
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require("illuminate").configure()
        end,
    },
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({
                extra_groups = {
                    "NeoTreeNormal",
                    "NeoTreeNormalNC",
                    "NormalFloat",
                    "FoldColumn",
                    "FloatBorder",
                    "FloatTitle",
                },
                exclude_groups = {
                    "NotifyBackground",
                    "CursorLine",
                },
            })
            if vim.g.neovide then
                vim.cmd("TransparentDisable")
            end
        end,
    },
}
