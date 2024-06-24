return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup({
            preview_config = {
            border = 'rounded'}
        })
    end,
}
