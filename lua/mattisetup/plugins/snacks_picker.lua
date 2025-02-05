return {
	{
		"folke/snacks.nvim",
		optional = true,
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			picker = {
				prompt = " ",
				-- prompt = "" .. vim.loop.cwd() .. "/", --TODO: setja bara fyrir files etc
				sources = {},
				focus = "input",
				layout = {
					cycle = true,
					--- Use the default layout or vertical if the window is too narrow
					preset = function()
						return vim.o.columns >= 120 and "default" or "vertical"
					end,
				},
				---@class snacks.picker.matcher.Config
				matcher = {
					fuzzy = true, -- use fuzzy matching
					smartcase = true, -- use smartcase
					ignorecase = true, -- use ignorecase
					sort_empty = false, -- sort results when the search string is empty
					filename_bonus = true, -- give bonus for matching file names (last part of the path)
					file_pos = true, -- support patterns like `file:line:col` and `file:line`
					-- the bonusses below, possibly require string concatenation and path normalization,
					-- so this can have a performance impact for large lists and increase memory usage
					cwd_bonus = true, -- give bonus for matching files in the cwd
					frecency = true, -- frecency bonus
					history_bonus = false, -- give more weight to chronological order
				},
				sort = {
					-- default sort is by score, text length and index
					fields = { "score:desc", "#text", "idx" },
				},
				ui_select = true, -- replace `vim.ui.select` with the snacks picker
				---@class snacks.picker.formatters.Config
				formatters = {
					text = {
						ft = nil, ---@type string? filetype for highlighting
					},
					file = {
						filename_first = true, -- display filename before the file path
						truncate = 40, -- truncate the file path to (roughly) this length
						filename_only = false, -- only show the filename
					},
					selected = {
						show_always = false, -- only show the selected column when there are multiple selections
						unselected = true, -- use the unselected icon for unselected items
					},
					severity = {
						icons = true, -- show severity icons
						level = false, -- show severity level
					},
				},
				---@class snacks.picker.previewers.Config
				previewers = {
					git = {
						native = true, -- use native (terminal) or Neovim for previewing git diffs and commits
					},
					file = {
						max_size = 1024 * 1024, -- 1MB
						max_line_length = 500, -- max line length
						ft = nil, ---@type string? filetype for highlighting. Use `nil` for auto detect
					},
					man_pager = nil, ---@type string? MANPAGER env to use for `man` preview
				},
				layouts = {
				},
				sources = {
					files = {
						matcher = {
							fuzzy = true, -- use fuzzy matching
							smartcase = true, -- use smartcase
							ignorecase = true, -- use ignorecase
							sort_empty = true, -- sort results when the search string is empty
							filename_bonus = true, -- give bonus for matching file names (last part of the path)
							file_pos = true, -- support patterns like `file:line:col` and `file:line`
							-- the bonusses below, possibly require string concatenation and path normalization,
							-- so this can have a performance impact for large lists and increase memory usage
							cwd_bonus = true, -- give bonus for matching files in the cwd
							frecency = true, -- frecency bonus
							history_bonus = false, -- give more weight to chronological order
						}

					}

				},
				---@class snacks.picker.jump.Config
				jump = {
					jumplist = true, -- save the current position in the jumplist
					tagstack = false, -- save the current position in the tagstack
					reuse_win = true, -- reuse an existing window if the buffer is already open
					close = true, -- close the picker when jumping/editing to a location (defaults to true)
					match = false, -- jump to the first match position. (useful for `lines`)
				},
				win = {
					-- input window
					input = {
						keys = {
							["<Tab>"] = { "list_down", mode = { "i", "n" } },
							["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
							["<d-f>"] = { "toggle_follow", mode = { "i", "n" } },
							["<d-h>"] = { "toggle_hidden", mode = { "i", "n" } },
							["<D-i>"] = { "toggle_ignored", mode = { "i", "n" } },
							["<d-m>"] = { "toggle_maximize", mode = { "i", "n" } },
							["<d-p>"] = { "toggle_preview", mode = { "i", "n" } },
							["<d-w>"] = { "cycle_win", mode = { "i", "n" } },
						}
					},
					list = {
						keys = {
							["<Tab>"] = { "list_down", mode = { "n", "x" } },
							["<S-Tab>"] = { "list_up", mode = { "n", "x" } },
							["<d-f>"] = { "toggle_follow", },
							["<d-h>"] = { "toggle_hidden", },
							["<D-i>"] = { "toggle_ignored", },
							["<d-m>"] = { "toggle_maximize", },
							["<d-p>"] = { "toggle_preview", },
							["<d-w>"] = { "cycle_win", },
						}
					},
					preview = {
						keys = {
							["<d-w>"] = "cycle_win",
						}
					}

				}
			},
		},
		keys = {
			{ "<leader><leader>", function() Snacks.picker.files() end,                                   desc = "Files" },
			{ "<leader>ff",       function() Snacks.picker.files() end,                                   desc = "Files" },
			{ "<leader>fc",       function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config File" },

			{ "<leader>fj",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
			{ "<leader>fw",       function() Snacks.picker.grep_word() end,                               desc = "Word or visual selection", mode = { "n", "x" } },

			{ "<leader>gl",       function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
			{ "<leader>gL",       function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
			{ "<leader>gf",       function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },


			{ "<leader>fz",       function() Snacks.picker.spelling() end,                                desc = "Spelling" },
			{ "<leader>fm",       function() Snacks.picker.man() end,                                     desc = "Man Pages" },
			{ "<leader>fh",       function() Snacks.picker.help() end,                                    desc = "Help Pages" },

			{ "<leader>fs",       function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },

			{ "<leader>fH",       function() Snacks.picker.highlights() end,                              desc = "Highlights" },
			{ "<leader>fi",       function() Snacks.picker.icons() end,                                   desc = "Icons" },
			{ "<leader>fC",       function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },

			{ "<leader>fp",       function() Snacks.picker() end,                                         desc = "Picker" },

			{ "<leader>fr",       function() Snacks.picker.resume() end,                                  desc = "Resume find" },

		}

	},
	{
		"folke/todo-comments.nvim",
		optional = true,
		keys = {
			-- { "<leader>ft", function() Snacks.picker.todo_comments() end,                                          desc = "Todo" },
			{ "<leader>ft", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
		},
	},
	{
		'stevearc/oil.nvim',
		optional = true,
		opts = {
			keymaps = {

				["<leader>ff"] = {
					function()
						Snacks.picker.files({
							cwd = require("oil").get_current_dir()
						})
					end,
					mode = "n",
					nowait = true,
					desc = "Find files in the current directory"
				},
				["<leader>fj"] = {
					function()
						Snacks.picker.grep({
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
