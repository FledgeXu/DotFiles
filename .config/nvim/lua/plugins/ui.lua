return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            local auto_theme_custom = require('lualine.themes.auto')
            -- auto_theme_custom.normal.c.bg = 'none'
            require('lualine').setup { options = { theme = auto_theme_custom } }
        end
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
        "goolord/alpha-nvim",
        config = function()
            local alpha = require("alpha")
            -- local theta = require("alpha.themes.theta")
            local dashboard = require("alpha.themes.dashboard")
            -- table.insert(theta.buttons.val,
            --     dashboard.button("SPC q s", "󰑓  Restore the session",
            --         [[<cmd>lua require("persistence").load({ last = true })<cr>]]))
            dashboard.section.header.val = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
            }
            -- dashboard.section.buttons.val = {
            -- }
            alpha.setup(dashboard.config)
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {
            scope = {
                enabled = false
            }
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            attach_to_untracked = true,
        },
        config = true
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            {
                'css',
                'javascript',
                'typescript',
                'html',
            }
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
            require('illuminate').configure()
        end,
    },
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require('transparent').setup {
                extra_groups = {
                    "NeoTreeNormal",
                    "NeoTreeNormalNC",
                    "NormalFloat",
                },
            }
            if vim.g.neovide then
                vim.cmd("TransparentDisable")
            else
                vim.cmd("TransparentEnable")
            end
        end,
    },
    {
        "willothy/flatten.nvim",
        config = true,
        lazy = false,
        priority = 1001,
    },
}
