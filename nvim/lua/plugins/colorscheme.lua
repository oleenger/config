-- lua/plugins/rose-pine.lua
return {
  'marko-cerovac/material.nvim',
  config = function()
    require('material').setup {
      lualine_style = 'stealth',
    }
    vim.g.material_style = 'darker'
    -- vim.g.material_style = 'oceanic'
    vim.cmd 'colorscheme material'
  end,
}
-- return {
--   -- "shaunsingh/nord.nvim",
--   "neanias/everforest-nvim",
--   lazy = false,
--   priority = 1000,
--
--   config = function()
--    require("everforest").setup({
--       transparent_background_level = 0.2,
--     })
--     vim.cmd.colorscheme "everforest"
--   end
-- }
