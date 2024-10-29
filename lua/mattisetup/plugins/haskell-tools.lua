return {
	'mrcjkb/haskell-tools.nvim',
	version = '^4', -- Recommended
	lazy = false, -- This plugin is already lazy
	config = function()
		local wk = require("which-key")
		local hs = require("haskell-tools")
		wk.add({
			{ "<leader>h",  group = "Haskell" },
			{ "<leader>hr", "ht.repl.toggle", desc = "Run C code" },
			-- { "<leader>tt", "<cmd>FloatermNew --name=Main --wintype=split --height=0.18 fish <cr>", desc = "Open Main Terminal" },
		})
	end
}
