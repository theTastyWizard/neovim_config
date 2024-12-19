return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        -- local wk = require("which-key")
        -- wk.add({
        --     {"<leader>f", group = "Find"},
        --     {"<leader>ff", "<cmd>Telescope find_files<cr>", desc="files"},
        --     {"<leader>fs", "<cmd>Telescope grep_string<cr>", desc="string"},
        --     {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc="grep"},
        --     {"<leader>fm", "<cmd>Telescope man_pages<cr>", desc="man page"},
        --     {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc="help pages"},
        --
        -- })
        require "telescope".setup {
            defaults = {
                prompt_prefix = '󰍉 ',
                selection_caret = " 󰼛 ",
            },
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
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('noice')
    end
}
