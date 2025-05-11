return {
	'neovim/nvim-lspconfig',
	cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
	},
	config = function()
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities()
		})

		require("mason").setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓ ",
					package_pending = "➜ ",
					package_uninstalled = "✗ "
				},
			},
			registries = {
				'github:nvim-java/mason-registry', -- til þess að fá fyrir nvim-java
				'github:mason-org/mason-registry',
			},
		})

		require('mason-lspconfig').setup({
			ensure_installed = { "lua_ls", "bashls", "clangd", "tinymist" },
			automatic_enable = true,
		})
	end
}
