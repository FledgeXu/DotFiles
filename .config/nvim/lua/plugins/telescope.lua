return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        -- "nvim-telescope/telescope-dap.nvim",
        {
            "nvim-telescope/telescope-media-files.nvim",
            dependencies = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim",
            },
        },
    },
    cmd = { "Telescope" },
    keys = {
        { "<leader>?",      "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
        { "<space><space>", "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true })<cr>" },
        {
            "<leader>/",
            function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end,
        },
        { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidden=true, sort_mru=true})<cr>" },
        {
            "<leader>fg",
            "<cmd>lua require('telescope.builtin').live_grep( { hidden = true, additional_args = { '--fixed-strings' } })<cr>",
        },
        { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
        { "<leader>fb", "<cmd>lua require('telescope.builtin').builtin()<cr>" },
        { "<leader>fp", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>" },
        { "<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>" },
        { "<leader>fj", "<cmd>lua require('telescope.builtin').jumplist	()<cr>" },
        { "<leader>qf", "<cmd>lua require('telescope.builtin').quickfix()<cr>" },
        { "<leader>km", "<cmd>lua require('telescope.builtin').keymaps()<cr>" },
        {
            "<leader>fr",
            function()
                local text = vim.trim(vim.fn.getreg('"'))
                local builtin = require("telescope.builtin")
                builtin.grep_string({ search = text })
            end,
        },
        {
            "<leader>fw",
            function()
                local text = vim.fn.expand("<cword>")
                local builtin = require("telescope.builtin")
                builtin.grep_string({ search = text })
            end,
        },
        {
            "<leader>fW",
            function()
                local text = vim.fn.expand("<cWORD>")
                local builtin = require("telescope.builtin")
                builtin.grep_string({ search = text })
            end,
        },
        {
            "<leader>fr",
            function()
                local text = vim.fn.getreg('"')
                local builtin = require("telescope.builtin")
                builtin.grep_string({ search = text })
            end,
        },
        { "<c-p>",       "<cmd>lua require('telescope.builtin').commands()<cr>" },
        { "<leader>faf", "<cmd>lua require('telescope.builtin').treesitter({symbols={'function', 'method'}})<cr>" },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
                media_files = {
                    filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
                    find_cmd = "rg",
                },
            },
            defaults = {
                file_ignore_patterns = { ".git/" },
            },
        })
        require("telescope").load_extension("fzf")
        -- require("telescope").load_extension("dap")
        require("telescope").load_extension("media_files")
    end,
}
