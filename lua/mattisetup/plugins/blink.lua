return {
	'saghen/blink.cmp',
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	dependencies = { 'rafamadriz/friendly-snippets', 'echasnovski/mini.snippets' },
	-- use a release tag to download pre-built binaries
	version = 'v1.*',
	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- On musl libc based systems you need to add this flag
	-- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',

	opts = {
		snippets = { preset = 'mini_snippets' },
		-- for keymap, all values may be string | string[]
		-- use an empty table to disable a keymap
		keymap = {
			preset = 'none',

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
		cmdline = {
			sources = function()
				local type = vim.fn.getcmdtype()
				-- Search forward and backward
				if type == '/' or type == '?' then return { 'buffer' } end
				-- Commands
				if type == ':' or type == '@' then return { 'cmdline' } end
				return {}
			end,
			keymap = {
				preset = 'none',

				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
				['<C-e>'] = { 'hide', 'fallback' },
				['<CR>'] = { 'accept', 'fallback' },

				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-j>'] = { 'select_next', 'fallback' },

				['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

				['<Tab>'] = { 'show_and_insert', 'select_next' },
				['<S-Tab>'] = { 'show_and_insert', 'select_prev' },
			},
			completion = { ghost_text = { enabled = false } },
		},
		completion = {
			keyword = {
				range = 'full',
			},

			list = {
				selection = {
					preselect = false,
					auto_insert = function(ctx)
						return ctx.mode == 'cmdline'
					end
				}
			},

			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				border = 'rounded',
				scrollbar = false,
				draw = {
					columns = { { 'label', 'label_description', gap = 1 }, { 'kind', 'kind_icon', gap = 1 } }
				},
			},
			documentation = {
				-- treesitter_highlighting = false,
				auto_show = true,
				auto_show_delay_ms = 100,
				window = {
					border = 'rounded',
				}
			},
		},
		signature = {
			enabled = true,
			window = {
				border = 'rounded',
				scrollbar = false,
			}
		},
		sources = {
			default = { "lsp", "path", "snippets",
				-- "buffer"
			},
			per_filetype = {
				lua = { 'lazydev', 'lsp', 'path', 'snippets',
					-- 'buffer',
				},
				sql = { 'lsp', 'path', 'snippets', 'buffer', 'dadbod' },
			},
			providers = {
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100
				},
			},
		},

		-- allows extending the enabled_providers array elsewhere in your config
		-- without having to redefine it
		-- opts_extend = { "sources.completion.enabled_providers" }
	}
}
