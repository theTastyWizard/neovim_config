return {
    -- {
    --   "folke/tokyonight.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   opts = {},
    --   config = function ()
    --     vim.cmd[[colorscheme tokyonight-night]]
    --     end,
    -- },
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
                -- base00 = '#000000', -- alveg svartur bakgrunnur
                base01 = '#1b181b',
                base02 = '#1E3232', --visual selected breytt til að sjá betur
                base03 = '#5100cc', --comments breytt til að sjá betur TODO: Velja aðeins betri lit
                -- #5100cc'
                -- #00ff66',

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
    --     "RRethy/base16-nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         require('base16-colorscheme').with_config({
    --             telescope = false,
    --         })
    --         require('base16-colorscheme').setup({
    --             -- isotope
    --             base00 = "#000000",
    --             base01 = "#404040",
    --             base02 = "#606060",
    --             base03 = "#808080",
    --             base04 = "#c0c0c0",
    --             base05 = "#d0d0d0",
    --             base06 = "#e0e0e0",
    --             base07 = "#ffffff",
    --             base08 = "#ff0000",
    --             base09 = "#ff9900",
    --             base0A = "#ff0099",
    --             base0B = "#33ff00",
    --             base0C = "#00ffff",
    --             base0D = "#0066ff",
    --             base0E = "#cc00ff",
    --             base0F = "#3300ff",
    --         })
    --     end
    -- },
    -- {
    --     "RRethy/base16-nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         require('base16-colorscheme').with_config({
    --             telescope = false,
    --         })
    --         require('base16-colorscheme').setup({
    --             -- spaceduck
    --             base00 = "#16172d",
    --             base01 = "#1b1c36",
    --             base02 = "#30365F",
    --             base03 = "#686f9a",
    --             base04 = "#818596",
    --             base05 = "#ecf0c1",
    --             base06 = "#c1c3cc",
    --             base07 = "#ffffff",
    --             base08 = "#e33400",
    --             base09 = "#e39400",
    --             base0A = "#f2ce00",
    --             base0B = "#5ccc96",
    --             base0C = "#00a3cc",
    --             base0D = "#7a5ccc",
    --             base0E = "#b3a1e6",
    --             base0F = "#ce6f8f",
    --         })
    --     end
    -- },
    -- {
    --     "RRethy/base16-nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         require('base16-colorscheme').with_config({
    --             telescope = false,
    --         })
    --         require('base16-colorscheme').setup({
    --             -- setja saman mitt eigið
    --             base00 = "#000000",
    --             base01 = "#404040",
    --             base02 = "#606060",
    --             base03 = "#808080",
    --             base04 = "#c0c0c0",
    --             base05 = "#d0d0d0",
    --             base06 = "#e0e0e0",
    --             base07 = "#ffffff",
    --             base08 = "#fb0120", --red
    --             base09 = '#e6550d', --"#ff661a" --orange
    --             base0A = "#ffa600", --yellow
    --             base0B = "#1dd361", --"#02d849"--"#50fa7b" --green
    --             base0C = "#21c992", --aqua
    --             base0D = "#00948b", --blue
    --             base0E = "#d8137f", --"#700f98"--"#a71d5d"--purple
    --             base0F = "#ff0099",       --brown
    --         })
    --     end
    -- },
    -- {
    --     "bradcush/nvim-base16",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         -- vim.cmd [[colorscheme base16-pinky]]
    --     end
    -- },
}
