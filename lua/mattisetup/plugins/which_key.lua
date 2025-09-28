return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		show_help = false,
		filter = function(mapping)
			-- exclude mapping without description
			return mapping.desc and mapping.desc ~= ""
		end,
		-- sort = { "local", "order", "group", "manual", "mod" },
		icons = {
			separator = "",
		},
		-- delay = 100,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps",
		},
	},
}
