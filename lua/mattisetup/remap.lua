vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = 'Close nvim' })
vim.keymap.set("n", "<leader>x", "<cmd>x<cr>", { desc = 'Save and close nvim' })
vim.keymap.set("n", "<leader>w", "<cmd>up<cr>", { desc = 'Update file' })

-- Nota alt til að færa á milli ramma fyrir terminal og insert
vim.keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-N><C-w>l")

-- sama nema fyrir normal og visual
vim.keymap.set({ "n", "v" }, "<A-h>", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<A-j>", "<C-w>j")
vim.keymap.set({ "n", "v" }, "<A-k>", "<C-w>k")
vim.keymap.set({ "n", "v" }, "<A-l>", "<C-w>l")

-- ef Oil er ekki tilstaðar
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = 'Open netrw Explore' })

-- Hraðari færsla
vim.keymap.set("n", "J", "6j", { desc = '6 lines down' })
vim.keymap.set("n", "K", "6k", { desc = '6 lines up' })

-- next greatest remap ever asbjornHaland tekið frá primeagen
-- setur system clipboard á space+ y, Y og p,P
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = 'System clipboard yank' })
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], { desc = 'System clipboard Yank' })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = 'System clipboard paste' }) --FIX: virkar ekki á win
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]], { desc = 'System clipboard Paste' })

-- passar að yankaðir hlutir eyðist ekki eftir paste
-- vim.keymap.set("x", "<leader>p", "\"_dP") --FIX: virðist vera ástæða þess að paste úr + virkaði ekki rétt

-- Til að ctrl-V Insert virki með ctrl-c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Terminal remap til að sleppa úr terminalmode með ESC
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- heldur öllu í miðjunni á skjánum
-- NOTE: nota scrolloff=999 í staðinn
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
