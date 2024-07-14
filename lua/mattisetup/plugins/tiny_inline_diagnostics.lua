return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
        require('tiny-inline-diagnostic').setup({
            signs = {
                left = "",
                right = "",
            },
        })
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            update_in_insert = false,
            underline = false,
            severity_sort = true,
            float = {
                focusable = true,
                style = 'minimal',
                border = 'rounded',
                source = 'if_many',
                header = '',
                prefix = '',
            },
        })
    end
}
