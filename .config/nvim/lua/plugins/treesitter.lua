return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate all",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    main = "nvim-treesitter.configs",
    opts = {
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "vv", -- set to `false` to disable one of the mappings
                node_incremental = "v",
                node_decremental = "V",
            },
        },
        ensure_installed = "all",
        -- ignore_install = { "swift", "phpdoc"},
        indent = {
            enable = true,
        },
        highlight = {
            enable = true,
        },
        playground = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = { query = "@class.outer", desc = "Next class start" },
                },
                goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]C"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                },
                goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[C"] = "@class.outer",
                },
            },
        },
    },
}
