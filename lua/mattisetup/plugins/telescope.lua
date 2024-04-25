return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>f"] = {
                name = "Find",
                g = { require('telescope.builtin').git_files, "Git files" },
                f = { require('telescope.builtin').find_files, "Files" },
                s = { require('telescope.builtin').grep_string, "String" },
                l = { require('telescope.builtin').live_grep, "Live grep" },
            },
        })
        require "telescope".setup {
            pickers = {
                colorscheme = {
                    enable_preview = true,
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
                }
            },
        }
        --       -- To get fzf loaded and working with telescope, you need to call
        --       -- load_extension, somewhere after setup function:
        require('telescope').load_extension('fzf')
    end
}
