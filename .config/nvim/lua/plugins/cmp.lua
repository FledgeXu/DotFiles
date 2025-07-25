return {
    "hrsh7th/nvim-cmp",
    event = { "UIEnter" },
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lua",
        {
            "L3MON4D3/LuaSnip",
            dependencies = { "rafamadriz/friendly-snippets" },
        },
        "saadparwaiz1/cmp_luasnip",
        -- {
        --     "zbirenbaum/copilot-cmp",
        --     dependencies = { "zbirenbaum/copilot.lua" },
        --     config = function()
        --         require("copilot").setup({
        --             suggestion = { enabled = false },
        --             panel = { enabled = false },
        --         })
        --         require("copilot_cmp").setup()
        --     end,
        -- },
    },

    config = function()
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local defaults = require("cmp.config.default")()

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({
                    symbol_map = { Copilot = "" },
                }),
            },
            view = {
                docs = {
                    auto_open = false,
                },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            completion = {
                completeopt = table.concat(vim.opt.completeopt:get(), ","),
            },
            -- sorting = defaults.sorting,
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<c-n>"] = cmp.mapping(function()
                    luasnip.jump(1)
                end, { "i", "s" }),
                ["<c-p>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-g>"] = function()
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                end,
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                -- { name = "copilot" },
                { name = "nvim_lua" },
                { name = "luasnip" }, -- For luasnip users.
                { name = "buffer" },
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            }),
            experimental = {
                ghost_text = true,
            },
        })
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
                { name = "cmdline" },
            }),
        })
    end,
}
