return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>s"] = {
                name = "Search",
                g = { require('telescope.builtin').git_files, "Git files" },
                f = { require('telescope.builtin').find_files, "Files" },
            },
        })
        require "telescope".setup {
            pickers = {
                colorscheme = {
                    enable_preview = true,
                }
            }
        }
    end
}
