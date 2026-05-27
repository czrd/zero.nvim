local M = {}

function M.get(t, opts)
  local bg_sidebar = t.bg_sidebar
  return {
    -- mini.statusline
    MiniStatuslineModeNormal = { fg = t.bg, bg = t.green, bold = true },
    MiniStatuslineModeInsert = { fg = t.bg, bg = t.blue, bold = true },
    MiniStatuslineModeVisual = { fg = t.bg, bg = t.violet, bold = true },
    MiniStatuslineModeReplace = { fg = t.bg, bg = t.red, bold = true },
    MiniStatuslineModeCommand = { fg = t.bg, bg = t.gold, bold = true },
    MiniStatuslineModeOther = { fg = t.bg, bg = t.teal, bold = true },
    MiniStatuslineDevinfo = { fg = t.fg, bg = t.bg_statusline },
    MiniStatuslineFilename = { fg = t.fg_dim, bg = t.bg_statusline },
    MiniStatuslineFileinfo = { fg = t.fg, bg = t.bg_statusline },
    MiniStatuslineInactive = { fg = t.fg_gutter, bg = t.bg_statusline },

    -- mini.tabline
    MiniTablineCurrent = { fg = t.green, bg = t.bg, bold = true },
    MiniTablineVisible = { fg = t.fg, bg = t.bg_statusline },
    MiniTablineHidden = { fg = t.fg_dim, bg = t.bg_dark },
    MiniTablineModifiedCurrent = { fg = t.gold, bg = t.bg, bold = true },
    MiniTablineModifiedVisible = { fg = t.gold, bg = t.bg_statusline },
    MiniTablineModifiedHidden = { fg = t.gold, bg = t.bg_dark },
    MiniTablineFill = { bg = t.bg_dark },
    MiniTablineTabpagesection = { fg = t.bg, bg = t.green, bold = true },

    -- mini.files
    MiniFilesNormal = { fg = t.fg, bg = t.bg },
    MiniFilesTitle = { fg = t.green, bg = t.bg, bold = true },
    MiniFilesTitleFocused = { fg = t.bg, bg = t.green, bold = true },
    MiniFilesBorder = { link = "FloatBorder" },
    MiniFilesBorderModified = { fg = t.warn, bg = t.bg },
    MiniFilesCursorLine = { bg = t.bg_selection },
    MiniFilesDirectory = { fg = t.blue },
    MiniFilesFile = { fg = t.fg },
    MiniFilesDirectoryIconOpened = { fg = t.blue },
    MiniFilesDirectoryIconClosed = { fg = t.blue },

    -- mini.diff
    MiniDiffSignAdd = { fg = t.git_add },
    MiniDiffSignChange = { fg = t.git_change },
    MiniDiffSignDelete = { fg = t.git_delete },
    MiniDiffOverAdd = { bg = t.diff_add },
    MiniDiffOverChange = { bg = t.diff_change },
    MiniDiffOverContext = { bg = t.diff_change },
    MiniDiffOverDelete = { bg = t.diff_delete },

    -- mini.indentscope
    MiniIndentscopeSymbol = { fg = t.green },
    MiniIndentscopeSymbolOff = { fg = t.border },
    MiniIndentscopePrefix = { link = "MiniIndentscopeSymbol" },

    -- mini.icons
    MiniIconsAzure = { fg = t.blue },
    MiniIconsBlue = { fg = t.blue },
    MiniIconsCyan = { fg = t.teal },
    MiniIconsGreen = { fg = t.green },
    MiniIconsGrey = { fg = t.comment },
    MiniIconsOrange = { fg = t.orange },
    MiniIconsPurple = { fg = t.violet },
    MiniIconsRed = { fg = t.red },
    MiniIconsYellow = { fg = t.gold },

    -- mini.notify
    MiniNotifyBorder = { link = "FloatBorder" },
    MiniNotifyNormal = { fg = t.fg, bg = t.bg },
    MiniNotifyTitle = { fg = t.green, bg = t.bg, bold = true },

    -- mini.pick
    MiniPickBorder = { link = "FloatBorder" },
    MiniPickBorderBusy = { fg = t.warn },
    MiniPickBorderText = { fg = t.green },
    MiniPickHeader = { fg = t.green, bold = true },
    MiniPickIconCopy = { fg = t.teal },
    MiniPickIconDirectory = { fg = t.blue },
    MiniPickIconFile = { fg = t.fg_dim },
    MiniPickIconNone = { fg = t.comment },
    MiniPickMatchCurrent = { bg = t.bg_selection },
    MiniPickMatchMarked = { fg = t.teal },
    MiniPickMatchRanges = { fg = t.green, bold = true },
    MiniPickNormal = { fg = t.fg, bg = t.bg },
    MiniPickPreviewLine = { bg = t.bg_selection },
    MiniPickPreviewRegion = { bg = t.bg_visual },
    MiniPickPrompt = { fg = t.green },

    -- mini.clue
    MiniClueDescGroup = { fg = t.blue },
    MiniClueDescSingle = { fg = t.fg },
    MiniClueNextKey = { fg = t.gold, bold = true },
    MiniClueNextKeyWithPostkeys = { fg = t.orange, bold = true },
    MiniClueSeparator = { fg = t.fg_gutter },
    MiniClueTitle = { fg = t.bg, bg = t.green, bold = true },

    -- mini.completion
    MiniCompletionActiveParameter = { underline = true, sp = t.green },

    -- mini.cursorword
    MiniCursorword = { underline = true },
    MiniCursorwordCurrent = { underline = true },

    -- mini.jump
    MiniJump = { fg = t.bg, bg = t.green },
    MiniJump2dSpot = { fg = t.bg, bg = t.green, bold = true },
    MiniJump2dSpotAhead = { fg = t.bg, bg = t.gold, bold = true },
    MiniJump2dSpotUnique = { fg = t.bg, bg = t.green, bold = true },
    MiniJump2dDim = { fg = t.comment },

    -- mini.surround
    MiniSurround = { fg = t.bg, bg = t.orange },

    -- mini.trailspace
    MiniTrailspace = { bg = t.red },

    -- mini.map
    MiniMapNormal = { fg = t.fg_dim, bg = t.bg_dark },
    MiniMapSymbolCount = { fg = t.orange },
    MiniMapSymbolLine = { fg = t.green },
    MiniMapSymbolView = { fg = t.teal },

    -- mini.animate
    MiniAnimateCursor = { link = "Cursor" },
  }
end

return M
