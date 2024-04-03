return {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
        require("hlchunk").setup({
            blank = {
                enable = false,
            },
            chunk = {
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
                    "#df206c",
                }
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
            },
            line_num = {
                use_treesitter = true,
                style = "#806d9c",
            }
        })
    end
}
