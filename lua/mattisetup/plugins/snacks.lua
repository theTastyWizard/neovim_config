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
		},
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = false },
		styles = {
			notification = {
				wo = { wrap = true } -- Wrap notifications
			}
		}
	},
	keys = {
		{ "<leader>n", function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications" },
		-- { "<leader>bd", function() Snacks.bufdelete() end,               desc = "Delete Buffer" },
		{ "<leader>gg", function() Snacks.lazygit() end,                 desc = "Lazygit" },
		{ "<leader>gb", function() Snacks.git.blame_line() end,          desc = "Git Blame Line" },
		{ "<leader>gB", function() Snacks.gitbrowse() end,               desc = "Git Browse" },
		{ "<leader>gf", function() Snacks.lazygit.log_file() end,        desc = "Lazygit Current File History" },
		{ "<leader>gl", function() Snacks.lazygit.log() end,             desc = "Lazygit Log (cwd)" },
		{ "<leader>tt", function() Snacks.terminal() end,                desc = "Toggle Terminal" },
		{ "<c-_>",      function() Snacks.terminal() end,                desc = "which_key_ignore" },
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
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>.s")
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
