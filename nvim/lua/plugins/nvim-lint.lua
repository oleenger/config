require('lint').linters_by_ft = {
  ansible = {'ansible_lint',}
}


vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
