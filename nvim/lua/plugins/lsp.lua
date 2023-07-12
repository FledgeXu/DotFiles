return {
    "neovim/nvim-lspconfig",
    cmd = "Mason",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
        },
        "folke/neodev.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neoconf.nvim",
        "neovim/nvim-lspconfig",
        "glepnir/lspsaga.nvim",
        {
            "j-hui/fidget.nvim",
            tag = 'legacy',
        },
    },
    config = function()
        local servers = {
            "lua_ls",
            "pyright",
            "jsonls",
            "marksman",
            "volar",
            "dockerls",
            "docker_compose_language_service",
            "bashls",
            "ocamllsp",
            "taplo",
            "ruff_lsp",
        }
        require("neoconf").setup()
        require("neodev").setup()
        require("fidget").setup()
        require("lspsaga").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = servers,
            handlers = {
                function(server_name)     -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = require('cmp_nvim_lsp').default_capabilities()
                    }
                end,
            }
        })
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
                vim.keymap.set('n', 'gd', "<cmd>Lspsaga goto_definition<CR>", opts)
                vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
                vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opts)
                vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>qf', "<cmd>Lspsaga code_action<CR>", opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', "<cmd>Lspsaga rename ++project<CR>", opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
    end
}
