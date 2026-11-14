-- Centered writing column. lua/notes enables it automatically for a note shown in a
-- single-window tab (and disables it when that window leaves Markdown); :NoNeckPain
-- still toggles it by hand. Side buffers use the notes page colour.
return {
  'shortcuts/no-neck-pain.nvim',
  version = '*',
  cmd = 'NoNeckPain',
  opts = function()
    local palette = require('notes').palette()
    return {
      width = 80,
      autocmds = {
        enableOnVimEnter = false,
        enableOnTabEnter = false,
      },
      buffers = {
        colors = { background = palette.bg },
        wo = { fillchars = 'eob: ,vert: ' },
      },
    }
  end,
}
