return {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
    },
    config = function()
        local linters = {
            "black",
            "prettier",
        }
        require("mason-null-ls").setup({
            ensure_installed = linters,
            handlers = {},
        })
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {},
        })
    end
}
