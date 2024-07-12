local autocmd = vim.api.nvim_create_autocmd

-- leyfa að loka fleiri gluggum með q
autocmd("FileType", {
    pattern = {
        "git",
        "dap-float",
        "startuptime",
        "query", -- ekki viss hvað þetta er
        "help",
        "lspinfo",
        "notify",
        "man",
        "qf",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", {buffer = event.buf, silent = true})
    end,
    desc = "Close certain windows with q",
})

-- Ekki commenta á nýar línur 
autocmd("BufEnter", {
    callback = function ()
        vim.opt.formatoptions:remove({"c", "r", "o"})
    end,
    desc = "Disable new line comment",
})
