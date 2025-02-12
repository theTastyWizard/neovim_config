return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		fps = 60,     --prufa hvort þetta verði of mikið cpu-notkun
		render = "wrapped-compact",
		max_width = 45,
		stages = "fade",
		timeout = 3000,      -- 3 sek
		top_down = true,     -- false birtist neðst
		notify = {
			enabled = true,
		},
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = false,
				["vim.lsp.util.stylize_markdown"] = false,
				["cmp.entry.get_documentation"] = false,     -- requires hrsh7th/nvim-cmp
			},
			hover = {
				enabled = false,
			},
			signature = {
				enabled = false,
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true,             -- use a classic bottom cmdline for search
			command_palette = true,           -- position the cmdline and popupmenu together
			long_message_to_split = true,     -- long messages will be sent to a split
			inc_rename = false,               -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false,           -- add a border to hover docs and signature help
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}
