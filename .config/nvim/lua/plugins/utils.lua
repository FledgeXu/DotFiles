return {
    {
        "rhysd/accelerated-jk",
        enabled = false,
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)" },
            { "k", "<Plug>(accelerated_jk_gk)" },
        },
    },
    {
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        "nvim-lua/plenary.nvim",
        keys = {
            {
                "<leader>hpb",
                function()
                    require("plenary.profile").start("profile.log", { flame = true })
                end,
                desc = "Begin profiling",
            },
            {
                "<leader>hpe",
                function()
                    require("plenary.profile").stop()
                end,
                desc = "End profiling",
            },
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = {
                    enabled = false,
                },
            },
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Flash Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },
    {
        "kamykn/spelunker.vim",
        event = "VeryLazy",
        config = function()
            vim.g.spelunker_check_type = 2
        end,
    },
    {
        "folke/which-key.nvim",
        enabled = false,
        event = "VeryLazy",
        config = true,
    },
    {
        "jessekelighine/vindent.vim",
        event = "VeryLazy",
    },
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1,
    },
    {
        "s1n7ax/nvim-window-picker",
        opts = {
            hint = "floating-big-letter",
            filter_rules = {
                include_current_win = true,
                bo = {
                    filetype = { "fidget", "neo-tree" },
                },
            },
        },
        keys = {
            {
                "<c-w>p",
                function()
                    local window_number = require("window-picker").pick_window()
                    if window_number then
                        vim.api.nvim_set_current_win(window_number)
                    end
                end,
            },
        },
    },
    {
        "NMAC427/guess-indent.nvim",
        opts = {},
    },
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        opts = {
            open_mapping = [[<A-d>]],
            size = function(term)
                if term.direction == "horizontal" then
                    return 8
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
        },
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "willothy/flatten.nvim",
        opts = {
            window = {
                open = "alternate",
            },
        },
        lazy = false,
        priority = 1001,
    },
    {
        "tummetott/unimpaired.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "kevinhwang91/nvim-bqf",
        dependencies = {
            {
                "junegunn/fzf",
                build = function()
                    vim.fn["fzf#install"]()
                end,
            },
        },
        ft = "qf",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "yutkat/confirm-quit.nvim",
        event = "CmdlineEnter",
        opts = {},
    },
    {
        "m4xshen/hardtime.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "tris203/precognition.nvim",
        enabled = false,
        event = "VeryLazy",
        config = {
            -- startVisible = true,
            -- showBlankVirtLine = true,
            -- highlightColor = { link = "Comment"),
            -- hints = {
            --      Caret = { text = "^", prio = 2 },
            --      Dollar = { text = "$", prio = 1 },
            --      MatchingPair = { text = "%", prio = 5 },
            --      Zero = { text = "0", prio = 1 },
            --      w = { text = "w", prio = 10 },
            --      b = { text = "b", prio = 9 },
            --      e = { text = "e", prio = 8 },
            --      W = { text = "W", prio = 7 },
            --      B = { text = "B", prio = 6 },
            --      E = { text = "E", prio = 5 },
            -- },
            -- gutterHints = {
            --     -- prio is not currently used for gutter hints
            --     G = { text = "G", prio = 1 },
            --     gg = { text = "gg", prio = 1 },
            --     PrevParagraph = { text = "{", prio = 1 },
            --     NextParagraph = { text = "}", prio = 1 },
            -- },
        },
    },
}
