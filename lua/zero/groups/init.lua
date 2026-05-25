local M = {}

local plugin_map = {
  ["telescope"] = "zero.groups.plugins.telescope",
  ["telescope.nvim"] = "zero.groups.plugins.telescope",
  ["gitsigns"] = "zero.groups.plugins.gitsigns",
  ["gitsigns.nvim"] = "zero.groups.plugins.gitsigns",
  ["nvim-tree"] = "zero.groups.plugins.nvim_tree",
  ["nvim-tree.lua"] = "zero.groups.plugins.nvim_tree",
  ["neo-tree"] = "zero.groups.plugins.neo_tree",
  ["neo-tree.nvim"] = "zero.groups.plugins.neo_tree",
  ["bufferline"] = "zero.groups.plugins.bufferline",
  ["bufferline.nvim"] = "zero.groups.plugins.bufferline",
  ["ibl"] = "zero.groups.plugins.indent_blankline",
  ["indent_blankline"] = "zero.groups.plugins.indent_blankline",
  ["cmp"] = "zero.groups.plugins.cmp",
  ["nvim-cmp"] = "zero.groups.plugins.cmp",
  ["blink.cmp"] = "zero.groups.plugins.cmp",
  ["which-key"] = "zero.groups.plugins.which_key",
  ["which-key.nvim"] = "zero.groups.plugins.which_key",
  ["alpha"] = "zero.groups.plugins.alpha",
  ["alpha-nvim"] = "zero.groups.plugins.alpha",
  ["dashboard"] = "zero.groups.plugins.alpha",
  ["dashboard-nvim"] = "zero.groups.plugins.alpha",
  ["notify"] = "zero.groups.plugins.notify",
  ["nvim-notify"] = "zero.groups.plugins.notify",
  ["noice"] = "zero.groups.plugins.noice",
  ["noice.nvim"] = "zero.groups.plugins.noice",
  ["flash"] = "zero.groups.plugins.flash",
  ["flash.nvim"] = "zero.groups.plugins.flash",
  ["trouble"] = "zero.groups.plugins.trouble",
  ["trouble.nvim"] = "zero.groups.plugins.trouble",
  ["todo-comments"] = "zero.groups.plugins.todo_comments",
  ["todo-comments.nvim"] = "zero.groups.plugins.todo_comments",
  ["dap"] = "zero.groups.plugins.dap",
  ["nvim-dap"] = "zero.groups.plugins.dap",
  ["dapui"] = "zero.groups.plugins.dap",
  ["nvim-dap-ui"] = "zero.groups.plugins.dap",
  ["mason"] = "zero.groups.plugins.mason",
  ["mason.nvim"] = "zero.groups.plugins.mason",
  ["lazy"] = "zero.groups.plugins.lazy",
  ["lazy.nvim"] = "zero.groups.plugins.lazy",
  ["render-markdown"] = "zero.groups.plugins.render_markdown",
  ["render-markdown.nvim"] = "zero.groups.plugins.render_markdown",
  ["headlines"] = "zero.groups.plugins.render_markdown",
  ["headlines.nvim"] = "zero.groups.plugins.render_markdown",
  ["diffview"] = "zero.groups.plugins.diffview",
  ["diffview.nvim"] = "zero.groups.plugins.diffview",
  ["aerial"] = "zero.groups.plugins.aerial",
  ["aerial.nvim"] = "zero.groups.plugins.aerial",
  ["nvim-navic"] = "zero.groups.plugins.navic",
  ["barbecue"] = "zero.groups.plugins.navic",
  ["barbecue.nvim"] = "zero.groups.plugins.navic",
  ["mini"] = "zero.groups.plugins.mini",
  ["mini.nvim"] = "zero.groups.plugins.mini",
}

local function load_plugin(mod, t, opts, groups)
  local ok, m = pcall(require, mod)
  if ok then
    for k, v in pairs(m.get(t, opts)) do
      groups[k] = v
    end
  end
end

function M.get(t, opts)
  local groups = {}

  local core_modules = {
    require("zero.groups.editor"),
    require("zero.groups.syntax"),
    require("zero.groups.treesitter"),
    require("zero.groups.lsp"),
  }
  for _, m in ipairs(core_modules) do
    for k, v in pairs(m.get(t, opts)) do
      groups[k] = v
    end
  end

  local loaded_mods = {}

  if opts.plugins and opts.plugins.all then
    for _, mod in pairs(plugin_map) do
      if not loaded_mods[mod] then
        loaded_mods[mod] = true
        load_plugin(mod, t, opts, groups)
      end
    end
  elseif opts.plugins and opts.plugins.auto then
    for pkg, mod in pairs(plugin_map) do
      if package.loaded[pkg] ~= nil and not loaded_mods[mod] then
        loaded_mods[mod] = true
        load_plugin(mod, t, opts, groups)
      end
    end
  end

  return groups
end

return M
