return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup({
            numhl = true,
            preview_config = {
            border = 'rounded'}
        })
    end,
}
