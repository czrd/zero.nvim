local config = require("zero.config")
local palette = require("zero.palette")
local theme = require("zero.theme")
local util = require("zero.util")

local M = {}

M.setup = config.setup

local autocmd_id = nil

function M.load(options)
  local opts = config.extend(options)
  local style = config.resolve_style(opts)

  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "zero"

  local p = vim.deepcopy(palette[style])
  opts.on_palette(p)
  local t = theme.get(p, opts)

  local groups = require("zero.groups").get(t, opts)
  opts.on_highlights(groups, p)
  util.set_hl(groups)

  if opts.terminal_colors then
    for i, c in ipairs(p.terminal) do
      vim.g["terminal_color_" .. (i - 1)] = c
    end
  end

  if autocmd_id then
    pcall(vim.api.nvim_del_autocmd, autocmd_id)
    autocmd_id = nil
  end

  if opts.style == "auto" then
    autocmd_id = vim.api.nvim_create_autocmd("OptionSet", {
      pattern = "background",
      callback = function()
        M.load()
      end,
    })
  end
end

function M.get_palette(options)
  local opts = config.extend(options)
  local style = config.resolve_style(opts)
  local p = vim.deepcopy(palette[style])
  opts.on_palette(p)
  return p
end

return M
