return {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
    },
    config = function()
        local tools = {
            "black",
            "prettier",
            "eslint_d,"
        }
        require("mason-null-ls").setup({
            ensure_installed = tools,
            handlers = {},
        })
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {},
        })
    end
}
