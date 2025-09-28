require("which-key").add({
	{ "<leader>L", "<cmd>Lazy<cr>", desc = "Lazy" },

	{ "<leader>]", group = "Indented put" },

	{ "<leader>f", group = "Find" },

	{ "<leader>t", group = "Terminal" },
	{ "<leader>tc", "<cmd>:FloatermNew --autoclose=0 gcc % -o %< && ./%<<cr>", desc = "Run C code" },

	{ "<leader>d", group = "Diagnostics" },
	{ "<leader>dT", "<cmd>TodoTrouble<cr>", desc = "open Todo comments in Trouble" },
	{ "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "go to next diagnostic" },
	{ "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "go to previous diagnostic" },

	{ "s", group = "Surround" },

	{ "<leader>g", group = "Git" },
	{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
	{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle line blame" },


	{ "<leader>.", group = "Settings" },
	{ "<leader>.s", "<cmd>nohlsearch<cr>", desc = "hide search highlight" },
})
