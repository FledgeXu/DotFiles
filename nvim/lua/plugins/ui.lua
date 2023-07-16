return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = true,
    },
    {
        "utilyre/barbecue.nvim",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = true,
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = {
            options = {
                diagnostics = "nvim_lsp"
            }
        }
    },
    {
        "goolord/alpha-nvim",
        config = function()
            local alpha = require("alpha")
            local theta = require("alpha.themes.theta")
            local dashboard = require("alpha.themes.dashboard")
            table.insert(theta.buttons.val,
                dashboard.button("SPC q s", "󰑓  Restore the session",
                    [[<cmd>lua require("persistence").load({ last = true })<cr>]]))
            alpha.setup(theta.config)
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = "VeryLazy",
        config = true,
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        confing = true,
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require('illuminate').configure()
        end,
    },
}
