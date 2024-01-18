return {
    {
        "rhysd/accelerated-jk",
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)" },
            { "k", "<Plug>(accelerated_jk_gk)" },
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        opts = {
            enable_check_bracket_line = false,
        },
    },
    {
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        "folke/trouble.nvim",
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle<cr>" },
            { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
            { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
            { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
            { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
            { "<leader>gR", "<cmd>TroubleToggle lsp_references<cr>" },
        },
        config = true,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = {
                    enabled = false
                }
            }
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Flash Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },
    {
        "kamykn/spelunker.vim",
        event = "VeryLazy",
        config = function()
            vim.g.spelunker_check_type = 2
        end
    },
    {
        "ellisonleao/glow.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Open the neo-tree" }
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = true,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "jessekelighine/vindent.vim",
        event = "VeryLazy",
    },
    {
        "numToStr/Comment.nvim",
        event  = "VeryLazy",
        config = true,
    },
    {
        "s1n7ax/nvim-window-picker",
        opts = {
            filter_rules = {
                include_current_win = true,
                bo = {
                    filetype = { "fidget", "neo-tree" }
                }
            }
        },
        keys = {
            {
                "<c-w>p",
                function()
                    local window_number = require('window-picker').pick_window()
                    if window_number then vim.api.nvim_set_current_win(window_number) end
                end,
            }
        }
    },
    {
        "echasnovski/mini.bufremove",
        keys = {
            { "<leader>bo", "<cmd>lua MiniBufremove.unshow()<cr>" },
        },
        opts = {
            set_vim_settings = true,
        },
    },
    {
        "tpope/vim-sleuth",
    },
    {
        -- 'pwntester/octo.nvim',
        -- requires = {
        --     'nvim-lua/plenary.nvim',
        --     'nvim-telescope/telescope.nvim',
        --     'nvim-tree/nvim-web-devicons',
        -- },
        -- config = function()
        --     require "octo".setup()
        -- end
    },
    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = '<leader>sa',            -- Add surrounding in Normal and Visual modes
                delete = '<leader>sd',         -- Delete surrounding
                find = '<leader>sf',           -- Find surrounding (to the right)
                find_left = '<leader>sF',      -- Find surrounding (to the left)
                highlight = '<leader>sh',      -- Highlight surrounding
                replace = '<leader>sr',        -- Replace surrounding
                update_n_lines = '<leader>sn', -- Update `n_lines`

                suffix_last = 'l',             -- Suffix to search with "prev" method
                suffix_next = 'n',             -- Suffix to search with "next" method
            },
        }
    },
    {
        'akinsho/toggleterm.nvim',
        keys = {
            { "<A-d>", [[<cmd>ToggleTerm<cr>]] },
        },
        config = true,
    }
}
