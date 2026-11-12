return {
  {
    'williamboman/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      automatic_enable = { exclude = { 'vale_ls' } }, -- English prose rules are noisy in mixed-language notes
      -- list of servers for mason to install
      ensure_installed = {
        'ts_ls',
        'html',
        'cssls',
        'tailwindcss',
        'lua_ls',
        'emmet_ls',
        'prismals',
        'marksman',
        'pyright',
        'eslint',
      },
    },
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = {
          ui = {
            icons = {
              package_installed = '✓',
              package_pending = '➜',
              package_uninstalled = '✗',
            },
          },
        },
      },
      'neovim/nvim-lspconfig',
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    event = 'VeryLazy',
    opts = {
      ensure_installed = {
        'markdownlint-cli2',
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'isort', -- python formatter
        'black', -- python formatter
        'flake8', -- python linter
        'bandit', -- python security linter
        'djlint',
      },
    },
    dependencies = {
      'williamboman/mason.nvim',
    },
  },
}
