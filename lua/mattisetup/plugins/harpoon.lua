return {"ThePrimeagen/harpoon",
	lazy = false,
	dependencies = {"nvim-lua/plenary.nvim"},
	config = true,
	keys = {
		{ "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
		{ "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
		{ "<leader>h", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "go to file 1"},
		{ "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "go to file 2"},
		{ "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "go to file 3"},
		{ "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "go to file 4"},

	},
}
