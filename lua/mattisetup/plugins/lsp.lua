return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v4.x',
		lazy = true,
		config = false,
	},
	-- Autocompletion
	{
		-- 'hrsh7th/nvim-cmp',
		-- 'yioneko/nvim-cmp', -- miklu hraðari en venjulega, bíða eftir að því er mergað
		-- branch = 'perf-up',
		"iguanacucumber/magazine.nvim", --inniheldur yionek patchið og fleiri
		name = "nvim-cmp",        -- Otherwise highlighting gets messed up
		-- event = 'InsertEnter', -- til að það virki í :command mode
		dependencies = {
			{ 'L3MON4D3/LuaSnip' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			local cmp = require('cmp')

			-- svo friendly snippets virki
			require('luasnip.loaders.from_vscode').lazy_load()

			local kind_icons = {
				Text = "",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰂡",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰅲",
			}
			cmp.setup({
				-- formatting = require('lsp-zero').cmp_format({ details = true }),
				formatting = {
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
						return vim_item
					end
				},

				sources = {
					{ name = 'path' },
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'luasnip' },
				},
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					-- Enter to confirm selected suggestion
					['<CR>'] = cmp.mapping.confirm({ select = false , behavior = cmp.ConfirmBehavior.Replace}),
					-- Ctrl+j/k to select next item auk <C-p> og <C-n>
					['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
					['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),

				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})

			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{
						name = 'cmdline',
						option = {
							ignore_cmds = { 'Man', '!' }
						}
					}
				})
			})
		end
	},
	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
		},
		config = function()
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
			local lsp_zero = require('lsp-zero')

			lsp_zero.ui({ float_border = 'rounded', })

			require('lspconfig.ui.windows').default_options.border = "rounded"

			-- lsp_attach is where you enable features that only work
			-- if there is a language server active in the file
			local lsp_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set('n', 'æ', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
				vim.keymap.set('n', 'Æ', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
				vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
				vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
			end

			lsp_zero.extend_lspconfig({
				lsp_attach = lsp_attach,
				capabilities = require('cmp_nvim_lsp').default_capabilities()
			})

			require('mason-lspconfig').setup({
				ensure_installed = {},
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,
				}
			})
		end
	}
}
