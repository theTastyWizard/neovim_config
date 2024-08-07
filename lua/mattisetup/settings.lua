-- Til að vim opni nýa glugga undir og til hægri
vim.opt.splitbelow = true
vim.opt.splitright = true

-- notar ignore case nema það sé stór í leitarorði
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Láta nvim ripgrep nota smartcase
vim.opt.grepprg = "rg --vimgrep -uu --smart-case"

-- setja linenumber og relative ln
vim.opt.nu = true
vim.opt.relativenumber = true

-- hafa allt sem 4 space = tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Fyrir undotree plugin svo það muni lengi fra primeagen
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.undofile = true

-- https://www.reddit.com/r/vim/comments/jqogan/how_does_a_lower_updatetime_lead_to_better/
vim.opt.updatetime = 2000

vim.opt.termguicolors = true

vim.opt.scrolloff = 999

vim.opt.cursorline = true

vim.opt.splitkeep = 'cursor'

-- leyfir að færast lengra en lína í visual block mode
-- vim.opt.virtualedit = "block"

vim.opt.list = false -- enable or disable listchars
vim.opt.listchars = {
    eol = "↲",
    tab = "-->",
    trail = "+",
    extends = ">",
    precedes = "<",
    space = "·",
    nbsp = "␣",
}

-- Tells me if there is the line is wrapped
-- vim.g.showbreak = '↪' --NOTE: virðist ekki virka
