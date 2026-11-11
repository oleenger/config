return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'modern',
    blend = {
      factor = 0.22,
    },
  },
  keys = {
    { '<leader>l', function() require('tiny-inline-diagnostic').toggle() end, desc = 'Toggle inline diagnostics' },
  },
}
