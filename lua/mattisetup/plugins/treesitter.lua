return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "fortran", "python","bash", "fish"},
            sync_install = false,
            highlight = { enable = true },
            indent = { 
                enable = true,
                disable = {"python","fortran"}
            },  

        })
    end
}
