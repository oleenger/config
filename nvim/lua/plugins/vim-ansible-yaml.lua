vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = "*.yml",
        command = "set filetype=ansible",
})


vim.cmd[[
        highlight PreProc guifg=orange
        highlight Boolean guifg=#dfaf87
        highlight ansibleRepeat guifg=#af875f
]]

