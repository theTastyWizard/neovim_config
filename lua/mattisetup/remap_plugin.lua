local wk = require("which-key")

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = 'Open Oil' })

wk.add({
    { "<leader>t",  group = "Terminal" },
    { "<leader>tc", "<cmd>:FloatermNew --autoclose=0 gcc % -o %< && ./%<<cr>",              desc = "Run C code" },
    { "<leader>tt", "<cmd>FloatermNew --name=Main --wintype=split --height=0.18 fish <cr>", desc = "Open Main Terminal" },
})
wk.add({
    { "<leader>d",  group = "Diagnostics" },
    { "<leader>dT", "<cmd>TodoTrouble<cr>",                    desc = "open Todo comments in Trouble" },
    { "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "go to next diagnostic" },
    { "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "go to previous diagnostic" },
})
