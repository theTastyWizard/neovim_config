-- Leader sem space
vim.g.mapleader = " "

-- Til að aftengja tab og c-i
vim.keymap.set("n", "<C-I>", "<C-I>")
vim.keymap.set("n", "<Tab>", "<Nop>")

vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = 'Close nvim' })
vim.keymap.set("n", "<leader>!", "<cmd>q!<cr>", { desc = 'Close nvim with force' })
vim.keymap.set("n", "<leader>x", "<cmd>x<cr>", { desc = 'Update and close nvim' })
vim.keymap.set("n", "<leader>w", "<cmd>up<cr>", { desc = 'Update file' })

-- Nota alt til að færa á milli ramma fyrir terminal og insert
vim.keymap.set({ "t", "i" }, "<C-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set({ "t", "i" }, "<C-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set({ "t", "i" }, "<C-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set({ "t", "i" }, "<C-l>", "<C-\\><C-N><C-w>l")

-- sama nema fyrir normal og visual
vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l")

-- better end and start of the line
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Start of the line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "End of the line" })

-- ef Oil er ekki tilstaðar
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = 'Open netrw Explore' })

-- Hraðari færsla
vim.keymap.set("n", "J", "6j", { desc = '6 lines down' })
vim.keymap.set("n", "K", "6k", { desc = '6 lines up' })

-- Auðveldari leitar takkar
vim.keymap.set("n", "þ", "/", { desc = 'search forward' })
vim.keymap.set("n", "Þ", "?", { desc = 'search backward' })

-- Auðveldari string leit
vim.keymap.set("n", "ð", "*", { desc = 'search word forward' })
vim.keymap.set("n", "Ð", "#", { desc = 'search word backward' })

-- next greatest remap ever asbjornHaland tekið frá primeagen
-- setur system clipboard á space+ y, Y og p,P
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = 'System clipboard yank' })
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], { desc = 'System clipboard Yank' })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+]p]], { desc = 'System clipboard put' })
vim.keymap.set({ "n", "v" }, "<leader>P", [["+]P]], { desc = 'System clipboard Put' })
vim.keymap.set({ "n", "v" }, "<leader>]p", [["+]p]], { desc = 'System clipboard put & indent' })
vim.keymap.set({ "n", "v" }, "<leader>]P", [["+]P]], { desc = 'System clipboard Put & indent' })

-- yank comment and put
-- vim.keymap.set({ "n", "v" }, "ycc", "yygccp", { remap = true, desc = 'yank comment and put' })

-- normal put with correct indent
-- vim.keymap.set({ "n", "v" }, "p", "]p", { desc = 'put with indent' })
-- vim.keymap.set({ "n", "v" }, "P", "]P", { desc = 'Put with indent' })

-- passar að yankaðir hlutir eyðist ekki eftir put
vim.keymap.set("x", "p", "\"_dP")

-- Til að ctrl-V Insert virki með ctrl-c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Terminal remap til að sleppa úr terminalmode með ESC
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
