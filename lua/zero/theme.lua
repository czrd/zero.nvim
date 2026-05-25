local M = {}

function M.get(p, opts)
  local t = vim.deepcopy(p)

  t.bg = opts.transparent and p.none or p.bg
  t.bg_sidebar = opts.transparent_sidebar and p.none or p.bg_dark
  t.bg_float = opts.transparent and p.none or p.bg_float
  t.bg_status = opts.transparent and p.none or p.bg_statusline
  t.bg_nc = opts.dim_inactive and p.bg_dark or (opts.transparent and p.none or p.bg)

  return t
end

return M
