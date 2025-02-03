return {
	{
		-- Mest fengið frá lazyvim configinu
		"ibhagwan/fzf-lua",
		cond = false,
		-- optional for icon support
		dependencies = { 'echasnovski/mini.icons' },
		cmd = {
			"FzfLua"
		},
		config = function()
			-- calling `setup` is optional for customization
			local config = require("fzf-lua.config")
			local actions = require("fzf-lua.actions")

			-- Quickfix
			config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
			config.defaults.keymap.fzf["ctrl-u"] = "half-page-up"
			config.defaults.keymap.fzf["ctrl-d"] = "half-page-down"
			config.defaults.keymap.fzf["ctrl-x"] = "jump"
			config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
			config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"
			config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
			config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"

			-- Trouble
			config.defaults.actions.files["ctrl-t"] = require("trouble.sources.fzf").actions.open
			require("fzf-lua").setup({

				fzf_colors = true,
				fzf_opts = {
					["--no-scrollbar"] = true,
				},
				defaults = {
					formatter = "path.filename_first",
					-- formatter = "path.dirname_first",
				},
				winopts = {
					width = 0.85,
					height = 0.8,
					row = 0.5,
					col = 0.5,
					border = "rounded",
					preview = {
						-- default = "bat", -- fyrir meira performance TODO: stilla litina í bat
						scrollchars = { "┃", "" },
						scrollbar = "border",
						delay = 50,
					},
				},
				files = {
					cwd_prompt = true,
				}
			})
		end,
		keys = {

			{ "<c-j>",       "<c-j>",                             ft = "fzf",                    mode = "t", nowait = true },
			{ "<c-k>",       "<c-k>",                             ft = "fzf",                    mode = "t", nowait = true },

			{ "<leader>ff",  "<cmd>FzfLua files root=false <cr>", desc = "files (cwd)" },
			{ "<leader>fF",  "<cmd>FzfLua files<cr>",             desc = "files (root)" },
			{ "<leader>fw",  "<cmd>FzfLua grep_cword<cr>",        desc = "word" },
			{ "<leader>fj",  "<cmd>FzfLua live_grep<cr>",         desc = "live grep" },
			{ "<leader>fm",  "<cmd>FzfLua manpages<cr>",          desc = "man page" },
			{ "<leader>fh",  "<cmd>FzfLua helptags<cr>",          desc = "help pages" },
			{ "<leader>fgc", "<cmd>FzfLua git_commits<cr>",       desc = "git commits (project)" },
			{ "<leader>fgb", "<cmd>FzfLua git_bcommits<cr>",      desc = "git commits (buffer)" },
			{ "<leader>fz",  "<cmd>FzfLua spell_suggest<cr>",     desc = "spelling" },
			{ "<leader>fr",  "<cmd>FzfLua resume<cr>",            desc = "resume" },
		},
	},
	{
		'stevearc/oil.nvim',
		optional = true,
		opts = {
			keymaps = {

				["<leader>ff"] = {
					function()
						require("fzf-lua").files({
							cwd = require("oil").get_current_dir()
						})
					end,
					mode = "n",
					nowait = true,
					desc = "Find files in the current directory"
				},
				["<leader>fj"] = {
					function()
						require("fzf-lua").live_grep({
							cwd = require("oil").get_current_dir()
						})
					end,
					mode = "n",
					nowait = true,
					desc = "Grep in the current directory"
				}
			}
		}

	}
}
