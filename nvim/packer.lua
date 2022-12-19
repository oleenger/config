-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

use('theprimeagen/harpoon')

use 'nvim-lualine/lualine.nvim' -- Fancier statusline
use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

require('lualine').setup {
  options = {
    icons_enabled = false,
    component_separators = '|',
    section_separators = '',
  },
}

use({
  "neanias/everforest-nvim",
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup()
  end,
})

require("everforest").setup({
  background = "hard",
  transparent_background_level = 0,
})
require("lualine").setup({
  options = {
    theme = "auto", -- Can also be "auto" to detect automatically.
  }
})

require('Comment').setup()

require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

use {
  'nvim-tree/nvim-tree.lua',
}





end)
