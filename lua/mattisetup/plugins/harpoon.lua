return {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys = {
        { "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Mark file with harpoon" },
        { "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
        { "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",         desc = "Harpoon file 1" },
        { "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",         desc = "Harpoon file 2" },
        { "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",         desc = "Harpoon file 3" },
    },
}
