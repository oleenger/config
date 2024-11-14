-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-s>g', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<C-s>w', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<C-s>h', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<C-s>k', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<C-s>s', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<C-s>d', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<C-s>r', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<C-s>.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', 'b', builtin.buffers, { desc = '[ ] Find existing buffers' })


-- Grep Obsidian Notes
vim.keymap.set("n", "<C-s>og", function()
  builtin.live_grep { cwd = '~/obsidian/oleenger/notes'}
end)

-- Search Obsidian Notes
vim.keymap.set("n", "<C-S>on", function()
  builtin.find_files { cwd = '~/obsidian/oleenger/notes'}
end)

-- Search NeoVIM config files
vim.keymap.set("n", "<C-s>co", function()
  builtin.find_files { cwd = vim.fn.stdpath "config" }
end)


-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<C-s>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<C-s>so', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })
