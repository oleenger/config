return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  priority = 'VeryLazy',
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters = {
        ['markdownlint-cli2'] = {},
        md_table_pretty = {
          command = 'markdown-table-formatter',
          -- args = { "-p",  "0", "-" },
        },
      },
      formatters_by_ft = {
        javascript = { 'prettier' },
        css = { 'prettier' },
        html = { 'djlint' },
        htmldjango = { 'djlint' },
        json = { 'prettier' },
        -- yaml = { 'prettier' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        markdown = { 'prettier' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
