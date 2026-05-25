local M = {}

function M.get(t, _opts)
  return {
    -- which-key v2
    WhichKey = { fg = t.green },
    WhichKeyGroup = { fg = t.blue },
    WhichKeySeparator = { fg = t.fg_gutter },
    WhichKeyDesc = { fg = t.fg },
    WhichKeyFloat = { bg = t.bg },
    WhichKeyBorder = { fg = t.border, bg = t.bg },
    WhichKeyValue = { fg = t.comment },

    -- which-key v3
    WhichKeyNormal = { fg = t.fg, bg = t.bg },
    WhichKeyTitle = { fg = t.bg, bg = t.green, bold = true },
    WhichKeyIcon = { fg = t.blue },
    WhichKeyIconBlue = { fg = t.blue },
    WhichKeyIconGreen = { fg = t.green },
    WhichKeyIconPurple = { fg = t.violet },
    WhichKeyIconRed = { fg = t.red },
    WhichKeyIconYellow = { fg = t.gold },
    WhichKeyIconCyan = { fg = t.teal },
    WhichKeyIconOrange = { fg = t.orange },
    WhichKeyIconGrey = { fg = t.comment },
  }
end

return M
