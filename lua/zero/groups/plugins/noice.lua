local M = {}

function M.get(t, _opts)
  return {
    NoiceCmdline = { fg = t.fg, bg = t.bg },
    NoiceCmdlineIcon = { fg = t.green },
    NoiceCmdlineIconSearch = { fg = t.gold },
    NoiceCmdlinePopup = { fg = t.fg, bg = t.bg },
    NoiceCmdlinePopupBorder = { fg = t.comment, bg = t.bg },
    NoiceCmdlinePopupBorderSearch = { fg = t.gold, bg = t.bg },
    NoiceCmdlinePopupTitle = { fg = t.green, bg = t.bg, bold = true },
    NoicePopup = { fg = t.fg, bg = t.bg },
    NoicePopupBorder = { link = "FloatBorder" },
    NoiceSplit = { fg = t.fg, bg = t.bg },
    NoiceSplitBorder = { link = "FloatBorder" },
    NoiceScrollbar = { bg = t.bg_dark },
    NoiceScrollbarThumb = { bg = t.fg_gutter },
    NoiceConfirm = { fg = t.fg, bg = t.bg },
    NoiceConfirmBorder = { link = "FloatBorder" },
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
