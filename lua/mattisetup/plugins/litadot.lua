return {
	{
		"rktjmp/lush.nvim",
		cmd = { "Lushify", "LushImport", "LushRunTutorial" },
		-- if you wish to use your own colorscheme:
		-- { dir = '/absolute/path/to/colorscheme', lazy = true },
	},
	{
		"catgoose/nvim-colorizer.lua",
		cond = false,
		event = "BufReadPre",
		opts = { -- set to setup table
			buftypes = {
				"!snacks_notif"
			},
			user_default_options = {
				names = false,
				hsl_fn = true,
				mode = "virtualtext",
				tailwind = "lsp",
				virtualtext_inline = false,
			},
		},
	},
	{
		"max397574/colortils.nvim",
		cmd = "Colortils",
		config = function()
			require("colortils").setup({
				default_format = "hls",
			})
		end,
	},
	{
		'brenoprata10/nvim-highlight-colors',
		config = function()
			require('nvim-highlight-colors').setup({
				enable_named_colors = false,
				enable_short_hex = false,
				excluded_filetypes = { "snacks_notif" },
				excluded_buftypes = { "snacks_notif" }
			})
		end
	},
	{
		"uga-rosa/ccc.nvim",
		cmd = { "CccHighlighterEnable" },
		config = function()
			require("ccc").setup({})
		end
	},
	{
		{ "nvzone/volt", lazy = true },
		{
			"nvzone/minty",
			cmd = { "Shades", "Huefy" },
		}
	}
}
