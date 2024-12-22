return {
	{
		"xero/miasma.nvim",
		lazy = false,
	},
	{
		"cpwrs/americano.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require('americano').setup({
				terminal = true, -- Set terminal colors
				overrides = {}, -- Override americano highlight groups
			})
		end
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			-- use the night style
	-- 			style = "moon",
	-- 			-- disable italic for functions
	-- 			styles = {
	-- 				functions = {}
	-- 			},
	-- 			-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	-- 			on_colors = function(colors)
	-- 				colors.bg = "#120f12"
	-- 				colors.bg_dark = "#000000"
	-- 				-- colors.blue0 = "#00948b" -- "#3e68d7",
	-- 				-- colors.comment = '#169c4b' -- "#636da6",
	-- 				colors.cyan = "#00ffff" --#86e1fc",
	-- 				colors.fg = "#e7e7e7" --"#c8d3f5",
	-- 				colors.fg_dark = "#df206c"
	-- 				colors.green = "#1dd361"
	-- 				colors.green1 = "#02d849" --"#4fd6be",
	-- 				colors.green2 = '#169c4b' --"#41a6b5",
	-- 				colors.magenta = '#ff0066' --"#ff007c",
	-- 				colors.magenta2 = "#cd6689" --"#843c54", --"#dbb7bc"--"#c099ff",
	-- 				colors.orange = "#ff661a" --"#e6550d"
	-- 				colors.purple = "#6600ff" --"#fca7ea",
	-- 				colors.red = "#ca0019"
	-- 				colors.teal = "#21c992" --"#4fd6be",
	-- 				colors.terminal_black = "#120f12"
	-- 				colors.yellow = "#e59500" --"#ffa600",
	-- 				colors.git.add ="#ff661a"
	-- 				colors.git.change = "#21c992"
	-- 				colors.git.delete = "#ca0019"
	-- 			end
	-- 		})
	-- 		vim.cmd [[colorscheme tokyonight]]
	-- 	end,
	-- },
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
				base02 = '#2d2c2d',--visual selected breytt til að sjá betur
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
            vim.api.nvim_set_hl(0, 'NormalMode', {fg = "#ffa600", bg = '#120f12'  })
            vim.api.nvim_set_hl(0, 'InsertMode', {fg = "#ff0066" })
            vim.api.nvim_set_hl(0, 'VisualMode', {fg = "#00ff66" })
            vim.api.nvim_set_hl(0, 'CommandMode', {fg = "#6600ff" })
            vim.api.nvim_set_hl(0, 'ReplaceMode', {fg = "#ffa600" })
            vim.api.nvim_set_hl(0, 'SelectMode', {fg = "#ffa600" })
            vim.api.nvim_set_hl(0, 'TerminalMode', {fg = "#ffa600" })
            vim.api.nvim_set_hl(0, 'TerminalNormalMode', {fg = "#ffa600" })
            -- vim.cmd [[colorscheme base16-pinky]]
        end
	},
	-- {
	--     "RRethy/base16-nvim",
	--     lazy = false,
	--     priority = 1000,
	--     opts = {},
	--     config = function()
	--         require('base16-colorscheme').with_config({
	--             telescope = false,
	--         })
	--         require('base16-colorscheme').setup({
	--             -- isotope
	--             base00 = "#000000",
	--             base01 = "#404040",
	--             base02 = "#606060",
	--             base03 = "#808080",
	--             base04 = "#c0c0c0",
	--             base05 = "#d0d0d0",
	--             base06 = "#e0e0e0",
	--             base07 = "#ffffff",
	--             base08 = "#ff0000",
	--             base09 = "#ff9900",
	--             base0A = "#ff0099",
	--             base0B = "#33ff00",
	--             base0C = "#00ffff",
	--             base0D = "#0066ff",
	--             base0E = "#cc00ff",
	--             base0F = "#3300ff",
	--         })
	--     end
	-- },
	-- {
	--     "RRethy/base16-nvim",
	--     lazy = false,
	--     priority = 1000,
	--     opts = {},
	--     config = function()
	--         require('base16-colorscheme').with_config({
	--             telescope = false,
	--         })
	--         require('base16-colorscheme').setup({
	--             -- spaceduck
	--             base00 = "#16172d",
	--             base01 = "#1b1c36",
	--             base02 = "#30365F",
	--             base03 = "#686f9a",
	--             base04 = "#818596",
	--             base05 = "#ecf0c1",
	--             base06 = "#c1c3cc",
	--             base07 = "#ffffff",
	--             base08 = "#e33400",
	--             base09 = "#e39400",
	--             base0A = "#f2ce00",
	--             base0B = "#5ccc96",
	--             base0C = "#00a3cc",
	--             base0D = "#7a5ccc",
	--             base0E = "#b3a1e6",
	--             base0F = "#ce6f8f",
	--         })
	--     end
	-- },
	-- {
	--     "RRethy/base16-nvim",
	--     lazy = false,
	--     priority = 1000,
	--     opts = {},
	--     config = function()
	--         require('base16-colorscheme').with_config({
	--             telescope = false,
	--         })
	--         require('base16-colorscheme').setup({
	--             -- setja saman mitt eigið
	--             base00 = "#000000",
	--             base01 = "#404040",
	--             base02 = "#606060",
	--             base03 = "#808080",
	--             base04 = "#c0c0c0",
	--             base05 = "#d0d0d0",
	--             base06 = "#e0e0e0",
	--             base07 = "#ffffff",
	--             base08 = "#fb0120", --red
	--             base09 = '#e6550d', --"#ff661a" --orange
	--             base0A = "#ffa600", --yellow
	--             base0B = "#1dd361", --"#02d849"--"#50fa7b" --green
	--             base0C = "#21c992", --aqua
	--             base0D = "#00948b", --blue
	--             base0E = "#d8137f", --"#700f98"--"#a71d5d"--purple
	--             base0F = "#ff0099",       --brown
	--         })
	--     end
	-- },
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
	-- {
	--     "bradcush/nvim-base16",
	--     lazy = false,
	--     priority = 1000,
	--     opts = {},
	--     config = function()
	--         -- vim.cmd [[colorscheme base16-pinky]]
	--     end
	-- },
}
