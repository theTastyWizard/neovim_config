return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    -- fyrir tabout
    {
        "kawre/neotab.nvim",
        event = "InsertEnter",
        opts = {
            tabkey = "",
            behavior = "nested",
            smart_punctuators = {
                enabled = true,
                semicolon = {
                    enabled = true,
                    ft = { "cs", "c", "cpp", "java" },
                },
            },
        },
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { "rafamadriz/friendly-snippets" },
            { "kawre/neotab.nvim" }
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.	
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()
            local neotab = require("neotab")

            -- Svo friendly snippets virki
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                formatting = lsp_zero.cmp_format({ details = true }),
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    -- Enter to confirm selected suggestion
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    -- Enable "Super Tab"				
                    -- ['<Tab>'] = cmp_action.luasnip_supertab(),
                    -- nota tabout ef ekki er completion menu
                    ['<Tab>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            neotab.tabout()
                        end
                    end),
                    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                    -- Ctrl+j/k to select next item auk <C-p> og <C-n>
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    -- Ctrl+Space to trigger completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),
                    -- Scroll up and down in the completion documentation
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    -- Navigate between snippet placeholder
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                }),
            })
        end
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'folke/neodev.nvim' },
            {'maan2003/lsp_lines.nvim'}
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.set_sign_icons({
                error = '󰅚 ',
                warn = '󰀪 ',
                hint = '󰌶 ',
                info = ' '
            })

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        -- Nota neodev frá folke fyrir nvim config dót
                        require("neodev").setup({
                            -- add any options here, or leave empty to use the default settings
                        })
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = 'minimal',
                    border = 'rounded',
                    source = 'always',
                    header = '',
                    prefix = '',
                },
            })
            -- Fyrir aðeins betri diagnostics
            require('lsp_lines').setup()
        end
    },
    -- null-ls eða none-ls núna sett saman úr
    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md#intergrate-with-null-ls
    -- https://github.com/jay-babu/mason-null-ls.nvim?tab=readme-ov-file#automatic-setup-usage
    -- https://www.reddit.com/r/neovim/comments/12er016/configuring_autoformatting_using_nullls_and/
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "williamboman/mason.nvim" },
            { "nvimtools/none-ls.nvim" },
        },
        config = function()
            -- require("your.null-ls.config") -- require your null-ls config here (example below)
            require('mason-null-ls').setup({
                ensure_installed = {},
                automatic_installation = false,
                handlers = {},
            })

            local lsp_zero = require('lsp-zero')
            local null_ls = require('null-ls')
            local null_opts = lsp_zero.build_options('null-ls', {})
            null_ls.setup({
                sources = { null_ls.builtins.formatting.fprettify.with({
                    args = { "--indent 4" },
                }) },
                on_attach = function()
                    null_opts.on_attach()
                end,
            })
        end,
    },
}
