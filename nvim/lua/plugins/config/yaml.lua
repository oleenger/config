-- LSP Configuration
require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        kubernetes = 'k8s-*.yaml',
        ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*',
        ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
        ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/**/*.{yml,yaml}',
        ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
        ['http://json.schemastore.org/kustomization'] = 'kustomization.{yml,yaml}',
        ['http://json.schemastore.org/chart'] = 'Chart.{yml,yaml}',
        ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}',
      },
    },
  },
}

-- Autocompletion
local cmp = require 'cmp'
cmp.setup.buffer {
  sources = {
    { name = 'vsnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
  },
}
