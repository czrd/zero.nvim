local M = {}

function M.get(t, _opts)
  return {
    NotifyBackground = { bg = t.bg },
    NotifyERRORBorder = { fg = t.red, bg = t.bg },
    NotifyERRORIcon = { fg = t.red, bg = t.bg },
    NotifyERRORTitle = { fg = t.red, bg = t.bg },
    NotifyERRORBody = { fg = t.fg, bg = t.bg},
    NotifyWARNBorder = { fg = t.warn, bg = t.bg },
    NotifyWARNIcon = { fg = t.warn, bg = t.bg },
    NotifyWARNTitle = { fg = t.warn, bg = t.bg },
    NotifyWARNBody = { fg = t.fg, bg = t.bg},
    NotifyINFOBorder = { fg = t.green, bg = t.bg },
    NotifyINFOIcon = { fg = t.green, bg = t.bg },
    NotifyINFOTitle = { fg = t.green, bg = t.bg },
    NotifyINFOBody = { fg = t.fg, bg = t.bg},
    NotifyDEBUGBorder = { fg = t.comment },
    NotifyDEBUGIcon = { fg = t.comment },
    NotifyDEBUGTitle = { fg = t.comment, bold = true },
    NotifyDEBUGBody = { fg = t.fg, bg = t.bg},
    NotifyTRACEBorder = { fg = t.violet },
    NotifyTRACEIcon = { fg = t.violet },
    NotifyTRACETitle = { fg = t.violet, bold = true },
    NotifyTRACEBody = { fg = t.fg, bg = t.bg},
    NotifyLogTime = { fg = t.comment },
    NotifyLogTitle = { fg = t.green },
  }
end

return M
