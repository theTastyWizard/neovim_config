return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
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
