local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }


use('theprimeagen/harpoon')

use 'nvim-lualine/lualine.nvim' -- Fancier statusline
use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

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


use({
  "neanias/everforest-nvim",
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup()
  end,
})

require("everforest").setup({
  background = "hard",
})


use {
  'nvim-tree/nvim-tree.lua',
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}





end)
