return {
    'nvim-java/nvim-java',
    ft = { "java" },
    config = function()
        require('java').setup()
        require('lspconfig').jdtls.setup({
            -- filetypes = { 'java' },
            handlers = {
                -- By assigning an empty function, you can remove the notifications
                -- printed to the cmd
                ["$/progress"] = function(_, result, ctx) end,
            },

        })
    end,
}
