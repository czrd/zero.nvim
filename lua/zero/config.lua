local M = {}

M.defaults = {
  style = "light",
  transparent = false,
  transparent_sidebar = false,
  pastel = false,
  dim_inactive = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = {},
    variables = {},
    booleans = {},
  },
  plugins = { all = false, auto = true },
  on_palette = function(_) end,
  on_highlights = function(_, _) end,
}

M.options = vim.deepcopy(M.defaults)

local function normalize(options)
  local valid_styles = { auto = true, dark = true, light = true }
  if not valid_styles[options.style] then
    options.style = "auto"
  end
  if type(options.on_palette) ~= "function" then
    options.on_palette = function(_) end
  end
  if type(options.on_highlights) ~= "function" then
    options.on_highlights = function(_, _) end
  end
  options.pastel = options.pastel == true
  return options
end

function M.setup(options)
  M.options = normalize(vim.tbl_deep_extend("force", {}, M.defaults, options or {}))
  return M.options
end

function M.extend(options)
  return normalize(vim.tbl_deep_extend("force", {}, M.options or M.defaults, options or {}))
end

function M.resolve_style(opts)
  if opts.style == "auto" then
    return vim.o.background == "light" and "light" or "dark"
  end
  return opts.style
end

return M
