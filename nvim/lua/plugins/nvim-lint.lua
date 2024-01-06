require('lint').linters_by_ft = {
  ansible = {'ansible_lint',}
}

-- local ansible = require('lint').linters.ansible_lint
-- ansible.args = {
--   '-c ~/dev/ansible-bandak-deploy/.ansible-lint'
-- }

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end
})
