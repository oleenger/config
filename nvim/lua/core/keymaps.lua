-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Quickfix
vim.keymap.set('n', '<C-n>', '<cmd>cnext<CR>', { desc = 'Quickfix Next' })
vim.keymap.set('n', '<C-p>', '<cmd>cprev<CR>', { desc = 'Quickfix Prev' })

-- DB Browser
vim.keymap.set('n', '<leader>dbs', ':!~/deploy-dbbrowser-stage.sh<CR>', { desc = 'Deploy DB Browser - STAGE' })

-- For conciseness
local opts = { noremap = true, silent = true }

vim.keymap.set('i', 'jj', '<ESC>', { desc = 'Exit insert mode' })
vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- save file without auto-formatting
-- vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', '<S-j>', '<C-d>zz', opts)
vim.keymap.set('n', '<S-k>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Buffers
vim.keymap.set('n', '<leader>bb', '<C-^><CR>', opts) -- new buffer
vim.keymap.set('n', '<leader>bx', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>bn', '<cmd> enew <CR>', opts) -- new buffer

-- Move up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

vim.keymap.set('n', '<leader>s', [[:%s/<C-r><C-w>//gI<Left><Left><Left>]])

-- Toggle line wrapping
-- vim.keymap.set('n', '<leader>sw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { remap = false })
