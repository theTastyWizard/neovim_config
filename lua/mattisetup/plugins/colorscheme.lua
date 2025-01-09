return {
	{
		"RRethy/base16-nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require('base16-colorscheme').with_config({
				telescope = false,
			})
			require('base16-colorscheme').setup({ --óbreytt er pinky
				-- base00 = '#171517', -- original pinky
				base00 = '#120f12',      -- 2 shade af pinky orig
				-- base00 = '#111111', --bakgrunnur frá colors
				-- base00 = '#000000', -- alveg svartur bakgrunnur
				base01 = '#1b181b',
				base02 = '#2d2c2d', --visual selected breytt til að sjá betur
				-- base02 = '#1E3232',
				base03 = '#117c3c', --comments breytt til að sjá betur
				-- '#169c4b',
				-- #5100cc'
				-- #00ff66',

				-- #4700b2
				-- #b27400
				-- #a2626d
				-- #b26c78
				-- #937979
				-- #1E2832
				-- #1E3232
				-- #333133
				-- #944866
				-- #ff7fb2
				-- #b21956
				-- #cc0051
				-- #169c4b
				base04 = '#e7dbdb',
				base05 = '#f5f5f5',
				base06 = '#ffffff',
				base07 = '#f7f3f7',
				base08 = '#ffa600',
				base09 = '#00ff66',
				base0A = '#20df6c',
				base0B = '#ff0066',
				base0C = '#6600ff',
				base0D = '#00ffff',
				base0E = '#007fff',
				base0F = '#df206c'
			})
			vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#120f12' })
			vim.api.nvim_set_hl(0, 'NormalMode', { fg = "#ffa600", bg = '#120f12' })
			vim.api.nvim_set_hl(0, 'InsertMode', { fg = "#ff0066" })
			vim.api.nvim_set_hl(0, 'VisualMode', { fg = "#00ff66" })
			vim.api.nvim_set_hl(0, 'CommandMode', { fg = "#6600ff" })
			vim.api.nvim_set_hl(0, 'ReplaceMode', { fg = "#ffa600" })
			vim.api.nvim_set_hl(0, 'SelectMode', { fg = "#ffa600" })
			vim.api.nvim_set_hl(0, 'TerminalMode', { fg = "#ffa600" })
			vim.api.nvim_set_hl(0, 'TerminalNormalMode', { fg = "#ffa600" })
		end
	},
	{
		"xero/miasma.nvim",
		cond = false,
		lazy = false,
	},
	{
		"jackplus-xyz/binary.nvim",
		cond = false,
		opts = {
			style = "dark",
			colors = {
				-- bg = "#FFB400",
				bg = "#f5f5f5",
				fg = "#120f12"
			},
			-- Customize the reversed groups
			reversed_group = {
				Title = true, -- Add a new reversed group
				Search = false, -- Disable a default reversed group
			},
		},
	},
	{
		'jesseleite/nvim-noirbuddy',
		cond = false,
		dependencies = {
			{ 'tjdevries/colorbuddy.nvim' }
		},
		lazy = false,
		priority = 1000,
		opts = {
			colors = {
				primary = "#ff661a",
				-- secondary = "",
				background = '#120f12',
			}
		}
	},
	{
		"loctvl842/monokai-pro.nvim",
		cond = false,
		config = function()
			require("monokai-pro").setup({
				transparent_background = false,
				terminal_colors = true,
				devicons = true, -- highlight the icons of `nvim-web-devicons`
				styles = {
					comment = { italic = true },
					keyword = { italic = true }, -- any other keyword
					type = { italic = true }, -- (preferred) int, long, char, etc
					storageclass = { italic = true }, -- static, register, volatile, etc
					structure = { italic = true }, -- struct, union, enum, etc
					parameter = { italic = true }, -- parameter pass in function
					annotation = { italic = true },
					tag_attribute = { italic = true }, -- attribute of tag in reactjs
				},
				filter = "spectrum",    -- classic | octagon | pro | machine | ristretto | spectrum
				-- Enable this will disable filter option
				day_night = {
					enable = false, -- turn off by default
					day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
					night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
				},
				inc_search = "background", -- underline | background
				background_clear = {
					-- "float_win",
					"toggleterm",
					"telescope",
					"which-key",
					"renamer",
					"notify",
					-- "nvim-tree",
					-- "neo-tree",
					-- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
				}, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
				plugins = {
					bufferline = {
						underline_selected = false,
						underline_visible = false,
					},
					indent_blankline = {
						context_highlight = "default", -- default | pro
						context_start_underline = false,
					},
				},
				-- ---@param c Colorscheme
				-- override = function(c) end,
				-- ---@param cs Colorscheme
				-- ---@param p ColorschemeOptions
				-- ---@param Config MonokaiProOptions
				-- ---@param hp Helper
				-- override = function(cs: Colorscheme, p: ColorschemeOptions, Config: MonokaiProOptions, hp: Helper) end,
			})
			-- vim.cmd [[colorscheme monokai-pro]]
		end
	},
	{
		"folke/tokyonight.nvim",
		cond = false,
		config = function()
			require("tokyonight").setup({
				-- use the night style
				style = "moon",
				-- disable italic for functions
				styles = {
					functions = {}
				},
				-- Change the "hint" color to the "orange" color, and make the "error" color bright red
				on_colors = function(colors)
					colors.bg = "#120f12"
					colors.bg_dark = "#000000"
					-- colors.blue0 = "#00948b" -- "#3e68d7",
					-- colors.comment = '#169c4b' -- "#636da6",
					colors.cyan = "#00ffff" --#86e1fc",
					colors.fg = "#e7e7e7" --"#c8d3f5",
					colors.fg_dark = "#df206c"
					colors.green = "#1dd361"
					colors.green1 = "#02d849" --"#4fd6be",
					colors.green2 = '#169c4b' --"#41a6b5",
					colors.magenta = '#ff0066' --"#ff007c",
					colors.magenta2 = "#cd6689" --"#843c54", --"#dbb7bc"--"#c099ff",
					colors.orange = "#ff661a" --"#e6550d"
					colors.purple = "#6600ff" --"#fca7ea",
					colors.red = "#ca0019"
					colors.teal = "#21c992" --"#4fd6be",
					colors.terminal_black = "#120f12"
					colors.yellow = "#e59500" --"#ffa600",
					colors.git.add = "#ff661a"
					colors.git.change = "#21c992"
					colors.git.delete = "#ca0019"
				end
			})
			vim.cmd [[colorscheme tokyonight]]
		end,
	},
	-- base16-hardcore
	-- base16-helios
	-- base16-isotope
	-- base16-pico
	-- base16-atelier-forest
	-- base16-bright
	-- base16-equilibrium-dark
	-- base16-equilibrium-gray-dark
	-- base16-framer
	-- base16-gigavolt
	-- base16-gruvbox-dark-hard
	-- base16-monokai
	-- base16-purpledream
	-- base16-standardized-dark
	-- base16-synth-midnight-dark
	-- base16-summerfruit-dark
	-- base16-unikitty-dark
}
