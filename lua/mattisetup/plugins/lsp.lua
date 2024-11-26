return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v4.x',
		lazy = true,
		config = false,
	},
	-- Autocompletion
	{
		'saghen/blink.cmp',
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = 'rafamadriz/friendly-snippets',

		-- use a release tag to download pre-built binaries
		version = 'v0.*',
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- On musl libc based systems you need to add this flag
		-- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',

		opts = {
			-- for keymap, all values may be string | string[]
			-- use an empty table to disable a keymap
			keymap = {
				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
				['<C-e>'] = { 'hide', 'fallback' },
				['<CR>'] = { 'accept', 'fallback' },

				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-j>'] = { 'select_next', 'fallback' },

				['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

				['<C-b>'] = { 'snippet_backward', 'fallback' },
				['<C-f>'] = { 'snippet_forward', 'fallback' },
			},

			accept = {
				create_undo_point = true,
				expand_snippet = vim.snippet.expand,
				auto_brackets = {
					enabled = true,
					default_brackets = { '(', ')' },
					override_brackets_for_filetypes = {},
					-- Overrides the default blocked filetypes
					force_allow_filetypes = {},
					blocked_filetypes = {},
					-- Synchronously use the kind of the item to determine if brackets should be added
					kind_resolution = {
						enabled = true,
						blocked_filetypes = { 'typescriptreact', 'javascriptreact', 'vue' },
					},
					-- Asynchronously use semantic token to determine if brackets should be added
					semantic_token_resolution = {
						enabled = true,
						blocked_filetypes = {},
						-- How long to wait for semantic tokens to return before assuming no brackets should be added
						timeout_ms = 400,
					},
				},
			},

			trigger = {
				completion = {
					-- 'prefix' will fuzzy match on the text before the cursor
					-- 'full' will fuzzy match on the text before *and* after the cursor
					-- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
					keyword_range = 'full',
				},

				signature_help = {
					enabled = true,
					blocked_trigger_characters = {},
					blocked_retrigger_characters = {},
					-- when true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
					show_on_insert_on_trigger_character = true,
				},
			},

			fuzzy = {
				-- when enabled, allows for a number of typos relative to the length of the query
				-- disabling this matches the behavior of fzf
				use_typo_resistance = true,
				-- frencency tracks the most recently/frequently used items and boosts the score of the item
				use_frecency = true,
				-- proximity bonus boosts the score of items matching nearby words
				use_proximity = true,
				max_items = 200,
				-- controls which sorts to use and in which order, these three are currently the only allowed options
				sorts = { 'label', 'kind', 'score' },

				prebuilt_binaries = {
					-- Whether or not to automatically download a prebuilt binary from github. If this is set to `false`
					-- you will need to manually build the fuzzy binary dependencies by running `cargo build --release`
					download = true,
					-- When downloading a prebuilt binary, force the downloader to resolve this version. If this is unset
					-- then the downloader will attempt to infer the version from the checked out git tag (if any).
					--
					-- Beware that if the FFI ABI changes while tracking main then this may result in blink breaking.
					force_version = nil,
					-- When downloading a prebuilt binary, force the downloader to use this system triple. If this is unset
					-- then the downloader will attempt to infer the system triple from `jit.os` and `jit.arch`.
					-- Check the latest release for all available system triples
					--
					-- Beware that if the FFI ABI changes while tracking main then this may result in blink breaking.
					force_system_triple = nil,
				},
			},

			sources = {
				-- list of enabled providers
				completion = {
					enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
				},

				-- Please see https://github.com/Saghen/blink.compat for using `nvim-cmp` sources
				providers = {
					lsp = {
						name = 'LSP',
						module = 'blink.cmp.sources.lsp',

						--- *All* of the providers have the following options available
						--- NOTE: All of these options may be functions to get dynamic behavior
						--- See the type definitions for more information
						enabled = true, -- whether or not to enable the provider
						transform_items = nil, -- function to transform the items before they're returned
						should_show_items = true, -- whether or not to show the items
						max_items = nil, -- maximum number of items to return
						min_keyword_length = 0, -- minimum number of characters to trigger the provider
						fallback_for = {}, -- if any of these providers return 0 items, it will fallback to this provider
						score_offset = 0, -- boost/penalize the score of the items
						override = nil, -- override the source's functions
					},
					path = {
						name = 'Path',
						module = 'blink.cmp.sources.path',
						score_offset = 3,
						opts = {
							trailing_slash = false,
							label_trailing_slash = true,
							get_cwd = function(context) return vim.fn.expand(('#%d:p:h'):format(context.bufnr)) end,
							show_hidden_files_by_default = false,
						}
					},
					snippets = {
						name = 'Snippets',
						module = 'blink.cmp.sources.snippets',
						score_offset = -3,
						opts = {
							friendly_snippets = true,
							search_paths = { vim.fn.stdpath('config') .. '/snippets' },
							global_snippets = { 'all' },
							extended_filetypes = {},
							ignored_filetypes = {},
						}

						--- Example usage for disabling the snippet provider after pressing trigger characters (i.e. ".")
						-- enabled = function(ctx) return ctx ~= nil and ctx.trigger.kind == vim.lsp.protocol.CompletionTriggerKind.TriggerCharacter end,
					},
					buffer = {
						name = 'Buffer',
						module = 'blink.cmp.sources.buffer',
						fallback_for = { 'lsp' },
					},
				},
			},

			windows = {
				autocomplete = {
					min_width = 15,
					max_height = 10,
					border = 'rounded',
					winhighlight =
					'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
					-- keep the cursor X lines away from the top/bottom of the window
					scrolloff = 2,
					-- which directions to show the window,
					-- falling back to the next direction when there's not enough space
					direction_priority = { 's', 'n' },
					-- Controls whether the completion window will automatically show when typing
					auto_show = true,
					-- Controls how the completion items are selected
					-- 'preselect' will automatically select the first item in the completion list
					-- 'manual' will not select any item by default
					-- 'auto_insert' will not select any item by default, and insert the completion items automatically when selecting them
					selection = 'manual',
					-- Controls how the completion items are rendered on the popup window
					-- 'simple' will render the item's kind icon the left alongside the label
					-- 'reversed' will render the label on the left and the kind icon + name on the right
					-- 'minimal' will render the label on the left and the kind name on the right
					-- 'function(blink.cmp.CompletionRenderContext): blink.cmp.Component[]' for custom rendering
					-- draw = 'reversed',
					-- Controls the cycling behavior when reaching the beginning or end of the completion list.
					draw = {
						-- Aligns the keyword you've typed to a component in the menu
						align_to_component = 'label', -- or 'none' to disable
						-- Left and right padding, optionally { left, right } for different padding on each side
						padding = 1,
						-- Gap between columns
						gap = 1,
						-- Components to render, grouped by column
						columns = { { 'label', 'label_description', gap = 1 }, {'kind', 'kind_icon', gap=1} }
						-- for a setup similar to nvim-cmp: https://github.com/Saghen/blink.cmp/pull/245#issuecomment-2463659508
						-- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
					},
					cycle = {
						-- When `true`, calling `select_next` at the *bottom* of the completion list will select the *first* completion item.
						from_bottom = true,
						-- When `true`, calling `select_prev` at the *top* of the completion list will select the *last* completion item.
						from_top = true,
					},
				},
				documentation = {
					min_width = 10,
					max_width = 60,
					max_height = 20,
					border = 'rounded',
					winhighlight =
					'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
					-- which directions to show the documentation window,
					-- for each of the possible autocomplete window directions,
					-- falling back to the next direction when there's not enough space
					direction_priority = {
						autocomplete_north = { 'e', 'w', 'n', 's' },
						autocomplete_south = { 'e', 'w', 's', 'n' },
					},
					auto_show = true,
					auto_show_delay_ms = 150,
					update_delay_ms = 50,
					-- whether to use treesitter highlighting, disable if you run into performance issues
					-- WARN: temporary, eventually blink will support regex highlighting
					treesitter_highlighting = true,
				},
				signature_help = {
					min_width = 1,
					max_width = 100,
					max_height = 10,
					border = 'rounded',
					winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
					scrollbar = false,
					-- which directions to show the window,
					-- falling back to the next direction when there's not enough space
					direction_priority = { 'n', 's' },
					-- whether to use treesitter highlighting, disable if you run into performance issues
					-- WARN: temporary, eventually blink will support regex highlighting
					treesitter_highlighting = true,
				},
				ghost_text = {
					enabled = false,
				}
			},

			highlight = {
				ns = vim.api.nvim_create_namespace('blink_cmp'),
				-- sets the fallback highlight groups to nvim-cmp's highlight groups
				-- useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release, assuming themes add support
				use_nvim_cmp_as_default = true,
			},

			-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono',

			-- allows extending the enabled_providers array elsewhere in your config
			-- without having to redefine it
			opts_extend = { "sources.completion.enabled_providers" }

		}
	},
	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
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
				-- capabilities = require('cmp_nvim_lsp').default_capabilities()
				capabilities = require('blink.cmp').get_lsp_capabilities()
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
