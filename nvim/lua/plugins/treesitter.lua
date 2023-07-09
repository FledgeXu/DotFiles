return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/playground",
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = "all",
            -- ignore_install = { "swift", "phpdoc"},
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
            indent = {
                enable = true
            },
            highlight = {
                enable = true
            }
        }
        require("nvim-treesitter.install").compilers = { "clang" }
    end
}
