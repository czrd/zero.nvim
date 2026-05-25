local M = {}

function M.get(t, opts)
  return {
    NvimTreeNormal = { fg = t.fg, bg = t.bg },
    NvimTreeNormalNC = { fg = t.fg_dim, bg = t.bg },
    NvimTreeNormalFloat = { fg = t.fg, bg = t.bg_float },
    NvimTreeRootFolder = { fg = t.green, bold = true },
    NvimTreeFolderName = { fg = t.blue },
    NvimTreeOpenedFolderName = { fg = t.blue, bold = true },
    NvimTreeEmptyFolderName = { fg = t.fg_dim },
    NvimTreeFolderIcon = { fg = t.blue },
    NvimTreeFileIcon = { fg = t.fg_dim },
    NvimTreeFileName = { fg = t.fg },
    NvimTreeOpenedFile = { fg = t.green },
    NvimTreeModifiedFile = { fg = t.warn },
    NvimTreeGitDirty = { fg = t.warn },
    NvimTreeGitNew = { fg = t.git_add },
    NvimTreeGitDeleted = { fg = t.git_delete },
    NvimTreeGitStaged = { fg = t.git_add },
    NvimTreeGitMerge = { fg = t.orange },
    NvimTreeGitRenamed = { fg = t.git_change },
    NvimTreeGitIgnored = { fg = t.comment },
    NvimTreeExecFile = { fg = t.green, bold = true },
    NvimTreeSymlink = { fg = t.teal },
    NvimTreeWinSeparator = { fg = t.border, bg = t.bg },
    NvimTreeCursorLine = { bg = t.bg_selection },
    NvimTreeCursorColumn = { bg = t.bg_selection },
    NvimTreeIndentMarker = { fg = t.border },
    NvimTreeLiveFilterPrefix = { fg = t.green },
    NvimTreeLiveFilterValue = { fg = t.fg },
    NvimTreeBookmark = { fg = t.gold },
    NvimTreeStatusLine = { link = "StatusLine" },
    NvimTreeStatusLineNC = { link = "StatusLineNC" },
  }
end

return M
