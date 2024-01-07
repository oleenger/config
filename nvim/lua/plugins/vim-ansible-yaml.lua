vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = "*.yml",
        command = "set filetype=ansible",
})


vim.cmd[[
        highlight PreProc guifg=orange
        highlight Boolean guifg=darkorange
        highlight ansibleRepeat guifg=darkyellow
]]

