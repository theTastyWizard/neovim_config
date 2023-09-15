return {'ThePrimeagen/harpoon',
	config = function()
		local mark = require("harpoon.mark"),
		local ui = require("harpoon.ui), 
		vim.keypmapset("n", "<leader>a, mark_add_file),
		vim.keypmapset("n", "<C-e>, ui.toggle_quick_menu),
end}

