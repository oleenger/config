-- Writing-oriented local options for Markdown. Colours live in lua/notes.
local o = vim.opt_local

o.wrap = true
o.linebreak = true
o.breakindent = true
-- Hanging indent: wrapped lines of '1.' / '-' items align with the item text
-- (list markers come from the markdown ftplugin's 'formatlistpat').
o.breakindentopt = 'list:-1'
o.spell = true
o.spelllang = 'en' -- optionally 'en,nb'; install missing spell files if prompted

o.number = false
o.relativenumber = false
o.signcolumn = 'no'
o.foldcolumn = '0'
o.cursorline = false
o.fillchars = 'eob: ,vert: '

-- Start the built-in highlighter (bundled parser), independent of nvim-treesitter.
local ok, err = pcall(vim.treesitter.start, 0, 'markdown')
if not ok then
  vim.notify('Markdown Treesitter: ' .. tostring(err), vim.log.levels.WARN)
end

-- Undo these when the buffer's filetype changes.
local undo = 'setlocal wrap< linebreak< breakindent< breakindentopt< spell< spelllang< '
  .. 'number< relativenumber< signcolumn< foldcolumn< cursorline< fillchars<'
vim.b.undo_ftplugin = (vim.b.undo_ftplugin and (vim.b.undo_ftplugin .. ' | ') or '') .. undo
