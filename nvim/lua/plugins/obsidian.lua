return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    disable_frontmatter = true,
    workspaces = {
      {
        name = 'personal',
        path = '~/obsidian/oleenger',
        overrides = {
          templates = {
            subdir = '_templates',
            date_format = '%Y-%m-%d',
            time_format = '%H:%M:%S',
          },
        },
      },
    },
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ''

      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end

      local date_format = os.date '%Y-%m-%d'
      return tostring(date_format) .. '-' .. suffix
    end,

    -- see below for full list of options 👇
  },
}

-- return {
--   -- 'epwalsh/obsidian.nvim',
--   'obsidian-nvim/obsidian.nvim',
--
--   version = '*', -- recommended, use latest release instead of latest commit
--   -- lazy = true,
--   ft = 'markdown',
--   -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
--   -- event = {
--   --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
--   --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
--   --   -- refer to `:h file-pattern` for more examples
--   --   "BufReadPre path/to/my-vault/*.md",
--   --   "BufNewFile path/to/my-vault/*.md",
--   -- },
--   dependencies = {
--     -- Required.
--     'nvim-lua/plenary.nvim',
--   },
--   opts = {
--     workspaces = {
--       {
--         name = 'oleenger',
--         path = '~/obsidian/oleenger/',
--       },
--     },
--     templates = {
--       subdir = '_templates',
--       date_format = '%Y-%m-%d',
--       time_format = '%H:%M:%S',
--     },
--   },
--   config = function()
--     -- navigate to vault
--     vim.keymap.set('n', '<leader>oo', ':cd ~/obsidian/oleenger/<cr>')
--
--     -- search for files in full vault
--     vim.keymap.set('n', '<leader>os', ':Telescope find_files search_dirs={"~/obsidian/oleenger/"}<cr>')
--     vim.keymap.set('n', '<leader>oz', ':Telescope live_grep search_dirs={"~/obsidian/oleenger"}<cr>')
--   end,
-- }
