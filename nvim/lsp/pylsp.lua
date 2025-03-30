---@type vim.lsp.Config

return {
  cmd = { 'pylsp' },
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
