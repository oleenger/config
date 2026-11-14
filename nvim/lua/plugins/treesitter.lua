-- Highlight, edit, and navigate code.
-- Neovim 0.12 needs nvim-treesitter's `main` branch: the frozen `master` branch's
-- query directives crash on 0.12 (e.g. Markdown fenced-code injections).
-- `main` only installs parsers/queries; highlighting and indent are enabled below.
-- Requires tree-sitter CLI >= 0.26.1 (brew install tree-sitter-cli) and a C compiler.
local parsers = {
  'lua',
  'python',
  'javascript',
  'vimdoc',
  'vim',
  'regex',
  'terraform',
  'sql',
  'dockerfile',
  'toml',
  'json',
  'java',
  'gitignore',
  'yaml',
  'make',
  'cmake',
  'markdown',
  'markdown_inline',
  'bash',
  'tsx',
  'css',
  'html',
}

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false, -- main does not support lazy-loading
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install(parsers) -- async; no-op when already installed

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter_start', { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang or not vim.treesitter.language.add(lang) then
          return -- no parser for this filetype: keep regex syntax
        end
        vim.treesitter.start(args.buf, lang)
        if vim.treesitter.query.get(lang, 'indents') then -- like master: only where queries exist
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
