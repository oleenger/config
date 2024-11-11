local data = assert(vim.fn.stdpath "data") --[[@as string]]

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = require('telescope.actions').move_selection_previous, -- move to prev result
        ['<C-j>'] = require('telescope.actions').move_selection_next, -- move to next result
        ['<C-l>'] = require('telescope.actions').select_default, -- open file
      },
    },
  },
  pickers = {
    find_files = {
      file_ignore_patterns = { 'node_modules', '.git', '.venv' },
      hidden = true,
    },
  },
  live_grep = {
    file_ignore_patterns = { 'node_modules', '.git', '.venv' },
    additional_args = function(_)
      return { '--hidden' }
    end,
  },
  extensions = {
    wrap_results = true,
    fzf = {},

    ['ui-select'] = { require('telescope.themes').get_dropdown() },
  }, --extensions

}

--TODO: Refactor
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg='#333333' })

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
pcall(require("telescope").load_extension, "smart_history")
