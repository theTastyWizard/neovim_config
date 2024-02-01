return {
    'mbbill/undotree',
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = 'Toggle Undotree' })
        -- virkar ekki en veit ekki afhverju
        -- vim.g:undotree_SplitWidth = 40
        -- vim.g:undotree_SetFocusWhenToggle = 1
    end,
}
