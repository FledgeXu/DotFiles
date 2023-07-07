return {
    {
        "akinsho/bufferline.nvim",
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
        config = {}
    },
    {
        "lewis6991/gitsigns.nvim",
        config = {}
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = {}
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        confing = {},
    },
    {
        "RRethy/vim-illuminate",
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
