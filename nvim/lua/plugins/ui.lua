return {
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
                dashboard.button("SPC q s", "󰑓  Restore the session", [[<cmd>lua require("persistence").load()<cr>]]))
            alpha.setup(theta.config)
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = {}
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = {}
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = "VeryLazy",
        config = {}
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        confing = {},
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require('illuminate').configure({
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
            })
        end,
    },
}
