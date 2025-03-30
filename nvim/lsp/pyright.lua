---@type vim.lsp.Config

return {
  cmd = { 'pyright' },
  root_markers = { '.git' },
  filetypes = { 'python' },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
