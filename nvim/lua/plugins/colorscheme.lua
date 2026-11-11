return {
  'marko-cerovac/material.nvim',
  config = function()
    require('material').setup {
      lualine_style = 'stealth',
    }
    vim.g.material_style = 'darker'
    vim.cmd 'colorscheme material'
  end,
}
