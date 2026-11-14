-- Obsidian-style page for Markdown, entirely inside Neovim (no terminal changes).
--
-- * Attaches a highlight namespace to ordinary Markdown windows only; the global
--   colorscheme is untouched and each window's previous namespace is restored.
-- * Centres a single-window note with no-neck-pain side buffers (Obsidian margins).
local M = {}
local ns = vim.api.nvim_create_namespace 'notes_page'
local previous_ns = {}
local queued, initialized = false, false

local palettes = {
  light = {
    bg = '#ffffff', fg = '#222222', heading = '#111111', muted = '#8a8a8a',
    faint = '#f5f5f5', code_bg = '#f6f6f6', accent = '#7852ee',
    note = '#086ddd', tip = '#08a04a', warn = '#e07000', danger = '#e93147',
    selection = '#e4ddfd', search = '#fff3a3', inc_search = '#ffd580',
    nontext = '#cccccc', secondary = '#555555', quote = '#444444',
    border = '#e0e0e0', quote_bar = '#d0d0d0', table_head = '#c8c8c8',
    string = '#2a7d4f', keyword = '#a0459b', func = '#1f5fbf',
    number = '#b35c00', punctuation = '#666666',
    -- heading levels step from strongest to softest; rules under H1/H2
    h = { '#000000', '#2a2a2a', '#404040', '#555555', '#6a6a6a', '#7f7f7f' },
    rule = { '#9e9e9e', '#c4c4c4' },
  },
  dark = {
    -- bg, faint and code_bg are replaced at runtime from the colorscheme's Normal
    -- background (see resolve_surfaces), so notes match the rest of Neovim.
    bg = '#282828', fg = '#d4d4d4', heading = '#f2f2f2', muted = '#999999',
    faint = '#2f2f2f', code_bg = '#323232', accent = '#a78bfa',
    note = '#7aa2f7', tip = '#8fbc8f', warn = '#e5b567', danger = '#f07178',
    selection = '#403653', search = '#51451f', inc_search = '#665126',
    nontext = '#555555', secondary = '#b3b3b3', quote = '#bdbdbd',
    border = '#454545', quote_bar = '#666666', table_head = '#777777',
    string = '#a3be8c', keyword = '#c792ea', func = '#82aaff',
    number = '#e5b567', punctuation = '#b3b3b3',
    -- heading levels step from strongest to softest; rules under H1/H2
    h = { '#ffffff', '#d9d9d9', '#c4c4c4', '#b0b0b0', '#9c9c9c', '#8a8a8a' },
    rule = { '#6a6a6a', '#555555' },
  },
}

-- Read once; restart Neovim to change theme and centering colours together.
local theme = vim.g.notes_theme or 'dark'
assert(palettes[theme], 'notes_theme must be "dark" or "light"')
local p = vim.deepcopy(palettes[theme])

