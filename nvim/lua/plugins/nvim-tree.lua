return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeClose', 'NvimTreeFindFile' },
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle file tree' },
  },
  opts = {},
}
