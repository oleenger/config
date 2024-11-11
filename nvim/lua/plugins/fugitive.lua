return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  config = function()
    
    vim.keymap.set("n", "gs", ":Git status<cr>", { desc = "Git status" })
    vim.keymap.set("n", "gd", ":Git diff<cr>", { desc = "Git diff" })
    vim.keymap.set("n", "ga", ":Git add .<cr>", { desc = "Git add ." })
    vim.keymap.set("n", "gp", ":Git commit<cr>", { desc = "Git commit" })
      


  end
}
