return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch [G]it Files' })
        vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
        require "telescope".setup{
            pickers = {
                colorscheme = {
                    enable_preview = true,
                }
            }
        }
    end
}
