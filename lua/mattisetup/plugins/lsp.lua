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

		-- lsp_attach is where you enable features that only work
		-- if there is a language server active in the file
		local lsp_attach = function(client, bufnr)
			local opts = { buffer = bufnr }

			--todo: finna betri remap fyrir lsp dót
			vim.keymap.set('n', 'æ', '<cmd>lua vim.lsp.buf.hover({border = "rounded"})<cr>', opts)
			-- vim.keymap.set('n', ',', '<cmd>lua vim.lsp.buf.hover({border = "rounded"})<cr>', opts)
			vim.keymap.set('n', 'Æ', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
			vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
			vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
			-- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
			vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
			-- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
			vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
			-- vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
			vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
		end
	end
}
