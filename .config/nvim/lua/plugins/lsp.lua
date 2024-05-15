return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        {
            "mfussenegger/nvim-jdtls",
            ft = { "java" },
        },
        {
            "williamboman/mason.nvim",
            cmd = { "Mason", "MasonUpdate" },
            build = ":MasonUpdate",
        },
        "folke/neodev.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        {
            "j-hui/fidget.nvim",
            event = { "BufReadPost", "BufNewFile" },
            opts = {
                notification = {
                    window = {
                        winblend = 0,
                    },
                },
            },
        },
    },
    config = function()
        local servers = {
            lua_ls = {
                config = {
                    settings = {
                        Lua = {
                            workspace = { checkThirdParty = false },
                            telemetry = { enable = false },
                            hint = {
                                enable = true,
                            },
                        },
                    },
                },
            },
            pyright = {
                config_only = true,
                -- config = {
                --     cmd = { 'delance-langserver', '--stdio' },
                -- }
            },
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
            tsserver = {},
            tailwindcss = {},
            clangd = {
                config = {
                    cmd = {
                        -- Conflict with copilot lsp, copilot only support UTF-16, which is sucks.
                        -- https://github.com/zbirenbaum/copilot.lua/issues/118
                        "clangd",
                        "--offset-encoding=utf-16",
                    },
                },
            },
            volar = { install_only = true },
            jdtls = { install_only = true },
            cmake = {},
            pest_ls = {},
            clojure_lsp = {},
            intelephense = {},
        }
        require("neodev").setup()
        require("mason").setup()
        local install_servers = {}
        for server, config in pairs(servers) do
            if not config["config_only"] then
                table.insert(install_servers, server)
            end
        end
        require("mason-lspconfig").setup({
            ensure_installed = install_servers,
        })
        -- require("mason-lspconfig").setup({
        --     ensure_installed = vim.tbl_keys(servers),
        -- })

        for server, config in pairs(servers) do
            if not config["install_only"] then
                require("lspconfig")[server].setup(
                    vim.tbl_deep_extend(
                        "keep",
                        { capabilities = require("cmp_nvim_lsp").default_capabilities() },
                        config["config"] and config["config"] or {}
                    )
                )
            end
        end

        -- Enable lsconfig --
        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- vim.lsp.inlay_hint.enable()
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                -- We need a specific threat for the "term_toggle", it must be a global mapping, not a buffer mapping.
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>gi", require("telescope.builtin").lsp_implementations, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>da", require("telescope.builtin").diagnostics, opts)
                vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set("n", "<space>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
            end,
        })
    end,
}
