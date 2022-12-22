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

  use({
	  "neanias/everforest-nvim",
	  -- Optional; default configuration will be used if setup isn't called.
	  config = function()
		  require("everforest").setup()
	  end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  if packer_bootstrap then
	  require('packer').sync()

	  require("everforest").setup({
		  background = "hard",
	  })

	 

  end


vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>to", vim.cmd.NvimTreeOpen)
vim.keymap.set("n", "<leader>tc", vim.cmd.NvimTreeClose)

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.completeopt = 'menuone,noselect'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.cmd([[colorscheme everforest]])
vim.cmd [[set mouse=a]]

vim.opt.updatetime = 50


-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Undo and redo
vim.keymap.set("n", "<C-Z>", "u")
vim.keymap.set("n", "<C-Y>", "<C-R>")
vim.keymap.set("i", "<C-Z>", "<C-O>u")
vim.keymap.set("i", "<C-Y>", "<C-O><C-R>")

-- delete word and insert
vim.keymap.set("n", "<leader>r", "ciw")

  end)
