return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        css = { 'prettier' },
        html = { 'djlint' },
        htmldjango = { 'djlint' },
        json = { 'prettier' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        markdown = { 'prettier' },
      },
      format_on_save = {
        lsp_format = 'fallback',
        timeout_ms = 1000,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      conform.format {
        lsp_format = 'fallback',
        async = false,
        timeout_ms = 2000,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
