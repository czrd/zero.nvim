local M = {}

function M.get(t, opts)
  local bg_sidebar = t.bg_sidebar
  return {
    NeoTreeNormal = { fg = t.fg, bg = bg_sidebar },
    NeoTreeNormalNC = { fg = t.fg_dim, bg = bg_sidebar },
    NeoTreeFloatNormal = { fg = t.fg, bg = t.bg_float },
    NeoTreeFloatBorder = { fg = t.border, bg = t.bg_float },
    NeoTreeRootName = { fg = t.green, bold = true },
    NeoTreeDirectoryName = { fg = t.blue },
    NeoTreeDirectoryIcon = { fg = t.blue },
    NeoTreeFileName = { fg = t.fg },
    NeoTreeFileIcon = { fg = t.fg_dim },
    NeoTreeFileNameOpened = { fg = t.green },
    NeoTreeSymbolicLinkTarget = { fg = t.teal },
    NeoTreeGitAdded = { fg = t.git_add },
    NeoTreeGitConflict = { fg = t.orange },
    NeoTreeGitDeleted = { fg = t.git_delete },
    NeoTreeGitIgnored = { fg = t.comment },
    NeoTreeGitModified = { fg = t.git_change },
    NeoTreeGitRenamed = { fg = t.git_change },
    NeoTreeGitStaged = { fg = t.git_add },
    NeoTreeGitUnstaged = { fg = t.warn },
    NeoTreeGitUntracked = { fg = t.fg_gutter },
    NeoTreeIndentMarker = { fg = t.border },
    NeoTreeExpander = { fg = t.fg_gutter },
    NeoTreeCursorLine = { bg = t.bg_selection },
    NeoTreeWinSeparator = { fg = t.border, bg = bg_sidebar },
    NeoTreeStatusLine = { link = "StatusLine" },
    NeoTreeStatusLineNC = { link = "StatusLineNC" },
    NeoTreeTabActive = { fg = t.fg, bg = t.bg, bold = true },
    NeoTreeTabInactive = { fg = t.fg_dim, bg = bg_sidebar },
    NeoTreeTabSeparatorActive = { fg = t.green },
    NeoTreeTabSeparatorInactive = { fg = t.border },
    NeoTreeTitleBar = { fg = t.bg, bg = t.green, bold = true },
    NeoTreeFilterTerm = { fg = t.gold, bold = true },
    NeoTreeDimText = { fg = t.comment },
    NeoTreeDotfile = { fg = t.comment },
    NeoTreeHiddenByName = { fg = t.comment },
    NeoTreeModified = { fg = t.warn },
    NeoTreeMessage = { fg = t.comment, italic = true },
  }
end

return M
