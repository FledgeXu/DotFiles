return {
    "folke/tokyonight.nvim",
    priority = 1000,
    dependencies = {
        "utilyre/barbecue.nvim",
        "nvim-lualine/lualine.nvim",
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
        vim.cmd [[colorscheme tokyonight]]
        require('barbecue').setup {
            theme = 'tokyonight',
        }
        require('lualine').setup {
            theme = 'tokyonight',
        }
    end
}
