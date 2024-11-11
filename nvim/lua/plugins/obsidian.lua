return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "oleenger",
        path = "~/obsidian/oleenger/",
      },
    },
    templates = {
      subdir = ".templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },
  },
  config = function()

    -- navigate to vault
    vim.keymap.set("n", "<leader>oo", ":cd ~/obsidian/oleenger/<cr>")
   
    -- search for files in full vault
    vim.keymap.set("n", "<leader>os", ":Telescope find_files search_dirs={\"~/obsidian/oleenger/\"}<cr>")
    vim.keymap.set("n", "<leader>oz", ":Telescope live_grep search_dirs={\"~/obsidian/oleenger\"}<cr>")

  end
}
