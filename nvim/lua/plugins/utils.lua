return {
    {
        "rhysd/accelerated-jk",
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)" },
            { "k", "<Plug>(accelerated_jk_gk)" },
        },
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        keys = {
            { "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]] },
            { "<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]] },
            { "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]] },
        },
        config = {}
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = {
            enable_check_bracket_line = false
        }
    },
    {
        "ethanholz/nvim-lastplace",
        config = {}
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
        config = {}
    },
    {
        "folke/flash.nvim",
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump({
                        search = {
                            mode = function(str)
                                return "\\<" .. str
                            end,
                        },
                    })
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
        config = {}
    },
    -- {
    --     "nvim-tree/nvim-tree.lua",
    --     keys = {
    --         { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Open the nvim-tree" }
    --     },
    --     config = {}
    -- },
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
        config = {
            default_component_configs = {
                icon = {
                    folder_empty = "󰜌",
                    folder_empty_open = "󰜌",
                },
                git_status = {
                    symbols = {
                        renamed  = "󰁕",
                        unstaged = "󰄱",
                    },
                },
            },
            document_symbols = {
                kinds = {
                    File = { icon = "󰈙", hl = "Tag" },
                    Namespace = { icon = "󰌗", hl = "Include" },
                    Package = { icon = "󰏖", hl = "Label" },
                    Class = { icon = "󰌗", hl = "Include" },
                    Property = { icon = "󰆧", hl = "@property" },
                    Enum = { icon = "󰒻", hl = "@number" },
                    Function = { icon = "󰊕", hl = "Function" },
                    String = { icon = "󰀬", hl = "String" },
                    Number = { icon = "󰎠", hl = "Number" },
                    Array = { icon = "󰅪", hl = "Type" },
                    Object = { icon = "󰅩", hl = "Type" },
                    Key = { icon = "󰌋", hl = "" },
                    Struct = { icon = "󰌗", hl = "Type" },
                    Operator = { icon = "󰆕", hl = "Operator" },
                    TypeParameter = { icon = "󰊄", hl = "Type" },
                    StaticMethod = { icon = '󰠄 ', hl = 'Function' },
                }
            },
            -- Add this section only if you've configured source selector.
            source_selector = {
                sources = {
                    { source = "filesystem", display_name = " 󰉓 Files " },
                    { source = "git_status", display_name = " 󰊢 Git " },
                },
            },
        }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = {},
    },
    {
        "jessekelighine/vindent.vim",
        event = "VeryLazy",
    },
    {
        'echasnovski/mini.ai',
        event = "VeryLazy",
        config = {}
    },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        config = {}
    },
    {
        "s1n7ax/nvim-window-picker",
        config = {
            hint = "floating-big-letter",
            filter_rules = {
                include_current_win = true,
                bo = {
                    filetype = { "fidget", "neo-tree" }
                }
            }
        },
        keys = {
            { "<c-w>p", [[<cmd>lua vim.api.nvim_set_current_win(require('window-picker').pick_window())<cr>]] }
        }
    },
    {
        "ThePrimeagen/vim-be-good",
        cmd = { "VimBeGood" }
    }
}
