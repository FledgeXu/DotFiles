return {
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = vim.g.transparent_enabled,
        },
        config = function(opts)
            -- require("tokyonight").setup(opts)
            -- vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "catppuccin/nvim",
        priority = 1000,
        name = "catppuccin",
        opts = {
            transparent_background = vim.g.transparent_enabled,
        },
        config = function(opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin-frappe")
        end,
    },
    {
        "navarasu/onedark.nvim",
        config = function()
            -- require("onedark").setup({
            --     style = "light",
            -- })
            -- require("onedark").load()
        end,
    },
}
