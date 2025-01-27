return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "gopls", "rust_analyzer" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            setup = {
                rust_analzer = function()
                    return true
                end,
            },
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<C-b>", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, {})
            vim.lsp.inlay_hint.enable(true, {0})
        end,
    },
}
