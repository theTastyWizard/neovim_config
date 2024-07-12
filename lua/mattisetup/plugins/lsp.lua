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
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    },
                },
            })
        end,
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
                vim.keymap.set('n', 'L', '<cmd>lua vim.lsp.buf.hover()<cr>',
                    { buffer = bufnr, desc = 'Show hover info about symbol' })
                vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>',
                    { buffer = bufnr, desc = 'Go to symbol definition' })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup, -- setur upp alla servera með config í lsp config
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                        require('lspconfig.ui.windows').default_options.border = "rounded"
                    end,
                }
            })
        end
    },
    -- {
    --     "williamboman/mason.nvim",
    --     "frostplexx/mason-bridge.nvim",
    --     'stevearc/conform.nvim',
    --     -- event = { "BufWritePre" },
    --     -- cmd = { "ConformInfo" },
    --     -- opts = {},
    --     config = function()
    --         require("mason-bridge").setup()
    --
    --         -- After setting up mason-bridge you may set up conform.nvim and nvim-lint
    --         require("conform").setup({
    --             formatters_by_ft = require("mason-bridge").get_formatters(),
    --         })
    --     end
    -- },
    -- null-ls eða none-ls núna sett saman úr
    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md#intergrate-with-null-ls
    -- https://github.com/jay-babu/mason-null-ls.nvim?tab=readme-ov-file#automatic-setup-usage
    -- https://www.reddit.com/r/neovim/comments/12er016/configuring_autoformatting_using_nullls_and/
    -- {
    --     "nvimtools/none-ls.nvim",
    --     event = { "BufReadPre", "BufNewFile" },
    --     dependencies = {"nvim-lua/plenary.nvim"},
    --     config = function()
    --         require('null-ls').setup()
    --     end,
    -- },
    -- {
    --     "zeioth/none-ls-autoload.nvim",
    --     event = "BufEnter",
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "zeioth/none-ls-external-sources.nvim"
    --     },
    --     opts = {
    --         -- Here you can add support for sources not oficially suppored by none-ls.
    --         external_sources = {
    --             -- diagnostics
    --             -- 'none-ls-external-sources.diagnostics.cpplint',
    --             -- 'none-ls-external-sources.diagnostics.eslint',
    --             -- 'none-ls-external-sources.diagnostics.eslint_d',
    --             -- 'none-ls-external-sources.diagnostics.flake8',
    --             -- 'none-ls-external-sources.diagnostics.luacheck',
    --             -- 'none-ls-external-sources.diagnostics.psalm',
    --             'none-ls-external-sources.diagnostics.shellcheck',
    --             -- 'none-ls-external-sources.diagnostics.yamllint',

    --             -- formatting
    --             -- 'none-ls-external-sources.formatting.autopep8',
    --             'none-ls-external-sources.formatting.beautysh',
    --             -- 'none-ls-external-sources.formatting.easy-coding-standard',
    --             -- 'none-ls-external-sources.formatting.eslint',
    --             -- 'none-ls-external-sources.formatting.eslint_d',
    --             -- 'none-ls-external-sources.formatting.jq',
    --             -- 'none-ls-external-sources.formatting.latexindent',
    --             -- 'none-ls-external-sources.formatting.reformat_gherkin',
    --             -- 'none-ls-external-sources.formatting.rustfmt',
    --             -- 'none-ls-external-sources.formatting.standardrb',
    --             -- 'none-ls-external-sources.formatting.yq',

    --             -- code actions
    --             -- 'none-ls-external-sources.code_actions.eslint',
    --             -- 'none-ls-external-sources.code_actions.eslint_d',
    --             'none-ls-external-sources.code_actions.shellcheck',
    --         },
    --     },
    -- },
}
