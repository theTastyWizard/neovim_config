return {
	{
		'MeanderingProgrammer/render-markdown.nvim',
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		ft = { "markdown" },
		opts = {
			heading = {
				position = 'inline',
				sign = false,
				-- width = 'block',
				-- left_margin = 0.5,
				-- left_pad = 0.2,
				-- right_pad = 0.2,
			},
			code = {
				sign = false,
				width = 'block',
				left_margin = 0.5,
				left_pad = 0.02,
				right_pad = 0.02,
				language_pad = 0.01,
				min_width = 60,
			},
			checkbox = {
				checked = { scope_highlight = '@markup.strikethrough' }, --TODO: bæta við þema
			},
		},
	},
	{
		"OXY2DEV/markview.nvim",
		cond = false,
		lazy = true, -- false Recommended
		ft = "markdown", -- If you decide to lazy-load anyway

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			'echasnovski/mini.icons'
		},
		config = function()
			local presets = require("markview.presets");

			require("markview").setup({
				checkboxes = presets.checkboxes.nerd,
				headings = presets.headings.marker
			});
			require("markview.extras.checkboxes").setup({
				--- When true, list item markers will
				--- be removed.
				remove_markers = false,

				--- If false, running the command on
				--- visual mode doesn't change the
				--- mode.
				exit = false,

				default_marker = "-",
				default_state = "X",

				--- A list of states
				states = {
					{ " ", "X" },
					{ "-", "o", "~" }
				}
			});
		end

	}
}
