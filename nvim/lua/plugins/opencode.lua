return {
  "nickjvandyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    vim.g.opencode_opts = {}
    vim.o.autoread = true
  end,
  keys = {
    {
      "<leader>ao",
      function() require("opencode").ask("@this: ", { submit = true }) end,
      mode = { "n", "x" },
      desc = "OpenCode Ask",
    },
    {
      "<leader>ac",
      function() require("opencode").select() end,
      desc = "OpenCode Open",
    },
    {
      -- joins the <leader>o (obsidian) group; suggest-only AI triage of the Inbox
      "<leader>or",
      function()
        vim.cmd("edit " .. vim.fn.fnameescape(vim.fn.expand("~/obsidian/oleenger/Inbox/inbox.md")))
        require("opencode").ask(
          "Triage @this: for each '- [ ]' line output one line `[Do|Link|Drop] <text> — <reason/target>`. "
            .. "Do = under 2 min. Link = belongs in a project/note (suggest a folder or [[note]]). Drop = noise. "
            .. "Only print the list; do not edit any files.",
          { submit = true }
        )
      end,
      desc = "Obsidian: AI triage inbox",
    },
  },
}
