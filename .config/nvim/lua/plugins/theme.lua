return {
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = vim.g.transparent_enabled,
        }
    },
    {
        "catppuccin/nvim",
        priority = 1000,
        name = "catppuccin",
        opts = {
            transparent_background = vim.g.transparent_enabled
        },
        config = function (opts)
            require"catppuccin".setup(opts)
            vim.cmd.colorscheme("catppuccin-mocha")
        end
    }
}
