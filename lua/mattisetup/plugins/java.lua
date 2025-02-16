return {
	'nvim-java/nvim-java',
	ft = { "java" },
	config = function()
		require('java').setup()
		require('lspconfig').jdtls.setup({
			-- filetypes = { 'java' },
			handlers = {
				-- By assigning an empty function, you can remove the notifications
				-- printed to the cmd
				["$/progress"] = function(_, result, ctx) end,
			},

		})
	end,
	keys = {
		{ "<leader>rr", "<cmd>JavaRunnerRunMain<cr>",      ft = {"java"}, desc = "Java main runner" },
		{ "<leader>rs", "<cmd>JavaRunnerStopMain<cr>",     ft = {"java"}, desc = "Stops java runner" },
		{ "<leader>rc", "<cmd>JavaRunnerToggleLogs<cr>",   ft = {"java"}, desc = "Toggle runner logs" },
		{ "<leader>rb", "<cmd>JavaBuildBuildWorkspace<cr>",ft = {"java"}, desc = "Build workspace" },
	}
}
