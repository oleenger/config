return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = { 'nvim-lua/plenary.nvim' },

  opts = {
    workspaces = {
      {
        name = 'vault',
        path = '~/obsidian/oleenger',
      },
    },

    -- SMART SECTION-BASED FOLDER ROUTING
  },

  config = function(_, opts)
    local obsidian = require 'obsidian'
    obsidian.setup(opts)

    ------------------------------------------------------
    -- <leader>oc
    -- Create note → insert wiki link → open with vsplit 70% → jump
    ------------------------------------------------------

    vim.keymap.set('n', '<leader>oc', function()
      ------------------------------------------------------------
      -- 0. Extract title & Index context
      ------------------------------------------------------------
      local line = vim.fn.getline '.'
      local title = line:gsub('^%s*[-*]%s*', '')

      local index_win = vim.api.nvim_get_current_win()
      local index_buf = vim.api.nvim_get_current_buf()
      local row = vim.api.nvim_win_get_cursor(index_win)[1]

      ------------------------------------------------------------
      -- 1. Detect section from Index.md
      ------------------------------------------------------------
      local section = nil
      for i = row, 1, -1 do
        local l = vim.api.nvim_buf_get_lines(index_buf, i - 1, i, false)[1]
        if l then
          local h2 = l:match '^##%s*(.+)'
          if h2 then
            section = h2:lower()
            break
          end
        end
      end

      ------------------------------------------------------------
      -- 2. Determine folder based on section
      ------------------------------------------------------------
      local subdir = 'notes'
      if section == 'now' then
        subdir = 'tasks/now'
      elseif section == 'soon' then
        subdir = 'tasks/soon'
      elseif section == 'waiting' then
        subdir = 'tasks/waiting'
      elseif section == 'someday' then
        subdir = 'someday'
      end

      ------------------------------------------------------------
      -- 3. Construct full path
      ------------------------------------------------------------
      local vault = opts.workspaces[1].path
      local full_path = vim.fn.expand(vault .. '/' .. subdir .. '/' .. title .. '.md')

      ------------------------------------------------------------
      -- 4. Create directories if needed
      ------------------------------------------------------------
      vim.fn.mkdir(vault .. '/' .. subdir, 'p')

      ------------------------------------------------------------
      -- 6. Open the note in THIS window
      ------------------------------------------------------------
      vim.cmd('edit ' .. vim.fn.fnameescape(full_path))

      ------------------------------------------------------------
      -- 7. Replace bullet with wiki link in Index.md
      ------------------------------------------------------------
      vim.api.nvim_set_current_win(index_win)

      ------------------------------------------------------------
      -- 8. Switch focus back to the new note
      ------------------------------------------------------------
      -- find the window containing the new file
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.api.nvim_buf_get_name(buf)
        if name == full_path then
          vim.api.nvim_set_current_win(win)
          break
        end
      end
    end, { desc = 'Create Obsidian note manually (v3.9.0 compatible)' })

    ------------------------------------------------------
    -- <leader>oo: follow wiki link under cursor
    ------------------------------------------------------
    vim.keymap.set('n', '<leader>oo', function()
      obsidian.follow_link()
    end, { desc = 'Open Obsidian link under cursor' })
  end,
}
