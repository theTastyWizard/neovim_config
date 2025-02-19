return {
	"rktjmp/lush.nvim",
	{
		dir = '/home/matti/.config/nvim/Minky',
		lazy = false,
		priority = 1000,
		-- cond = false,
		config = function()
			vim.cmd [[colorscheme Minky]]
		end
	},
}
