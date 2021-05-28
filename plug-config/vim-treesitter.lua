require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", 
    ignore_install = { "haskell" }, 
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        },
    },
    indent = {
        enable = true
    },
    rainbow = { 
        enable = true
    },
    highlight = {
        enable = true
    }
}
