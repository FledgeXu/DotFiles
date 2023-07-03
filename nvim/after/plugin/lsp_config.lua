-- LSP Server Lists --
local servers = {
    "lua_ls",
    "pyright",
    "jsonls",
    "marksman",
    "volar",
    "dockerls",
    "docker_compose_language_service",
    "bashls",
}
local luasnip = require("luasnip")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
require("luasnip.loaders.from_vscode").lazy_load()
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
})
require("lspsaga").setup({})

-- nvim-cmp Settings --
local cmp = require('cmp')

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})


-- null_ls Settings --
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
    },
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
        vim.keymap.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", { noremap = true, silent = true })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', "<cmd>Lspsaga goto_definition<CR>", opts)
        vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
        vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
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

capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup {
        capabilities = capabilities,
    }
end
