local M = {}

function M.get(t, _opts)
  return {
    TodoBgTODO = { fg = t.bg, bg = t.green, bold = true },
    TodoFgTODO = { fg = t.green },
    TodoSignTODO = { fg = t.green },
    TodoBgFIX = { fg = t.bg, bg = t.red, bold = true },
    TodoFgFIX = { fg = t.red },
    TodoSignFIX = { fg = t.red },
    TodoBgFIXME = { fg = t.bg, bg = t.red, bold = true },
    TodoFgFIXME = { fg = t.red },
    TodoSignFIXME = { fg = t.red },
    TodoBgBUG = { fg = t.bg, bg = t.red, bold = true },
    TodoFgBUG = { fg = t.red },
    TodoSignBUG = { fg = t.red },
    TodoBgHACK = { fg = t.bg, bg = t.orange, bold = true },
    TodoFgHACK = { fg = t.orange },
    TodoSignHACK = { fg = t.orange },
    TodoBgWARN = { fg = t.bg, bg = t.warn, bold = true },
    TodoFgWARN = { fg = t.warn },
    TodoSignWARN = { fg = t.warn },
    TodoBgNOTE = { fg = t.bg, bg = t.info, bold = true },
    TodoFgNOTE = { fg = t.info },
    TodoSignNOTE = { fg = t.info },
    TodoBgPERF = { fg = t.bg, bg = t.violet, bold = true },
    TodoFgPERF = { fg = t.violet },
    TodoSignPERF = { fg = t.violet },
    TodoBgTEST = { fg = t.bg, bg = t.teal, bold = true },
    TodoFgTEST = { fg = t.teal },
    TodoSignTEST = { fg = t.teal },
  }
end

return M
