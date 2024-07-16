return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "fortran", "python", "bash", "fish", "java", "markdown", "markdown_inline", "make", "nix", "regex", "rust", "cpp" },
            sync_install = false,
            highlight = { enable = true },
            indent = {
                enable = true,
                disable = { "fortran" }
            },

        })
    end
}
