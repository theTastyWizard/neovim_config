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
		{ "<leader>rr", "<cmd>JavaRunnerRunMain<cr>",  desc = "Java main runner" },
		{ "<leader>rs", "<cmd>JavaRunnerStopMain<cr>", desc = "Stops java runner" },
		{ "<leader>rc", "<cmd>JavaRunnerToggleLogs<cr>", desc = "Toggle runner logs" },
		{ "<leader>rb", "<cmd>JavaBuildBuildWorkspace<cr>", desc = "Build workspace" },
	}
}
