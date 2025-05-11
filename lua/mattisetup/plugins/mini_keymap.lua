return {
	'echasnovski/mini.keymap',
	version = false,
	config = function()
		require("mini.keymap").setup({})
		local action = '<BS><BS><Esc>[s1z=gi<Right>'
		require('mini.keymap').map_combo('i', 'zz', action)
		-- local map_multistep = require('mini.keymap').map_multistep
		-- local tab_steps = { "jump_after_tsnode", "jump_after_close" }
		-- -- map_multistep('i', '<Tab>', tab_steps)
		-- map_multistep('i', '<Tab>', { "jump_before_open", "jump_after_close" })
		--
		-- local s_tab_steps = { "jump_before_tsnode", "jump_before_open" }
		-- -- map_multistep('i', '<S-Tab>',s_tab_steps)
		-- map_multistep('i', '<S-Tab>', { "jump_before_open", "jump_after_close" })
	end
}
