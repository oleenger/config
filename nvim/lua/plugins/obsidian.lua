local VAULT_PATH = '~/obsidian/oleenger'
local vault = vim.fn.expand(VAULT_PATH)

local function vault_find()
  require('telescope.builtin').find_files { cwd = vault }
end

local function vault_grep()
  require('telescope.builtin').live_grep { cwd = vault }
end

return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },

  -- loads the plugin when any Obsidian command runs (so the keys below work
  -- from any buffer, not only after a markdown file has opened it)
  cmd = { 'ObsidianNew', 'ObsidianFollowLink', 'ObsidianBacklinks', 'ObsidianToday', 'ObsidianToggleCheckbox' },

  -- one home for every Obsidian action; letters mirror the `o` CLI (n/f/o)
  keys = {
    { '<leader>oo', '<cmd>ObsidianFollowLink<CR>', desc = 'Obsidian: follow link under cursor' },
    -- new notes go through the `o n` CLI so there is ONE creation path (fzf-pick
    -- the folder, typed frontmatter, meetings routed) shared with the terminal
    { '<leader>on', function()
      vim.cmd 'botright 12split | enew'
      vim.fn.termopen('o n', { on_exit = function() vim.cmd 'silent! bdelete!' end })
      vim.cmd 'startinsert'
    end, desc = 'Obsidian: new note (o n)' },
    { '<leader>of', vault_find, desc = 'Obsidian: find note' },
    { '<leader>og', vault_grep, desc = 'Obsidian: grep vault' },
    { '<leader>ob', '<cmd>ObsidianBacklinks<CR>', desc = 'Obsidian: backlinks' },
    { '<leader>ot', '<cmd>ObsidianToday<CR>', desc = "Obsidian: today's note" },
    { '<leader>oc', '<cmd>ObsidianToggleCheckbox<CR>', desc = 'Obsidian: toggle checkbox' },
  },

  opts = {
    workspaces = {
      {
        name = 'vault',
        path = VAULT_PATH,
      },
    },
    -- keep daily notes in daily/YYYY-MM-DD.md so the `o t` CLI verb and
    -- <leader>ot resolve to the exact same file
    daily_notes = { folder = 'daily', date_format = '%Y-%m-%d' },
    -- :ObsidianNew (<leader>on) drops bare-title notes into Inbox/ for triage;
    -- typing a path in the prompt still overrides
    notes_subdir = 'Inbox',
    new_notes_location = 'notes_subdir',
    -- name files by the slugified title (like the `o n` CLI), not a zettel id
    note_id_func = function(title)
      if title ~= nil then
        return title:gsub(' ', '-'):gsub('[^%w-]', ''):lower()
      end
      return tostring(os.time())
    end,
  },

  config = function(_, opts)
    require('obsidian').setup(opts)
  end,
}
