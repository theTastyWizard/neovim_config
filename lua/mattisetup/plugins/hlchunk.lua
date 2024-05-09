return {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
        require("hlchunk").setup({
            blank = {
                enable = false,
                exclude_filetypes = {
                    undotree = true,
                    diff = true,
                    oil = true,
                },
            },
            chunk = {
                notify = false,
                use_treesitter = true,
                error_sign = true,
                chars = {
                    horizontal_line = "─",
                    vertical_line = "│",
                    left_top = "╭",
                    left_bottom = "╰",
                    right_arrow = ">",
                },
                style = {
                    "#6600ff",
                    "#df206c", --Highlight wrong chunk
                },
                exclude_filetypes = {
                    undotree = true,
                    diff = true,
                    oil = true,
                },
            },
            indent = {
                enable = false,
                chars = {
                    "│",
                    "¦",
                    "┆",
                    "┊",
                },
                style = {
                    vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
                },
                exclude_filetypes = {
                    undotree = true,
                    oil = true,
                },
            },
            line_num = {
                use_treesitter = true,
                style = "#6600ff", --"#806d9c",

                exclude_filetypes = {
                    undotree = true,
                    diff = true,
                    oil = true,
                },
            },
        })
    end
}
