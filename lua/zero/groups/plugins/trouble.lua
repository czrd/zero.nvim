local M = {}

function M.get(t, _opts)
  return {
    -- trouble.nvim v2 + v3
    TroubleNormal = { fg = t.fg, bg = t.bg_sidebar },
    TroubleNormalNC = { fg = t.fg_dim, bg = t.bg_sidebar },
    TroubleText = { fg = t.fg },
    TroubleCount = { fg = t.orange, bold = true },
    TroubleIndent = { fg = t.border },
    TroubleLocation = { fg = t.comment },
    TroubleFile = { fg = t.blue },
    TroubleCode = { fg = t.comment },
    TroubleSource = { fg = t.comment },
    TroublePos = { fg = t.comment },
    TroublePreview = { bg = t.bg_selection },
    TroubleFoldIcon = { fg = t.fg_gutter },
    TroubleIconError = { fg = t.error },
    TroubleIconWarn = { fg = t.warn },
    TroubleIconInfo = { fg = t.info },
    TroubleIconHint = { fg = t.hint },
    TroubleIconOther = { fg = t.fg_gutter },
    TroubleSignError = { fg = t.error },
    TroubleSignWarn = { fg = t.warn },
    TroubleSignInfo = { fg = t.info },
    TroubleSignHint = { fg = t.hint },
    -- v3 specific
    TroubleDirectory = { fg = t.blue },
    TroubleFileName = { fg = t.fg },
    TroubleBasename = { fg = t.fg, bold = true },
    TroubleIconDirectory = { fg = t.blue },
    TroubleIconFile = { fg = t.fg_dim },
  }
end

return M
