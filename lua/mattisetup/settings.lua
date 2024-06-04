-- Til að vim opni nýa glugga undir og til hægri
vim.opt.splitbelow = true
vim.opt.splitright = true

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
vim.opt.updatetime = 2000

vim.opt.termguicolors = true

vim.opt.scrolloff = 999

vim.opt.cursorline = true

vim.opt.splitkeep = 'screen'

vim.opt.list = true
vim.opt.listchars = {
    -- Replace tab whitespace with ->
    tab = '->',
    -- I don't care about spaces so spaces are just plain old whitespace
    multispace = ' ',
    -- nbsp=' ',
    -- If a line ends with a space, I probably do care about that, show this instead of whitespace
    -- trail = '',
    -- If the line goes off the screen (for some reason), show this as the last character of the line so I know the
    -- line continues to the right
    extends = '⟩',
    -- Literally the same but left
    precedes = '⟨'
}
-- Tells me if there is the line is wrapped
vim.g.showbreak = '↪' --NOTE: virðist ekki virka

-- TODO: virkar ekki þarf að setja autacmd
-- á að taka burt nýtt line með comment á o
-- vim.opt.formatoptions:remove("o")



