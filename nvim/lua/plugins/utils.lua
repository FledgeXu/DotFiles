return {
    {
        "rhysd/accelerated-jk",
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)" },
            { "k", "<Plug>(accelerated_jk_gk)" },
        },
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        keys = {
            { "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]] },
            { "<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]] },
            { "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]] },
        },
        config = {}
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = {
            enable_check_bracket_line = false
        }
    },
    {
        "ethanholz/nvim-lastplace",
        config = {}
    },
    {
        "folke/trouble.nvim",
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle<cr>" },
            { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
            { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
            { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
            { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
            { "<leader>gR", "<cmd>TroubleToggle lsp_references<cr>" },
        },
        config = {}
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        config = {}
    },
    {
        "kamykn/spelunker.vim",
        event = "VeryLazy",
        config = function()
            vim.g.spelunker_check_type = 2
        end
    },
    {
        "ellisonleao/glow.nvim",
        event = "VeryLazy",
        config = {}
    },
    {
        "nvim-tree/nvim-tree.lua",
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Open the nvim-tree" }
        },
        config = {}
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = {},
    },
    -- "jessekelighine/vindent.vim",
    {
        'echasnovski/mini.ai',
        event = "VeryLazy",
        config = {}
    },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        config = {}
    },
}
