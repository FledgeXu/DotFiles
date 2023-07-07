return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
    },
    keys = {
        { '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>" },
        { '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
        { '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>" },
        { '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
        { '<leader>qf', "<cmd>lua require('telescope.builtin').quickfix()<cr>" },
        { '<leader>km', "<cmd>lua require('telescope.builtin').keymaps()<cr>" },
        { '<c-p>',      "<cmd>lua require('telescope.builtin').commands()<cr>" },
    },
    config = function()
        require('telescope').setup {
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                }
            }
        }
        require('telescope').load_extension('fzf')
        local builtin = require('telescope.builtin')
    end
}
