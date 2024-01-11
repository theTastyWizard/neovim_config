--return{
	--"folke/tokyonight.nvim",
	--lazy = false,
	--priority = 1000,
	--opts = {},
	--config = function()
		--vim.cmd[[colorscheme tokyonight-night]]
	--end,
--}
return{
    "Shatur/neovim-ayu",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd[[colorscheme ayu-dark]]
	end,
}


-- return{
--     "rebelot/kanagawa.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		vim.cmd[[colorscheme kanagawa]]
-- 	end,
-- }
--return{
    --'stevedylandev/flexoki-nvim',
	--lazy = false,
	--priority = 1000,
	--opts = {},
	--config = function()
		--vim.cmd[[colorscheme flexoki]]
	--end,
--}
