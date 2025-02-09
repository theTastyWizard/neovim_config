return {
	'mrcjkb/haskell-tools.nvim',
	version = '^4', -- Recommended
	-- lazy = false, -- This plugin is already lazy
	ft = { "haskell" },
	keys = {
		{ "<leader>hr", "<cmd>Haskell repl toggle<cr>", ft = "haskell", desc = "toggle ghci repl" },
	}
}
