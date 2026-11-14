-- Obsidian-style rendering. Colours come from the notes page palette
-- (lua/notes), which is applied per Markdown window; see after/ftplugin/markdown.lua
-- for the local editing options.
return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  -- Neovim bundles the markdown/markdown_inline parsers; mini.icons is shared with oil.
  dependencies = { 'echasnovski/mini.icons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    preset = 'obsidian',
    render_modes = true, -- render in insert mode too; anti-conceal still applies
    -- No ①/② icons: the '#'/'##' markers stay visible in every mode, dimmed via the
    -- @markup.heading.marker capture (after/queries/markdown/highlights.scm).
    -- Levels differ by colour (lua/notes); H1 gets a full-width rule, H2 an
    -- underline as wide as its text.
    heading = {
      sign = false,
      icons = {},
      border = { true, true, false },
      width = { 'full', 'block' },
      above = ' ',
      below = '─',
      backgrounds = {
        'NotesH1Rule',
        'NotesH2Rule',
        'RenderMarkdownH3Bg',
        'RenderMarkdownH4Bg',
        'RenderMarkdownH5Bg',
        'RenderMarkdownH6Bg',
      },
    },
    code = { style = 'full', sign = false },
    win_options = { conceallevel = { rendered = 2 } },
  },
}
