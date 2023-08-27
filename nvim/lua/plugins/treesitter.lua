return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = "all",
        -- ignore_install = { "swift", "phpdoc"},
        indent = {
            -- enable = true
        },
        highlight = {
            enable = true
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
    }
}
