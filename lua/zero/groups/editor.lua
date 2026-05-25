local M = {}

function M.get(t, opts)
  local bg = t.bg
  local bg_nc = t.bg_nc
  local bg_status = t.bg_status
  local bg_sidebar = t.bg_sidebar

  return {
    Normal = { fg = t.fg, bg = t.bg },
    NormalNC = { fg = t.fg_dim, bg = bg_nc },
    NormalFloat = { link = "Normal" },
    FloatBorder = { fg = t.fg_dim, bg = t.bg },
    FloatTitle = { fg = t.green, bg = t.bg, bold = true },
    FloatFooter = { fg = t.fg_dim, bg = t.bg },

    Cursor = { fg = bg, bg = t.fg },
    lCursor = { fg = bg, bg = t.fg },
    CursorIM = { fg = bg, bg = t.fg },
    TermCursor = { fg = bg, bg = t.green },
    TermCursorNC = { fg = bg, bg = t.fg_gutter },
    CursorLine = { bg = t.bg_cursorline },
    CursorColumn = { bg = t.bg_cursorline },
    ColorColumn = { bg = t.bg_cursorline },

    LineNr = { fg = t.fg_gutter },
    LineNrAbove = { fg = t.fg_gutter },
    LineNrBelow = { fg = t.fg_gutter },
    CursorLineNr = { fg = t.green, bold = true },
    SignColumn = { fg = t.fg_gutter, bg = bg },
    FoldColumn = { fg = t.fg_gutter, bg = bg },
    CursorLineFold = { fg = t.green, bg = t.bg_cursorline },
    CursorLineSign = { bg = t.bg_cursorline },

    Conceal = { fg = t.comment },
    Directory = { fg = t.blue },
    EndOfBuffer = { fg = opts.transparent and t.none or bg },
    NonText = { fg = t.fg_gutter },
    Whitespace = { fg = t.border },
    SpecialKey = { fg = t.fg_gutter },

    Visual = { bg = t.bg_visual },
    VisualNOS = { bg = t.bg_visual },
    Search = { fg = t.fg, bg = t.gold },
    IncSearch = { fg = bg, bg = t.orange, bold = true },
    CurSearch = { link = "IncSearch" },
    Substitute = { fg = bg, bg = t.green, bold = true },
    MatchParen = { fg = t.teal, bold = true, underline = true },

    Pmenu = { fg = t.fg_dim, bg = t.bg },
    PmenuSel = { fg = t.fg, bg = t.bg_selection, bold = true },
    PmenuKind = { fg = t.blue, bg = t.bg },
    PmenuKindSel = { fg = t.blue, bg = t.bg_selection, bold = true },
    PmenuExtra = { fg = t.comment, bg = t.bg },
    PmenuExtraSel = { fg = t.fg_dim, bg = t.bg_selection },
    PmenuMatch = { fg = t.green, bg = t.bg, bold = true },
    PmenuMatchSel = { fg = t.green, bg = t.bg_selection, bold = true },
    PmenuSbar = { bg = t.bg_dark },
    PmenuThumb = { bg = t.fg_gutter },
    WildMenu = { fg = t.fg, bg = t.bg_selection, bold = true },

    StatusLine = { fg = t.fg, bg = bg_status },
    StatusLineNC = { fg = t.fg_dim, bg = bg_status },
    TabLine = { fg = t.fg_dim, bg = bg_status },
    TabLineFill = { bg = bg_status },
    TabLineSel = { fg = t.green, bg = bg, bold = true },
    WinSeparator = { fg = t.border },
    VertSplit = { link = "WinSeparator" },
    WinBar = { fg = t.fg, bg = bg },
    WinBarNC = { fg = t.fg_dim, bg = bg_nc },

    Folded = { fg = t.comment, bg = t.bg_float },
    FoldedSign = { fg = t.fg_gutter },
    QuickFixLine = { fg = t.fg, bg = t.bg_selection },
    Question = { fg = t.green },
    MoreMsg = { fg = t.green },
    ModeMsg = { fg = t.fg, bold = true },
    MsgArea = { fg = t.fg_dim },
    MsgSeparator = { link = "WinSeparator" },
    ErrorMsg = { fg = t.red, bold = true },
    WarningMsg = { fg = t.warn, bold = true },
    Title = { fg = t.green, bold = true },

    DiffAdd = { bg = t.diff_add },
    DiffChange = { bg = t.diff_change },
    DiffDelete = { bg = t.diff_delete },
    DiffText = { bg = t.diff_text },
    diffAdded = { fg = t.git_add },
    diffRemoved = { fg = t.git_delete },
    diffChanged = { fg = t.git_change },
    diffFile = { fg = t.blue },
    diffNewFile = { fg = t.green },
    diffOldFile = { fg = t.red },
    diffLine = { fg = t.comment },
    diffIndexLine = { fg = t.teal },

    SpellBad = { undercurl = true, sp = t.red },
    SpellCap = { undercurl = true, sp = t.warn },
    SpellLocal = { undercurl = true, sp = t.info },
    SpellRare = { undercurl = true, sp = t.teal },

    NormalSB = { fg = t.fg, bg = bg_sidebar },
    SignColumnSB = { fg = t.fg_gutter, bg = bg_sidebar },

    debugPC = { bg = t.diff_text },
    debugBreakpoint = { fg = t.red },

    healthError = { fg = t.error },
    healthSuccess = { fg = t.ok },
    healthWarning = { fg = t.warn },
  }
end

return M
