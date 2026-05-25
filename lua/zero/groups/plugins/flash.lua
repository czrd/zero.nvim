local M = {}

function M.get(t, _opts)
  return {
    FlashBackdrop = { fg = t.comment },
    FlashMatch = { fg = t.fg, bg = t.bg_selection },
    FlashCurrent = { fg = t.bg, bg = t.orange, bold = true },
    FlashLabel = { fg = t.bg, bg = t.green, bold = true },
    FlashPrompt = { fg = t.fg, bg = t.bg },
    FlashPromptIcon = { fg = t.green },
    FlashCursor = { fg = t.bg, bg = t.fg },
  }
end

return M
