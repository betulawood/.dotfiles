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
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			local on_attach = function(_, bufnr)
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<C-b>", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
