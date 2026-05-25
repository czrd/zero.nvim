local M = {}

function M.get(t, _opts)
  return {
    -- nvim-dap
    DapBreakpoint = { fg = t.red },
    DapBreakpointCondition = { fg = t.orange },
    DapBreakpointRejected = { fg = t.comment },
    DapLogPoint = { fg = t.blue },
    DapStopped = { fg = t.gold },
    DapStoppedLine = { bg = t.diff_text },

    -- nvim-dap-ui
    DapUIScope = { fg = t.green },
    DapUIType = { fg = t.violet },
    DapUIValue = { fg = t.orange },
    DapUIModifiedValue = { fg = t.gold, bold = true },
    DapUIDecoration = { fg = t.border },
    DapUIThread = { fg = t.green },
    DapUIStoppedThread = { fg = t.gold, bold = true },
    DapUIFrameName = { fg = t.fg },
    DapUISource = { fg = t.blue },
    DapUILineNumber = { fg = t.fg_gutter },
    DapUIFloatBorder = { fg = t.border, bg = t.bg_float },
    DapUIWatchesEmpty = { fg = t.comment },
    DapUIWatchesValue = { fg = t.green },
    DapUIWatchesError = { fg = t.red },
    DapUIBreakpointsPath = { fg = t.blue },
    DapUIBreakpointsInfo = { fg = t.info },
    DapUIBreakpointsCurrentLine = { fg = t.green, bold = true },
    DapUIBreakpointsLine = { link = "DapUILineNumber" },
    DapUIBreakpointsDisabledLine = { fg = t.comment },
    DapUICurrentFrameName = { link = "DapUIBreakpointsCurrentLine" },
    DapUIStepOver = { fg = t.blue },
    DapUIStepInto = { fg = t.blue },
    DapUIStepBack = { fg = t.blue },
    DapUIStepOut = { fg = t.blue },
    DapUIStop = { fg = t.red },
    DapUIPlayPause = { fg = t.green },
    DapUIRestart = { fg = t.green },
    DapUIUnavailable = { fg = t.comment },
    DapUIWinSelect = { fg = t.green, bold = true },
    DapUIEndofBuffer = { link = "EndOfBuffer" },
    DapUINormalFloat = { fg = t.fg, bg = t.bg_float },
  }
end

return M
