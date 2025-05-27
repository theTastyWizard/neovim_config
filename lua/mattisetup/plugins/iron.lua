return {
	"Vigemus/iron.nvim",
	ft = { "python" },
	-- cond = false,
	config = function()
		local iron = require("iron.core")
		iron.setup {
			config = {
				-- Toggling behavior is on by default.
				-- Other options are: `single` and `focus`
				visibility = require("iron.visibility").toggle,

				-- Scope of the repl
				-- By default it is one for the same `pwd`
				-- Other options are `tab_based` and `singleton`
				scope = require("iron.scope").path_based,

				-- Whether a repl should be discarded or not
				scratch_repl = true,

				-- Your repl definitions come here
				repl_definition = {
					sh = {
						-- Can be a table or a function that
						-- returns a table (see below)
						command = { "sh" }
					},
					python = {
						command = { "ipython", "--no-autoindent" }, --{ "python3" },
						format = require("iron.fts.common").bracketed_paste_python,
						block_dividers = { "# %%", "#%%" },
					}
				},
				-- How the repl window will be displayed
				-- See below for more information
				repl_open_cmd = require('iron.view').split.vertical.botright(80),
			},
			-- Iron doesn't set keymaps by default anymore.
			-- You can set them here or manually add keymaps to the functions in iron.core
			keymaps = {
				send_motion = "<leader>sc",
				visual_send = "<leader>sc",
				send_file = "<leader>sf",
				send_line = "<leader>sl",
				send_paragraph = "<leader>sp",
				send_until_cursor = "<leader>su",
				-- send_mark = "<leader>sm",
				-- mark_motion = "<leader>mc",
				-- mark_visual = "<leader>mc",
				-- remove_mark = "<leader>md",
				cr = "<leader>s<cr>",
				interrupt = "<leader>s<leader>",
				exit = "<leader>sq",
				clear = "<leader>cl",
			},
			-- If the highlight is on, you can change how it looks
			-- For the available options, check nvim_set_hl
			highlight = {
				italic = true
			},
			ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
		}
	end,
	keys = {
		-- iron also has a list of commands, see :h iron-commands for all available commands
		{ '<leader>ss', '<cmd>IronRepl<cr>',    ft = "python" },
		{ '<leader>sr', '<cmd>IronRestart<cr>', ft = "python" },
		-- { '<leader>sf', '<cmd>IronFocus<cr>',   ft = "python" },
		{ '<leader>sh', '<cmd>IronHide<cr>',    ft = "python" }
	}
}
