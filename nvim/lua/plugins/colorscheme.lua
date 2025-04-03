return {
  -- 'shaunsingh/nord.nvim',

  -- "neanias/everforest-nvim",
  -- lazy = false,
  -- priority = 1000,
  --
  -- config = function()
  --  require("everforest").setup({
  --     transparent_background_level = 0.2,
  --   })
  --   vim.cmd.colorscheme "everforest"
  -- end

  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('nordic').setup {
      transparent = {
        bg = true,
        float = true,
      },
    }
    vim.cmd.colorscheme 'nordic'
  end,
}
