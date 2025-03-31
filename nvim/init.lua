require 'core.options' -- Load general options
require 'core.snippets' -- Custom code snippetsp
require 'core.keymaps' -- Load general keymaps

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.python3_host_prog = '/opt/homebrew/bin/python3'

-- Set up plugins
require('lazy').setup {
  -- require 'plugins.neotree',
  -- require 'plugins.telescope-file-browser',
  require 'plugins.mason',
  require 'plugins.oil',
  require 'plugins.hop',
  -- require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.dim',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  -- require 'plugins.fugi',
  require 'plugins.trouble',
  require 'plugins.autocompletion',
  -- require 'plugins.render-markdown',
  -- require 'plugins.none-ls',
  require 'plugins.gitsigns',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.comment',
  require 'plugins.dressing',
  require 'plugins.linting',
  require 'plugins.lazygit',
  require 'plugins.nvim-metals',
  require 'plugins.conform',
  require 'plugins.vim-maximizer',
  require 'plugins.aerial',
  require 'plugins.obsidian',
  -- require 'plugins.markdown-preview',
  require 'plugins.colorscheme',
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
