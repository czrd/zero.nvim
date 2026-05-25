local M = {}

function M.get(t, _opts)
  return {
    -- ibl v3
    IblIndent = { fg = t.border },
    IblScope = { fg = t.green },
    IblWhitespace = { fg = t.border },

    -- ibl v2 / indent-blankline.nvim legacy
    IndentBlanklineChar = { fg = t.border },
    IndentBlanklineContextChar = { fg = t.green },
    IndentBlanklineSpaceChar = { fg = t.border },
    IndentBlanklineSpaceCharBlankline = { fg = t.border },
    IndentBlanklineContextStart = { underline = true, sp = t.green },
    IndentBlanklineIndent1 = { fg = t.border },
    IndentBlanklineIndent2 = { fg = t.border },
    IndentBlanklineIndent3 = { fg = t.border },
    IndentBlanklineIndent4 = { fg = t.border },
    IndentBlanklineIndent5 = { fg = t.border },
    IndentBlanklineIndent6 = { fg = t.border },
  }
end

return M
