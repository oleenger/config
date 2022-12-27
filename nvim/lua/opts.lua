local set = vim.opt

set.guicursor = ""
set.nu = true
set.relativenumber = true
set.ignorecase = true
set.smartcase = true
set.completeopt = 'menuone,noselect'
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.smartindent = true

set.wrap = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true

set.termguicolors = true

set.scrolloff = 8
set.signcolumn = "yes"
set.isfname:append("@-@")
set.updatetime = 50

vim.g.cellmode_use_tmux=1
vim.g.cellmode_tmux_panenumber=1

set.background = "dark"
set.completeopt = "noinsert,menuone,noselect"
set.cursorline = true

set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldmethod = "manual"
set.hidden = true
set.inccommand = "split"

set.smarttab = true
set.splitbelow = true
set.splitright = true

set.termguicolors = true
set.title = true
set.ttimeoutlen = 0
set.updatetime = 250
set.wildmenu = true
