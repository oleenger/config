vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = "*.yml",
        command = "set filetype=ansible",
})
