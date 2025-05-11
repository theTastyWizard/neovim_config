local autocmd = vim.api.nvim_create_autocmd

-- leyfa að loka fleiri gluggum með q
autocmd("FileType", {
	pattern = {
		"git",
		"dap-float",
		"startuptime",
		"query", -- ekki viss hvað þetta er
		"help",
		"lspinfo",
		"notify",
		"man",
		"qf",
		"floaterm"
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = event.buf, silent = true }) -- breytti úr close í quit svo man geti hætt
	end,
	desc = "Close certain windows with q",
})

-- Ekki commenta á nýar línur
autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Disable new line comment",
})

-- Cleanup on quit
autocmd("User", {
	pattern = "VimtexEventQuit",
	command = "VimtexClean",
	desc = "Clean folder on vimtex exit"
})

-- Færa help glugga til vinstri
autocmd("FileType", {
	pattern = { "help" },
	callback = function()
		vim.cmd 'wincmd L'
	end
})

-- Equal size buffers if window resized
autocmd("VimResized", { command = "wincmd =" })

-- passa línustærð og setja colorcolumn til að sýna hana
autocmd("Filetype", {
	pattern = { "text", "markdown", "tex", "typst" },
	callback = function()
		vim.bo.textwidth = 90
		vim.opt_local.colorcolumn = "+1"
	end
})

-- Til ad hlsearch se bara ef cursor er a ordinu
autocmd('CursorMoved', {
	group = vim.api.nvim_create_augroup('auto-hlsearch', { clear = true }),
	callback = function()
		if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
			vim.schedule(function() vim.cmd.nohlsearch() end)
		end
	end
})

-- Lsp keybindings
autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("mitt.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/definition") then
			vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = " Lsp definition" })
		end
		if client:supports_method("textDocument/hover") then
			vim.keymap.set('n', 'æ', '<cmd>lua vim.lsp.buf.hover({border = "rounded"})<cr>', { desc = "Lsp hover" })
		end
		if client:supports_method("textDocument/signatureHelp") or client:supports_method("signature_help") then
			vim.keymap.set('n', 'Æ', '<cmd>lua vim.lsp.buf.signature_help({border = "rounded"})<cr>',
				{ desc = "Lsp signature help" })
		end
	end
})
