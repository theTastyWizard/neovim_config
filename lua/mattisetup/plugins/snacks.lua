return {
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
		quickfile = { enabled = true },
		statuscolumn = {
			enabled = true,
			folds = {
				open = false, -- show open fold icon NOTE: áhugavert að prufa sýnir treesitter held ég
			}
		},
		words = { enabled = false },
		styles = {
			notification = {
				wo = { wrap = true } -- Wrap notifications
			}
		},
		dashboard = {
			enabled = false,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = vim.fn.isdirectory(".git") == 1,
					-- enabled = Snacks.git.get_root() ~= nil,
					cmd = "git status -bs --ignore-submodules",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		}
	},
	keys = {
		{ "<leader>n",  function() Snacks.notifier.hide() end,    desc = "Dismiss All Notifications" },
		-- { "<leader>bd", function() Snacks.bufdelete() end,               desc = "Delete Buffer" },
		{ "<leader>gg", function() Snacks.lazygit() end,          desc = "Lazygit" },
		{ "<leader>gb", function() Snacks.git.blame_line() end,   desc = "Git Blame Line" },
		{ "<leader>gB", function() Snacks.gitbrowse() end,        desc = "Git Browse" },
		{ "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
		{ "<leader>gl", function() Snacks.lazygit.log() end,      desc = "Lazygit Log (cwd)" },
		{ "<leader>tt", function() Snacks.terminal() end,         desc = "Toggle Terminal" },
		{ "<c-_>",      function() Snacks.terminal() end,         desc = "which_key_ignore" },
		-- { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference" },
		-- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
		-- {
		-- 	"<leader>N",
		-- 	desc = "Neovim News",
		-- 	function()
		-- 		Snacks.win({
		-- 			file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
		-- 			width = 0.6,
		-- 			height = 0.6,
		-- 			wo = {
		-- 				spell = false,
		-- 				wrap = false,
		-- 				signcolumn = "yes",
		-- 				statuscolumn = " ",
		-- 				conceallevel = 3,
		-- 			},
		-- 		})
		-- 	end,
		-- }
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
				Snacks.toggle.diagnostics():map("<leader>.d")
				Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>.c")
				Snacks.toggle.treesitter():map("<leader>.T")
				Snacks.toggle.inlay_hints():map("<leader>.h")
			end,
		})
	end,
}
