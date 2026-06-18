local M = {}

-- Default strength used when softening colors toward a pastel tone.
local PASTEL_AMOUNT = 0.35

-- Palette keys whose colors are accent/semantic hues safe to soften.
-- Backgrounds, neutral foregrounds and diff backings are intentionally excluded.
local PASTEL_KEYS = {
  "green",
  "gold",
  "blue",
  "violet",
  "orange",
  "teal",
  "red",
  "error",
  "warn",
  "info",
  "hint",
  "ok",
  "git_add",
  "git_change",
  "git_delete",
}

-- Terminal entries (Lua 1-based) to skip: the black/white anchors,
-- i.e. ANSI 0 (black), 7 (white), 8 (bright black) and 15 (bright white).
local PASTEL_TERMINAL_SKIP = { [1] = true, [8] = true, [9] = true, [16] = true }

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

local function is_hex(value)
  return type(value) == "string" and value:match("^#") ~= nil
end

-- Soften a single color toward a light, low-saturation pastel tone.
function M.pastelize(hex, amount)
  return M.lighten(hex, amount or PASTEL_AMOUNT)
end

-- Soften a palette in place: accent/semantic hues and the chromatic terminal
-- colors are pastelized; backgrounds, neutral foregrounds and the terminal
-- black/white anchors are left untouched.
function M.pastelize_palette(p, amount)
  amount = amount or PASTEL_AMOUNT
  for _, key in ipairs(PASTEL_KEYS) do
    if is_hex(p[key]) then
      p[key] = M.pastelize(p[key], amount)
    end
  end
  if type(p.terminal) == "table" then
    for i, c in ipairs(p.terminal) do
      if not PASTEL_TERMINAL_SKIP[i] and is_hex(c) then
        p.terminal[i] = M.pastelize(c, amount)
      end
    end
  end
  return p
end

function M.set_hl(groups)
  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, type(spec) == "string" and { link = spec } or spec)
  end
end

return M
