return {
    {
        'stevearc/conform.nvim',
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    python = { "black" },
                    swift = { "swift_format" },
                }
            })

            vim.keymap.set({ "n", "v" }, "<space>f", function()
                conform.format({
                    lsp_fallback = true,
                })
            end, { desc = "Format file or range (in visual mode)" })
        end
    }
}