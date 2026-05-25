local M = {}

function M.get(t, _opts)
  return {
    GitSignsAdd = { fg = t.git_add },
    GitSignsChange = { fg = t.git_change },
    GitSignsDelete = { fg = t.git_delete },
    GitSignsAddNr = { fg = t.git_add },
    GitSignsChangeNr = { fg = t.git_change },
    GitSignsDeleteNr = { fg = t.git_delete },
    GitSignsAddLn = { bg = t.diff_add },
    GitSignsChangeLn = { bg = t.diff_change },
    GitSignsDeleteLn = { bg = t.diff_delete },
    GitSignsTopdelete = { fg = t.git_delete },
    GitSignsChangedelete = { fg = t.git_change },
    GitSignsUntracked = { fg = t.fg_gutter },
    GitSignsUntrackedNr = { fg = t.fg_gutter },
    GitSignsCurrentLineBlame = { fg = t.comment, italic = true },
    GitSignsAddPreview = { bg = t.diff_add },
    GitSignsDeletePreview = { bg = t.diff_delete },
    GitSignsAddInline = { bg = t.diff_text },
    GitSignsChangeInline = { bg = t.diff_text },
    GitSignsDeleteInline = { bg = t.diff_delete },
  }
end

return M
