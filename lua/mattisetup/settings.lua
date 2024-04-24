vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Fyrir undotree plugin svo það muni lengi fra primeagen
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.undofile = true

-- https://www.reddit.com/r/vim/comments/jqogan/how_does_a_lower_updatetime_lead_to_better/
vim.opt.updatetime = 50

vim.opt.termguicolors = true
vim.opt.scrolloff = 999

-- TODO: virkar ekki þarf að setja autacmd
-- á að taka burt nýtt line með comment á o
vim.opt.formatoptions:remove("o")
