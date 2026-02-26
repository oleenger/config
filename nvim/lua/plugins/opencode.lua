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
  },
}
