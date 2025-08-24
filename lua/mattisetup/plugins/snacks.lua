return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
				style = "compact",
				top_down = false,
				margin = { top = 0, right = 0, bottom = 0 }
			},
			quickfile = { enabled = false },
			terminal = {
				shell = "fish",
			},
			statuscolumn = {
				enabled = true,
				folds = {
					open = false, -- show open fold icon NOTE: áhugavert að prufa sýnir treesitter held ég
				}
			},
			input = { enabled = true, },
			scope = { enabled = true, },
			image = {
				enabled = true,
				formats = {
					"png",
					"jpg",
					"jpeg",
					"gif",
					"bmp",
					"webp",
					"tiff",
					"heic",
					"avif",
					"mp4",
					"mov",
					"avi",
					"mkv",
					"webm"
				},
				doc = {
					inline = false,
					float = true
				}
			},
			scroll = {
				enabled = false,
				-- animate = {
				-- 	easing = "Cubic",
				-- },
			},
			animate = {
				fps = 60,
				-- fps = 144,
				-- easing = "cubic",
			},
			indent = {
				indent = {
					enabled = false,
					-- char = "╎",
					only_scope = false,
					only_current = false,
					-- hl = "#171517",
				},
				animate = {
					style = "out",
					duration = {
						step = 20,
						total = 100,
					},
				},
				scope = {
					enabled = true,
					underline = false,
					only_current = true,
				},
				chunk = {
					enabled = false,
					char = {
						-- corner_top = "┌",
						-- corner_bottom = "└",
						corner_top = "╭",
						corner_bottom = "╰",
						horizontal = "─",
						vertical = "│",
						arrow = ">",
					},
				}
			},
			styles = {
				terminal = {
					wo = { winbar = "" },
					height = 12,
					keys = {
						q = "hide",
						gf = function(self)
							local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
							if f == "" then
								Snacks.notify.warn("No file under cursor")
							else
								self:hide()
								vim.schedule(function()
									vim.cmd("e " .. f)
								end)
							end
						end,
						term_normal = {
							"<esc>",
							function(self)
								self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
								if self.esc_timer:is_active() then
									self.esc_timer:stop()
									vim.cmd("stopinsert")
								else
									self.esc_timer:start(400, 0, function() end)
									return "<esc>"
								end
							end,
							mode = "t",
							expr = true,
							desc = "Double escape to normal mode",
						},
					}
				},
				notification = {
					wo = { wrap = true } -- Wrap notifications
				},
				input = {
					backdrop = true,
					width = 30,
					relative = "cursor",
					row = -3,
					col = 0,
					b = {
						completion = true, -- enable blink completion in input NOTE: virkar ekki
					}
				}
			},
		},
		keys = {
			{ "<leader>n",  function() Snacks.notifier.hide() end,         desc = "Dismiss All Notifications" },
			{ "<leader>N",  function() Snacks.notifier.show_history() end, desc = "Show notification history" },

			-- { "<leader>bd", function() Snacks.bufdelete() end,               desc = "Delete Buffer" },
			-- { "<leader>gg", function() Snacks.lazygit() end,               desc = "Lazygit" },
			-- { "<leader>gB", function() Snacks.gitbrowse() end,             desc = "Git Browse" },
			{ "<leader>gf", function() Snacks.lazygit.log_file() end,      desc = "Lazygit Current File History" },
			{ "<leader>gl", function() Snacks.lazygit.log() end,           desc = "Lazygit Log (cwd)" },

			{ "<leader>tt", function() Snacks.terminal.toggle() end,       desc = "Toggle Terminal" },
			{ "<c-_>",      function() Snacks.terminal() end,              desc = "which_key_ignore" },
			-- { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference" },
			-- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- Create some toggle mappings
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>.z")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>.w")
					Snacks.toggle.diagnostics():map("<leader>.D")
					Snacks.toggle.option("conceallevel",
						{ off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>.c")
					Snacks.toggle.treesitter():map("<leader>.t")
					Snacks.toggle.inlay_hints():map("<leader>.h")
					Snacks.toggle.scroll():map("<leader>.S")
					Snacks.toggle.zen():map("<leader>.f")
					Snacks.toggle.dim():map("<leader>.d")
				end,
			})
		end,
	},
	-- {
	-- 	'stevearc/oil.nvim',
	-- 	optional = true,
	-- 	config = function()
	-- 		vim.api.nvim_create_autocmd("User", {
	-- 			pattern = "OilActionsPost",
	-- 			callback = function(event)
	-- 				if event.data.actions.type == "move" then
	-- 					Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
	-- 				end
	-- 			end,
	-- 		})
	-- 	end
	-- }
}
