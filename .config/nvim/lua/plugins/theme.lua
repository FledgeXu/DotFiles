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
        config = function()
            require("catppuccin").setup({
                flavour = "frappe",
                transparent_background = vim.g.transparent_enabled,
                integrations = {
                    fidget = true,
                    gitsigns = true,
                    window_picker = true,
                },
            })
            vim.cmd.colorscheme("catppuccin")
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
    {
        "projekt0n/github-nvim-theme",
        config = function(opts)
            -- require("github-theme").setup(opts)
            -- vim.cmd("colorscheme github_light")
        end,
    },
}
