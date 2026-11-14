return {
  'marko-cerovac/material.nvim',
  config = function()
    require('material').setup {
      lualine_style = 'stealth',
      -- Match WezTerm's background (Gruvbox Material #282828) so the window
      -- padding and Neovim read as one surface.
      custom_colors = function(colors)
        colors.editor.bg = '#282828'
      end,
    }
    vim.g.material_style = 'darker'
    vim.cmd 'colorscheme material'
  end,
}
