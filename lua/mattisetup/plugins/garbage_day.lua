return {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
        aggressive_mode=false,
        notifications=true,
        grace_period=60*15,
    }
}
