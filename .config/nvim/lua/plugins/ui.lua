return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            local auto_theme_custom = require("lualine.themes.auto")
            require("lualine").setup({ theme = auto_theme_custom })
        end,
    },
    {
        "utilyre/barbecue.nvim",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            show_modified = true,
            custom_section = function()
                return "%m%F"
            end,
        },
    },
    {
        "b0o/incline.nvim",
        enabled = false,
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        event = "VeryLazy",
        config = function()
            local devicons = require("nvim-web-devicons")
            require("incline").setup({
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if filename == "" then
                        filename = "[No Name]"
                    end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)

                    local function get_git_diff()
                        local icons = { removed = "", changed = "", added = "" }
                        local signs = vim.b[props.buf].gitsigns_status_dict
                        local labels = {}
                        if signs == nil then
                            return labels
                        end
                        for name, icon in pairs(icons) do
                            if tonumber(signs[name]) and signs[name] > 0 then
                                table.insert(labels, { icon .. " " .. signs[name] .. " ", group = "Diff" .. name })
                            end
                        end
                        if #labels > 0 then
                            table.insert(labels, { "┊ " })
                        end
                        return labels
                    end

                    local function get_diagnostic_label()
                        local icons = { error = "", warn = "", info = "", hint = "" }
                        local label = {}

                        for severity, icon in pairs(icons) do
                            local n = #vim.diagnostic.get(
                                props.buf,
                                { severity = vim.diagnostic.severity[string.upper(severity)] }
                            )
                            if n > 0 then
                                table.insert(label, { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity })
                            end
                        end
                        if #label > 0 then
                            table.insert(label, { "┊ " })
                        end
                        return label
                    end

                    return {
                        { get_diagnostic_label() },
                        { get_git_diff() },
                        { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
                        { filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
                        -- { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
                    }
                end,
            })
        end,
        -- Optional: Lazy load Incline
    },
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("alpha").setup(require("alpha.themes.startify").config)
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {
            scope = {
                enabled = false,
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            attach_to_untracked = true,
        },
        config = true,
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            {
                "css",
                "javascript",
                "typescript",
                "html",
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require("illuminate").configure()
        end,
    },
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({
                extra_groups = {
                    "NeoTreeNormal",
                    "NeoTreeNormalNC",
                    "NormalFloat",
                    "FoldColumn",
                    "FloatBorder",
                    "FloatTitle",
                },
                exclude_groups = {
                    "NotifyBackground",
                    "CursorLine",
                },
            })
            if vim.g.neovide then
                vim.cmd("TransparentDisable")
            else
                vim.cmd("TransparentEnable")
            end
        end,
    },
}
