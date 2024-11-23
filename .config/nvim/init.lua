-- Load settings, keymaps, and plugins
require('settings')
require('keymaps')
require('plugins')

-- Mason Setup: Manage LSP installations
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "pyright", "rust_analyzer", "gopls" }, -- Install these language servers
}

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For LuaSnip users
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    })
}

-- LSP configuration
local lspconfig = require('lspconfig')

-- Attach nvim-cmp to LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure servers
local servers = { "pyright", "rust_analyzer", "gopls" }
for _, server in ipairs(servers) do
    lspconfig[server].setup {
        capabilities = capabilities,
    }
end
