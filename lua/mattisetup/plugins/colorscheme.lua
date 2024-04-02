return {
    {
        "RRethy/base16-nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function ()
            require('base16-colorscheme').with_config({
                telescope = false,
            })
            vim.cmd[[colorscheme base16-pinky]]
        end
    },
    -- {
    --     "bradcush/nvim-base16",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         -- vim.cmd [[colorscheme base16-pinky]]
    --     end
    -- },
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
        end,
    },
}
