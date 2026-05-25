local M = {}

function M.get(t, _opts)
  return {
    -- alpha-nvim
    AlphaHeader = { fg = t.green },
    AlphaHeaderLabel = { fg = t.green, bold = true },
    AlphaButtons = { fg = t.blue },
    AlphaShortcut = { fg = t.gold },
    AlphaFooter = { fg = t.comment, italic = true },

    -- dashboard-nvim
    DashboardHeader = { fg = t.green },
    DashboardCenter = { fg = t.blue },
    DashboardCenterIcon = { fg = t.green },
    DashboardShortcut = { fg = t.gold },
    DashboardFooter = { fg = t.comment, italic = true },
    DashboardDesc = { fg = t.fg },
    DashboardKey = { fg = t.gold },
    DashboardIcon = { fg = t.green },

    -- dashboard-nvim v2
    DashboardProjectTitle = { fg = t.blue, bold = true },
    DashboardProjectTitleIcon = { fg = t.blue },
    DashboardProjectIcon = { fg = t.blue },
    DashboardMruTitle = { fg = t.blue, bold = true },
    DashboardMruIcon = { fg = t.blue },
    DashboardFiles = { fg = t.fg },
    DashboardShotcut = { fg = t.gold },
    DashboardShotcutIcon = { fg = t.green },
  }
end

return M
