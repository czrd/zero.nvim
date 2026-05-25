local M = {}

local function clamp(value)
  return math.max(0, math.min(255, math.floor(value + 0.5)))
end

local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", clamp(r), clamp(g), clamp(b))
end

function M.blend(fg, bg, amount)
  local fr, fg_c, fb = hex_to_rgb(fg)
  local br, bg_c, bb = hex_to_rgb(bg)
  return rgb_to_hex(
    fr * amount + br * (1 - amount),
    fg_c * amount + bg_c * (1 - amount),
    fb * amount + bb * (1 - amount)
  )
end

function M.lighten(hex, amount)
  return M.blend("#ffffff", hex, amount)
end

function M.darken(hex, amount)
  return M.blend("#000000", hex, amount)
end

function M.set_hl(groups)
  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, type(spec) == "string" and { link = spec } or spec)
  end
end

return M
