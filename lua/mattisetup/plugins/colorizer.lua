return {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = { -- set to setup table
		user_default_options = {
			names = false,
			mode = "virtualtext",
			tailwind = "lsp",
			virtualtext_inline = false,
		},
	},
}