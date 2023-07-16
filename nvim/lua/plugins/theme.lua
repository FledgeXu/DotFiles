return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            vim.cmd [[colorscheme catppuccin-frappe]]
        end,
    }
}
