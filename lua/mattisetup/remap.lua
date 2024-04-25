vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = 'Close nvim' })
vim.keymap.set("n", "<leader>x", "<cmd>x<cr>", { desc = 'Save and close nvim' })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = 'Save file' })

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
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Leyfir að færa valda hluti up og niður í visual mode með J og K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- heldur öllu í miðjunni á skjánum
-- NOTE: nota scrolloff=999 í staðinn
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- Til að ctrl-V Insert virki með ctrl-c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Terminal remap
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
