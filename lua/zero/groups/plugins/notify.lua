local M = {}

function M.get(t, _opts)
  return {
    NotifyBackground = { bg = t.bg_float },
    NotifyERRORBorder = { fg = t.red },
    NotifyERRORIcon = { fg = t.red },
    NotifyERRORTitle = { fg = t.red, bold = true },
    NotifyERRORBody = { fg = t.fg, bg = t.bg_float },
    NotifyWARNBorder = { fg = t.warn },
    NotifyWARNIcon = { fg = t.warn },
    NotifyWARNTitle = { fg = t.warn, bold = true },
    NotifyWARNBody = { fg = t.fg, bg = t.bg_float },
    NotifyINFOBorder = { fg = t.info },
    NotifyINFOIcon = { fg = t.info },
    NotifyINFOTitle = { fg = t.info, bold = true },
    NotifyINFOBody = { fg = t.fg, bg = t.bg_float },
    NotifyDEBUGBorder = { fg = t.comment },
    NotifyDEBUGIcon = { fg = t.comment },
    NotifyDEBUGTitle = { fg = t.comment, bold = true },
    NotifyDEBUGBody = { fg = t.fg, bg = t.bg_float },
    NotifyTRACEBorder = { fg = t.violet },
    NotifyTRACEIcon = { fg = t.violet },
    NotifyTRACETitle = { fg = t.violet, bold = true },
    NotifyTRACEBody = { fg = t.fg, bg = t.bg_float },
    NotifyLogTime = { fg = t.comment },
    NotifyLogTitle = { fg = t.green },
  }
end

return M