-- Mix two '#rrggbb' colours; t = 0 gives a, t = 1 gives b.
local function mix(a, b, t)
  local out = {}
  for i = 0, 2 do
    local x, y = tonumber(a:sub(2 + i * 2, 3 + i * 2), 16), tonumber(b:sub(2 + i * 2, 3 + i * 2), 16)
    out[#out + 1] = ('%02x'):format(math.floor(x + (y - x) * t + 0.5))
  end
  return '#' .. table.concat(out)
end

-- Dark notes use the colorscheme's own background; slightly lighter tints of it
-- mark the cursor line and code blocks. Light mode keeps its white page.
local function resolve_surfaces()
  if theme ~= 'dark' then
    return
  end
  local normal = vim.api.nvim_get_hl(0, { name = 'Normal', link = false })
  if normal.bg then
    p.bg = ('#%06x'):format(normal.bg)
    p.faint = mix(p.bg, '#ffffff', 0.04)
    p.code_bg = mix(p.bg, '#ffffff', 0.07)
  end
end

function M.palette()
  resolve_surfaces()
  return vim.deepcopy(p)
end

local function hl(group, opts)
  vim.api.nvim_set_hl(ns, group, opts)
end

local function define_highlights()
  resolve_surfaces()
  -- the page
  hl('Normal', { fg = p.fg, bg = p.bg })
  hl('NormalNC', { fg = p.fg, bg = p.bg })
  hl('EndOfBuffer', { fg = p.bg, bg = p.bg })
  hl('WinSeparator', { fg = p.bg, bg = p.bg })
  hl('CursorLine', { bg = p.faint })
  hl('Visual', { bg = p.selection })
  hl('Search', { fg = p.fg, bg = p.search })
  hl('IncSearch', { fg = p.fg, bg = p.inc_search })
  hl('SpellBad', { undercurl = true, sp = p.danger })
  hl('Conceal', { fg = p.muted })
  hl('NonText', { fg = p.nontext })
  hl('Whitespace', { fg = p.nontext })
  hl('MatchParen', { fg = p.fg, bg = p.selection, bold = true })
  hl('LineNr', { fg = p.muted, bg = p.bg })
  hl('SignColumn', { bg = p.bg })
  hl('FoldColumn', { fg = p.muted, bg = p.bg })
  hl('Folded', { fg = p.muted, bg = p.faint })
  hl('ColorColumn', { bg = p.faint })
  hl('StatusLine', { fg = p.secondary, bg = p.faint })
  hl('StatusLineNC', { fg = p.muted, bg = p.faint })
  hl('WinBar', { fg = p.secondary, bg = p.bg })
  hl('WinBarNC', { fg = p.muted, bg = p.bg })

  for name, color in pairs { Error = p.danger, Warn = p.warn, Info = p.note, Hint = p.accent } do
    hl('Diagnostic' .. name, { fg = color })
    hl('DiagnosticVirtualText' .. name, { fg = color, bg = p.bg })
    hl('DiagnosticUnderline' .. name, { undercurl = true, sp = color })
  end

  -- markdown text
  hl('@markup.strong', { fg = p.heading, bold = true })
  hl('@markup.italic', { fg = p.fg, italic = true })
  hl('@markup.strikethrough', { fg = p.muted, strikethrough = true })
  hl('@markup.link', { fg = p.accent })
  hl('@markup.link.label', { fg = p.accent })
  hl('@markup.link.url', { fg = p.muted, underline = true })
  hl('@markup.raw', { fg = p.fg, bg = p.code_bg })
  hl('@markup.quote', { fg = p.quote })
  hl('@markup.list', { fg = p.muted })
  for i = 1, 6 do
    hl('@markup.heading.' .. i .. '.markdown', { fg = p.h[i], bold = true })
    hl('RenderMarkdownH' .. i, { fg = p.h[i], bold = true })
    hl('RenderMarkdownH' .. i .. 'Bg', { bg = p.bg })
  end
  hl('@markup.heading.marker', { fg = p.nontext }) -- dimmed '#'/'##' before headings
  -- Rules under H1/H2 (render-markdown heading.border). render-markdown colours the
  -- rule with the *global* bg of the heading's background group, while the heading
  -- line itself resolves that group in this namespace. So: global = rule colour,
  -- namespace = page background (no band behind the heading text).
  for i, color in ipairs(p.rule) do
    vim.api.nvim_set_hl(0, 'NotesH' .. i .. 'Rule', { bg = color })
    hl('NotesH' .. i .. 'Rule', { bg = p.bg })
  end

  -- render-markdown elements
  hl('RenderMarkdownCode', { bg = p.code_bg })
  hl('RenderMarkdownCodeInline', { bg = p.code_bg })
  hl('RenderMarkdownBullet', { fg = p.muted })
  hl('RenderMarkdownDash', { fg = p.border })
  hl('RenderMarkdownQuote', { fg = p.quote_bar })
  hl('RenderMarkdownLink', { fg = p.accent })
  hl('RenderMarkdownUnchecked', { fg = p.muted })
  hl('RenderMarkdownChecked', { fg = p.accent })
  hl('RenderMarkdownTableHead', { fg = p.table_head })
  hl('RenderMarkdownTableRow', { fg = p.border })
  -- callout colours (left bar + title), Obsidian-like
  hl('RenderMarkdownInfo', { fg = p.note })
  hl('RenderMarkdownHint', { fg = p.accent })
  hl('RenderMarkdownSuccess', { fg = p.tip })
  hl('RenderMarkdownWarn', { fg = p.warn })
  hl('RenderMarkdownError', { fg = p.danger })

  -- code inside fenced blocks
  hl('Comment', { fg = p.muted, italic = true })
  hl('@comment', { fg = p.muted, italic = true })
  hl('@string', { fg = p.string })
  hl('@keyword', { fg = p.keyword })
  hl('@function', { fg = p.func })
  hl('@type', { fg = p.func })
  hl('@number', { fg = p.number })
  hl('@property', { fg = p.keyword })
  hl('@variable', { fg = p.fg })
  hl('@punctuation', { fg = p.punctuation })
end

local function is_markdown(win)
  local buf = vim.api.nvim_win_get_buf(win)
  return vim.api.nvim_win_get_config(win).relative == ''
    and vim.bo[buf].buftype == ''
    and vim.bo[buf].filetype == 'markdown'
end

-- Obsidian-like centred column (no-neck-pain side buffers). Automatic only when the
-- tab has a single editing window, so existing splits are never rearranged. If you
-- turn it off with :NoNeckPain while on a note, it stays off until you leave notes.
-- Set vim.g.notes_center = false to disable the automation entirely.
local auto_center = {} -- tabpage -> true (enabled by us) | 'off' (user turned it off)

local function nnp_active(tab)
  local s = _G.NoNeckPain and _G.NoNeckPain.state
  return type(s) == 'table' and type(s.tabs) == 'table' and s.tabs[tab] ~= nil
end

local function editing_windows(tab)
  local n = 0
  for _, w in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
    -- side buffers, file trees and other scratch windows are unlisted
    if vim.api.nvim_win_get_config(w).relative == '' and vim.bo[vim.api.nvim_win_get_buf(w)].buflisted then
      n = n + 1
    end
  end
  return n
end

local function update_centering(win)
  if vim.g.notes_center == false then
    return
  end
  for t in pairs(auto_center) do
    if not vim.api.nvim_tabpage_is_valid(t) then
      auto_center[t] = nil
    end
  end
  local tab = vim.api.nvim_get_current_tabpage()
  local md, active = is_markdown(win), nnp_active(tab)
  if auto_center[tab] == true and not active then
    auto_center[tab] = md and 'off' or nil -- turned off by hand
  elseif md then
    if not active and auto_center[tab] == nil and editing_windows(tab) == 1 then
      local ok, nnp = pcall(require, 'no-neck-pain')
      if ok and pcall(nnp.enable, 'notes') then
        auto_center[tab] = true
      end
    end
  elseif auto_center[tab] == 'off' then
    auto_center[tab] = nil
  elseif auto_center[tab] == true then
    auto_center[tab] = nil
    pcall(function()
      require('no-neck-pain').disable()
    end)
  end
end

-- Breathing room between numbered list items: a virtual blank line above every
-- item after the first in a tight list. Display only; the file is unchanged.
local spacing_ns = vim.api.nvim_create_namespace 'notes_list_spacing'
local spacing_pending = {}
local ordered_items

local function space_ordered_items(buf)
  spacing_pending[buf] = nil
  if not vim.api.nvim_buf_is_valid(buf) then
    return
  end
  vim.api.nvim_buf_clear_namespace(buf, spacing_ns, 0, -1)
  if vim.bo[buf].filetype ~= 'markdown' then
    return
  end
  local ok, parser = pcall(vim.treesitter.get_parser, buf, 'markdown')
  if not ok or not parser then
    return
  end
  ordered_items = ordered_items
    or vim.treesitter.query.parse('markdown', '(list_item [(list_marker_dot) (list_marker_parenthesis)]) @item')
  local tree = parser:parse()[1]
  for _, node in ordered_items:iter_captures(tree:root(), buf) do
    local row = node:start()
    local prev = node:prev_named_sibling()
    if row > 0 and prev and prev:type() == 'list_item' then
      local above = vim.api.nvim_buf_get_lines(buf, row - 1, row, false)[1]
      if above and above:match '%S' then -- loose lists already have a blank line
        vim.api.nvim_buf_set_extmark(buf, spacing_ns, row, 0, {
          virt_lines = { { { '', 'Normal' } } },
          virt_lines_above = true,
        })
      end
    end
  end
end

local function queue_spacing(args)
  if spacing_pending[args.buf] then
    return
  end
  spacing_pending[args.buf] = true
  vim.schedule(function()
    space_ordered_items(args.buf)
  end)
end

local function refresh()
  for win in pairs(previous_ns) do
    if not vim.api.nvim_win_is_valid(win) then
      previous_ns[win] = nil
    end
  end
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if is_markdown(win) then
      if previous_ns[win] == nil then
        previous_ns[win] = vim.api.nvim_get_hl_ns { winid = win }
      end
      vim.api.nvim_win_set_hl_ns(win, ns)
    elseif previous_ns[win] ~= nil then
      -- Do not overwrite a namespace installed by another plugin in the meantime.
      if vim.api.nvim_get_hl_ns { winid = win } == ns then
        vim.api.nvim_win_set_hl_ns(win, previous_ns[win])
      end
      previous_ns[win] = nil
    end
  end

  -- Floats (pickers, popups) and special buffers (help, quickfix, nvim-tree,
  -- terminals) leave the centering as it is.
  local win = vim.api.nvim_get_current_win()
  if vim.api.nvim_win_get_config(win).relative == '' and vim.bo[vim.api.nvim_win_get_buf(win)].buftype == '' then
    update_centering(win)
  end
end

local function queue_refresh()
  if queued then
    return
  end
  queued = true
  vim.schedule(function()
    queued = false
    refresh()
  end)
end

function M.setup()
  if initialized then
    return
  end
  initialized = true
  define_highlights()
  local group = vim.api.nvim_create_augroup('notes_mode', { clear = true })

  vim.api.nvim_create_autocmd({
    'VimEnter', 'FileType', 'BufWinEnter', 'BufEnter', 'WinEnter',
    'TabEnter', 'WinClosed', 'SessionLoadPost',
  }, { group = group, callback = queue_refresh })

  vim.api.nvim_create_autocmd({ 'FileType', 'BufWinEnter', 'TextChanged', 'TextChangedI' }, {
    group = group,
    callback = queue_spacing,
  })

  vim.api.nvim_create_autocmd('ColorScheme', {
    group = group,
    callback = function()
      define_highlights()
      queue_refresh()
    end,
  })
  queue_refresh()
end

return M
