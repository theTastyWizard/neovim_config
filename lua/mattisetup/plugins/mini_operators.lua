return {
	'echasnovski/mini.operators',
	version = false,
	config = function()
		require("mini.operators").setup({
			replace = {
				prefix = "R"
			},

		})
	end
}
