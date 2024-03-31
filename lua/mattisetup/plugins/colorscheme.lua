return {
    -- {
    --     "RRethy/base16-nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function ()
    --         -- vim.cmd[[colorscheme base16-pinky]]
    --     end
    -- },
    {
        "bradcush/nvim-base16",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd [[colorscheme base16-pinky]]
        end
    },
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd [[colorscheme ayu-dark]]
        end,
    },
}
