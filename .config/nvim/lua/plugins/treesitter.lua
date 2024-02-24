return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
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
        -- ensure_installed = "all",
        ensure_installed = { "lua" },
        -- ignore_install = { "swift", "phpdoc"},
        indent = {
            -- enable = true
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
        },
    },
}
