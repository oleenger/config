return {
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-k>'] = false,
          ['<C-j>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
      }

      -- Open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

      -- Open Oil in floating windows
      vim.keymap.set('n', '<C-o>', '<cmd>Oil --float<CR>', { desc = 'Open Oil floating window' })
    end,
  },
}
