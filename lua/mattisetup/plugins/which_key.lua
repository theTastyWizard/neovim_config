return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		-- delay = 100,
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		-- win = {
		--     border = "rounded"
		-- },
		-- layout = {
		--     align = "center",
		-- }
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		}
	},
}
