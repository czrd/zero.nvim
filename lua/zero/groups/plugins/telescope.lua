local M = {}

function M.get(t, _opts)
  return {
    TelescopeNormal = { fg = t.fg, bg = t.bg },
    TelescopeBorder = { link = "FloatBorder" },
    TelescopePromptNormal = { fg = t.fg, bg = t.bg },
    TelescopePromptBorder = { link = "FloatBorder" },
    TelescopePromptPrefix = { fg = t.green, bg = t.bg },
    TelescopePromptCounter = { fg = t.comment, bg = t.bg },
    TelescopePromptTitle = { fg = t.bg, bg = t.green, bold = true },
    TelescopePreviewTitle = { fg = t.bg, bg = t.green, bold = true },
    TelescopeResultsTitle = { fg = t.bg, bg = t.green, bold = true },
    TelescopePreviewNormal = { fg = t.fg, bg = t.bg },
    TelescopePreviewBorder = { link = "FloatBorder" },
    TelescopeResultsNormal = { fg = t.fg, bg = t.bg },
    TelescopeResultsBorder = { link = "FloatBorder" },
    TelescopeMatching = { fg = t.green, bold = true },
    TelescopeSelection = { fg = t.fg, bg = t.bg_selection },
    TelescopeSelectionCaret = { fg = t.green, bg = t.bg_selection },
    TelescopeMultiSelection = { fg = t.teal, bg = t.bg_selection },
    TelescopeMultiIcon = { fg = t.teal },
    TelescopeResultsClass = { fg = t.violet },
    TelescopeResultsConstant = { fg = t.orange },
    TelescopeResultsField = { fg = t.fg },
    TelescopeResultsFunction = { fg = t.blue },
    TelescopeResultsMethod = { fg = t.blue },
    TelescopeResultsOperator = { fg = t.teal },
    TelescopeResultsStruct = { fg = t.violet },
    TelescopeResultsVariable = { fg = t.fg },
    TelescopeResultsLineNr = { fg = t.fg_gutter },
    TelescopeResultsDiffAdd = { fg = t.git_add },
    TelescopeResultsDiffChange = { fg = t.git_change },
    TelescopeResultsDiffDelete = { fg = t.git_delete },
    TelescopeResultsDiffUntracked = { fg = t.fg_dim },
  }
end

return M
