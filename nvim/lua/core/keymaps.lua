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

-- Tasks (managed by the `todo` command): keys mirror the horizons —
-- f = Now (Focus.md), n/w/l = Next/Waiting/Later (Todo.md, jump to the section).
local function open_task(path, section)
  vim.cmd('edit ' .. vim.fn.fnameescape(vim.fn.expand(path)))
  if section then
    vim.fn.cursor(1, 1)
    vim.fn.search('^## ' .. section, 'cW')
  end
end
local TODO = '~/obsidian/oleenger/Todo.md'
vim.keymap.set('n', '<leader>tf', function() open_task '~/obsidian/oleenger/Focus.md' end, { desc = 'Tasks: Now (Focus)' })
vim.keymap.set('n', '<leader>tn', function() open_task(TODO, 'Next') end, { desc = 'Tasks: Next' })
vim.keymap.set('n', '<leader>tw', function() open_task(TODO, 'Waiting') end, { desc = 'Tasks: Waiting' })
vim.keymap.set('n', '<leader>tl', function() open_task(TODO, 'Later') end, { desc = 'Tasks: Later' })

-- Capture the current line into a horizon (uppercase = push this line there).
-- Strips a leading bullet / [ ]|[x] checkbox, then hands it to the `todo` script.
-- If the buffer lives inside the vault, appends a [[backlink]] to the source note.
local TODO_BIN = vim.fn.expand '~/.config/scripts/todo'
local VAULT = vim.fn.expand '~/obsidian/oleenger'
local function capture(horizon, label)
  local t = vim.api.nvim_get_current_line()
  t = t:gsub('^%s*[-*+]%s+', ''):gsub('^%[.%]%s+', '')
  t = vim.trim(t)
  if t == '' then
    vim.notify('todo: nothing on this line', vim.log.levels.WARN)
    return
  end
  -- link back to the source note (vault-relative path, no .md), if we're in the vault
  local buf = vim.api.nvim_buf_get_name(0)
  if buf ~= '' and buf:sub(1, #VAULT) == VAULT then
    local rel = buf:sub(#VAULT + 2):gsub('%.md$', '')
    if rel ~= '' then t = t .. ' [[' .. rel .. ']]' end
  end
  vim.fn.system { TODO_BIN, horizon, t }
  if vim.v.shell_error ~= 0 then
    vim.notify('todo: failed to add', vim.log.levels.ERROR)
    return
  end
  vim.notify('→ ' .. label .. ': ' .. t)
end
vim.keymap.set('n', '<leader>tF', function() capture('f', 'Now') end, { desc = 'Tasks: add line to Now' })
vim.keymap.set('n', '<leader>tN', function() capture('n', 'Next') end, { desc = 'Tasks: add line to Next' })
vim.keymap.set('n', '<leader>tW', function() capture('w', 'Waiting') end, { desc = 'Tasks: add line to Waiting' })
vim.keymap.set('n', '<leader>tL', function() capture('l', 'Later') end, { desc = 'Tasks: add line to Later' })
