local M = {}

function M.get(t, _opts)
  return {
    MasonNormal = { fg = t.fg, bg = t.bg_float },
    MasonHeader = { fg = t.bg, bg = t.green, bold = true },
    MasonHeaderSecondary = { fg = t.bg, bg = t.blue, bold = true },
    MasonHighlight = { fg = t.green },
    MasonHighlightBlock = { fg = t.bg, bg = t.green },
    MasonHighlightBlockBold = { fg = t.bg, bg = t.green, bold = true },
    MasonHighlightSecondary = { fg = t.blue },
    MasonHighlightBlockSecondary = { fg = t.bg, bg = t.blue },
    MasonHighlightBlockBoldSecondary = { fg = t.bg, bg = t.blue, bold = true },
    MasonLink = { fg = t.teal, underline = true },
    MasonMuted = { fg = t.comment },
    MasonMutedBlock = { fg = t.fg_gutter, bg = t.bg_selection },
    MasonMutedBlockBold = { fg = t.fg_gutter, bg = t.bg_selection, bold = true },
    MasonError = { fg = t.error },
    MasonWarning = { fg = t.warn },
    MasonHeading = { fg = t.green, bold = true },
  }
end

return M
