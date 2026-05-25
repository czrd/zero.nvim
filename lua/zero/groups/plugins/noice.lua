local M = {}

function M.get(t, _opts)
  return {
    NoiceCmdline = { fg = t.fg_dim, bg = t.bg },
    NoiceCmdlineIcon = { fg = t.green },
    NoiceCmdlineIconSearch = { fg = t.gold },
    NoiceCmdlinePopup = { fg = t.fg, bg = t.bg_float },
    NoiceCmdlinePopupBorder = { fg = t.border, bg = t.bg_float },
    NoiceCmdlinePopupBorderSearch = { fg = t.gold, bg = t.bg_float },
    NoiceCmdlinePopupTitle = { fg = t.green, bg = t.bg_float },
    NoicePopup = { fg = t.fg, bg = t.bg_float },
    NoicePopupBorder = { fg = t.border, bg = t.bg_float },
    NoiceSplit = { fg = t.fg, bg = t.bg },
    NoiceSplitBorder = { fg = t.border, bg = t.bg },
    NoiceScrollbar = { bg = t.bg_dark },
    NoiceScrollbarThumb = { bg = t.fg_gutter },
    NoiceConfirm = { fg = t.fg, bg = t.bg_float },
    NoiceConfirmBorder = { fg = t.border, bg = t.bg_float },
    NoiceFormatDate = { fg = t.comment },
    NoiceFormatEvent = { fg = t.comment },
    NoiceFormatKind = { fg = t.comment },
    NoiceFormatLevelDebug = { fg = t.comment },
    NoiceFormatLevelError = { fg = t.red },
    NoiceFormatLevelInfo = { fg = t.info },
    NoiceFormatLevelOff = { fg = t.comment },
    NoiceFormatLevelTrace = { fg = t.violet },
    NoiceFormatLevelWarn = { fg = t.warn },
    NoiceFormatProgressDone = { fg = t.green, bold = true },
    NoiceFormatProgressTodo = { fg = t.comment },
    NoiceFormatTitle = { fg = t.green, bold = true },
    NoiceLspProgressClient = { fg = t.green },
    NoiceLspProgressSpinner = { fg = t.green },
    NoiceLspProgressTitle = { fg = t.fg },
    NoiceMini = { fg = t.fg, bg = t.bg_statusline },
    NoiceVirtualText = { fg = t.comment },
  }
end

return M
