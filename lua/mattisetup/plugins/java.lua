return {
    'nvim-java/nvim-java',
    ft = {"java"},
    config = function()
        require('lspconfig').jdtls.setup({})
    end
}
