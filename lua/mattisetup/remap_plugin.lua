local wk = require("which-key")

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = 'Open Oil' })

wk.register({
    ["<leader>t"] = {
        name = "Terminal",
        t = {"<cmd>FloatermNew --name=Main --wintype=split --height=0.25 fish <cr>",
            'Open Main Terminal'},
        c = {"<cmd>:FloatermNew --autoclose=0 gcc % -o %< && ./%<<cr>", 'Run C code'},
    }
})
wk.register({
    ["<leader>d"] = {
        name = "Diagnostics",
        n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", 'go to next diagnostic' },
        p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", 'go to previous diagnostic' },
        l = { require("lsp_lines").toggle, 'Toggle lsp_lines' },
        T = { "<cmd>TodoTrouble<cr>", 'open Todo comments in Trouble' },
    },

})
