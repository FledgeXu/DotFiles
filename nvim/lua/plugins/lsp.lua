return {
    "neovim/nvim-lspconfig",
    cmd = { "Mason", "MasonUpdate" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
        },
        "folke/neodev.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "nvimdev/lspsaga.nvim",
        {
            "j-hui/fidget.nvim",
            tag = 'legacy',
        },
        "mfussenegger/nvim-jdtls",
    },
    config = function()
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            },
            pyright = {},
            jsonls = {},
            marksman = {},
            dockerls = {},
            docker_compose_language_service = {},
            bashls = {},
            ocamllsp = {},
            taplo = {},
            ruff_lsp = {},
            hls = {},
            html = {},
            rust_analyzer = {},
            -- tsserver = {},
            -- tailwindcss = {},
            clangd = {},
            -- volar = {},
            -- jdtls = {},
            cmake = {},
        }
        require("neodev").setup()
        require("fidget").setup {
            window = {
                relative = "editor",
                blend = 0,
            }
        }
        require("lspsaga").setup({
            lightbulb = {
                enable = false,
            }
        })
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        for server, config in pairs(servers) do
            require("lspconfig")[server].setup(
                vim.tbl_deep_extend("keep",
                    { on_attach = on_attach, capabilities = require('cmp_nvim_lsp').default_capabilities() },
                    config
                )
            )
        end
        -- Enable lsconfig --
        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                -- We need a specific threat for the "term_toggle", it must be a global mapping, not a buffer mapping.
                vim.keymap.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>",
                    { noremap = true, silent = true })
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', require "telescope.builtin".lsp_definitions, opts)
                vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
                vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opts)
                vim.keymap.set('n', '<leader>gi', require "telescope.builtin".lsp_implementations, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>da', require "telescope.builtin".diagnostics, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', "<cmd>Lspsaga rename ++project<CR>", opts)
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', "<cmd>Lspsaga code_action<CR>", opts)
                vim.keymap.set('n', 'gr', require "telescope.builtin".lsp_references, opts)
                vim.keymap.set('n', 'sd', "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
                -- vim.keymap.set('n', '<space>f', function()
                --     vim.lsp.buf.format { async = true }
                -- end, opts)
            end,
        })

        -- custom signs
        local signs = { Error = "•", Warn = "•", Hint = "•", Info = "•" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
    end
}
