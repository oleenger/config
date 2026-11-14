
vim.loader.enable() -- Enable Lua bytecode cache for faster startup

require 'core.options' -- Load general options
require 'core.snippets' -- Diagnostics and highlight helpers
require 'core.keymaps' -- Load general keymaps
require 'core.lsp' -- LSP keymaps and diagnostic signs

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

-- Markdown writing page: 'dark' or 'light'. Read once by lua/notes; restart to change.
vim.g.notes_theme = 'dark'

-- Set up plugins
require('lazy').setup({
  require 'plugins.colorscheme',
  require 'plugins.mason',
  require 'plugins.oil',
  require 'plugins.nvim-tree',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.trouble',
  require 'plugins.autocompletion',
  require 'plugins.render-markdown',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.linting',
  require 'plugins.lazygit',
  require 'plugins.tiny-diagnostics',
  require 'plugins.conform',
  require 'plugins.vim-maximizer',
  require 'plugins.harpoon',
  require 'plugins.markdown-preview',
  require 'plugins.obsidian',
  require 'plugins.no-neck-pain',
}, {
  rocks = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
        'netrwPlugin',
        'man',
      },
    },
  },
})

-- Obsidian-style page for Markdown windows (palette, headings, centering)
require('notes').setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
