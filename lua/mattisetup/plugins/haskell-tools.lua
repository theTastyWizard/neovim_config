return {
	'mrcjkb/haskell-tools.nvim',
	version = '^4', -- Recommended
	lazy = false, -- This plugin is already lazy
	keys = {
		{ "<leader>hr", "<cmd>Haskell repl toggle<cr>", desc = "toggle ghci repl" },
	},
}
