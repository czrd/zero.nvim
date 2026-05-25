local palette = require("zero.palette")

local function get_palette()
  local bg = vim.o.background
  return bg == "light" and palette.light or palette.dark
end

local function theme()
  local p = get_palette()

  local mode_a_fg = p.bg
  local inactive = {
    a = { fg = p.fg_gutter, bg = p.bg_statusline },
    b = { fg = p.fg_gutter, bg = p.bg_statusline },
    c = { fg = p.fg_gutter, bg = p.bg_statusline },
  }
  local bc = { fg = p.fg, bg = p.bg_statusline }

  return {
    normal = {
      a = { fg = mode_a_fg, bg = p.green, gui = "bold" },
      b = bc,
      c = { fg = p.fg_dim, bg = p.bg_statusline },
    },
    insert = {
      a = { fg = mode_a_fg, bg = p.blue, gui = "bold" },
      b = bc,
      c = { fg = p.fg_dim, bg = p.bg_statusline },
    },
    visual = {
      a = { fg = mode_a_fg, bg = p.violet, gui = "bold" },
      b = bc,
      c = { fg = p.fg_dim, bg = p.bg_statusline },
    },
    replace = {
      a = { fg = mode_a_fg, bg = p.red, gui = "bold" },
      b = bc,
      c = { fg = p.fg_dim, bg = p.bg_statusline },
    },
    command = {
      a = { fg = mode_a_fg, bg = p.gold, gui = "bold" },
      b = bc,
      c = { fg = p.fg_dim, bg = p.bg_statusline },
    },
    terminal = {
      a = { fg = mode_a_fg, bg = p.teal, gui = "bold" },
      b = bc,
      c = { fg = p.fg_dim, bg = p.bg_statusline },
    },
    inactive = inactive,
  }
end

return theme()
