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
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
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
            on_attach = function(bufnr)
                local function map(mode, lhs, rhs, opts)
                    opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
                    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
                end

                -- Navigation
                map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
                map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

                -- Actions
                map('n', '<leader>gss', ':Gitsigns stage_hunk<CR>')
                map('n', '<leader>gsr', ':Gitsigns reset_hunk<CR>')
                map('n', '<leader>gsS', '<cmd>Gitsigns stage_buffer<CR>')
                map('n', '<leader>gshu', '<cmd>Gitsigns undo_stage_hunk<CR>')
                map('n', '<leader>gshR', '<cmd>Gitsigns reset_buffer<CR>')
                map('n', '<leader>gshp', '<cmd>Gitsigns preview_hunk<CR>')
                map('n', '<leader>gshb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
                map('n', '<leader>gslb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
                map('n', '<leader>gsd', '<cmd>Gitsigns diffthis<CR>')
                map('n', '<leader>gsD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
                map('n', '<leader>gstd', '<cmd>Gitsigns toggle_deleted<CR>')

                -- Text object
                map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPost", "BufNewFile" },
        config = true,
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
        end,
    }
}
