local M = {}

function M.get(t, _opts)
  return {
    -- Core diagnostics
    DiagnosticError = { fg = t.error },
    DiagnosticWarn = { fg = t.warn },
    DiagnosticInfo = { fg = t.info },
    DiagnosticHint = { fg = t.hint },
    DiagnosticOk = { fg = t.ok },

    -- Virtual text (no background, flat)
    DiagnosticVirtualTextError = { fg = t.error },
    DiagnosticVirtualTextWarn = { fg = t.warn },
    DiagnosticVirtualTextInfo = { fg = t.info },
    DiagnosticVirtualTextHint = { fg = t.hint },
    DiagnosticVirtualTextOk = { fg = t.ok },

    -- Underline (undercurl)
    DiagnosticUnderlineError = { undercurl = true, sp = t.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = t.warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = t.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = t.hint },
    DiagnosticUnderlineOk = { undercurl = true, sp = t.ok },

    -- Signs
    DiagnosticSignError = { fg = t.error },
    DiagnosticSignWarn = { fg = t.warn },
    DiagnosticSignInfo = { fg = t.info },
    DiagnosticSignHint = { fg = t.hint },
    DiagnosticSignOk = { fg = t.ok },

    -- Floating
    DiagnosticFloatingError = { fg = t.error },
    DiagnosticFloatingWarn = { fg = t.warn },
    DiagnosticFloatingInfo = { fg = t.info },
    DiagnosticFloatingHint = { fg = t.hint },
    DiagnosticFloatingOk = { fg = t.ok },

    -- Special cases
    DiagnosticUnnecessary = { fg = t.comment },
    DiagnosticDeprecated = { fg = t.comment, strikethrough = true },

    -- LSP references
    LspReferenceText = { bg = t.bg_selection },
    LspReferenceRead = { bg = t.bg_selection },
    LspReferenceWrite = { bg = t.bg_selection, bold = true },

    -- Inlay hints
    LspInlayHint = { fg = t.comment, bg = t.bg_float },

    -- Signature help
    LspSignatureActiveParameter = { fg = t.green, underline = true },

    -- Code lens
    LspCodeLens = { fg = t.comment },
    LspCodeLensSeparator = { fg = t.fg_gutter },
  }
end

return M
