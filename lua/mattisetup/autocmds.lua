local autocmd = vim.api.nvim_create_autocmd

-- leyfa að loka fleiri gluggum með q
autocmd("FileType", {
    pattern = {
        "git",
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
})

-- Ekki commenta á nýar línur 
autocmd("BufEnter", {
    pattern = "*",
    command = "set fo-=c fo-=r fo-=o",
})
