return {
  'iamcco/markdown-preview.nvim',
  lazy = true,
  event = 'VeryLazy',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  config = function()
    vim.g.mkdp_combine_preview = 0
    vim.g.mkdp_auto_close = 0
    vim.keymap.set('n', '<leader>mt', '<CMD>MarkdownPreviewToggle<CR>', { desc = 'Toggle Markdown Preview' })
  end,
}
