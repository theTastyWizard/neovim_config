return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup({
			-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
			install_dir = vim.fn.stdpath("data") .. "/site",
		})
		ts.install({
			"lua",
			"vim",
			"vimdoc",
			"query",
			"c",
			"cpp",
			"fortran",
			"sql",
			"python",
			"bash",
			"fish",
			"make",
			"markdown",
			"markdown_inline",
			"latex",
			"json",
			"regex",
			"rust",
			"html",
			"css",
			"gdscript",
			"typst",
		})
	end,
	disable = function(lang, buf)
		local max_filesize = 100 * 1024 -- 100 KB
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		if ok and stats and stats.size > max_filesize then
			return true
		end
	end,

	-- note: gamla master branch

	-- config = function()
	-- 	local configs = require("nvim-treesitter.configs")
	--
	-- 	configs.setup({
	-- 		ensure_installed = {
	-- 			"lua", "vim", "vimdoc", "query",
	-- 			"c", "cpp", "fortran", "sql", "python",
	-- 			"bash", "fish", "make",
	-- 			"markdown", "markdown_inline", "latex",
	-- 			"json", "regex", "html", "css",
	-- 			"gdscript"
	-- 		},
	-- 		sync_install = false,
	-- 		highlight = { enable = true },
	-- 		indent = {
	-- 			enable = true,
	-- 			disable = { "fortran", "cpp", "python" }
	-- 		},
	-- 		-- disable fyrir of stór file
	-- 		disable = function(lang, buf)
	-- 			local max_filesize = 100 * 1024 -- 100 KB
	-- 			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	-- 			if ok and stats and stats.size > max_filesize then
	-- 				return true
	-- 			end
	-- 		end,
	-- 	})
	-- end
}
