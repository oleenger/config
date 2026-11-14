return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      python = { 'flake8', 'bandit' },
      markdown = { 'markdownlint-cli2' },
    }

    -- Base config (.markdownlint.yaml next to init.lua): MD013 line length off.
    lint.linters['markdownlint-cli2'].args = { '--config', vim.fn.stdpath 'config' .. '/.markdownlint.yaml', '-' }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

  end,
}
