return {
    {
        "RRethy/base16-nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require('base16-colorscheme').with_config({
                telescope = false,
            })
            require('base16-colorscheme').setup({ --óbreytt er pinky
                base00 = '#171517',
                base01 = '#1b181b',
                base02 = '#1E3232', --visual selected breytt til að sjá betur 
                base03 = '#5100cc', --comments breytt til að sjá betur TODO: Velja aðeins betri lit
                -- #4700b2
                -- #b27400
                -- #a2626d
                -- #b26c78
                -- #937979
                -- #1E2832
                -- #1E3232
                -- #333133
                -- #944866 
                -- #ff7fb2
                -- #b21956
                -- #cc0051
                -- #169c4b
                base04 = '#e7dbdb',
                base05 = '#f5f5f5',
                base06 = '#ffffff',
                base07 = '#f7f3f7',
                base08 = '#ffa600',
                base09 = '#00ff66',
                base0A = '#20df6c',
                base0B = '#ff0066',
                base0C = '#6600ff',
                base0D = '#00ffff',
                base0E = '#007fff',
                base0F = '#df206c'
            })
            -- vim.cmd [[colorscheme base16-pinky]]
        end
    },
    -- {
    --     "bradcush/nvim-base16",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         -- vim.cmd [[colorscheme base16-pinky]]
    --     end
    -- },
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
        end,
    },
}
