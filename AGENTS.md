# AGENTS.md — zero.nvim Developer Guide

Reference document for AI agents working in this repository.

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [Directory Structure](#2-directory-structure)
3. [Data Flow](#3-data-flow)
4. [Color Palette Design Knowledge](#4-color-palette-design-knowledge)
5. [Development Environment Setup](#5-development-environment-setup)
6. [Testing](#6-testing)
7. [Common Change Patterns](#7-common-change-patterns)

---

## 1. Project Overview

- **Colorscheme name**: `zero` (loaded via `:colorscheme zero`)
- **Lua module name**: `zero` (imported via `require("zero")`)
- **Neovim compatibility**: 0.9+ (0.10+-only APIs must be wrapped in version guards)
- **External dependencies**: none (Pure Lua)
- **Dual mode**: `dark` / `light` (auto-follows `vim.o.background`)

---

## 2. Directory Structure

```
zero.nvim/
├── AGENTS.md                         ← this file
├── README.md
├── LICENSE
├── .stylua.toml                      ← stylua formatter config
├── .githooks/
│   └── pre-commit                    ← runs stylua --check on staged .lua files
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   └── PULL_REQUEST_TEMPLATE.md
│
├── colors/
│   └── zero.lua                      ← :colorscheme zero entry point
│                                       highlight clear → syntax reset →
│                                       set colors_name → require("zero").load()
│
├── extras/                           ← terminal emulator theme exports
│   ├── alacritty/
│   │   ├── zero-dark.toml
│   │   └── zero-light.toml
│   ├── kitty/
│   │   ├── zero-dark.conf
│   │   └── zero-light.conf
│   ├── wezterm/
│   │   ├── zero-dark.toml
│   │   └── zero-light.toml
│   ├── ghostty/
│   │   ├── zero-dark
│   │   └── zero-light
│   ├── iterm/
│   │   ├── zero-dark.itermcolors
│   │   └── zero-light.itermcolors
│   ├── foot/
│   │   ├── zero-dark.ini
│   │   └── zero-light.ini
│   └── windows_terminal/
│       ├── zero-dark.json
│       └── zero-light.json
│
└── lua/
    ├── zero/
    │   ├── init.lua                  ← public API: setup() / load()
    │   ├── config.lua                ← defaults, merge, style resolution
    │   ├── palette.lua               ← raw HEX tables for dark / light (no computation)
    │   ├── theme.lua                 ← palette + opts → semantic color table
    │   │                               handles transparent / dim_inactive / sidebar
    │   ├── util.lua                  ← blend / lighten / darken / set_hl
    │   │
    │   └── groups/
    │       ├── init.lua              ← aggregates core modules + plugin auto-detection
    │       ├── editor.lua            ← Neovim core UI groups (80+)
    │       ├── syntax.lua            ← legacy vim syntax groups
    │       ├── treesitter.lua        ← @capture + @lsp.type.* groups (100+)
    │       ├── lsp.lua               ← Diagnostic / LSP groups (40+)
    │       └── plugins/              ← one file per plugin
    │           ├── telescope.lua
    │           ├── gitsigns.lua
    │           ├── nvim_tree.lua
    │           ├── neo_tree.lua
    │           ├── bufferline.lua
    │           ├── indent_blankline.lua
    │           ├── cmp.lua           ← nvim-cmp + blink.cmp
    │           ├── which_key.lua
    │           ├── alpha.lua         ← alpha-nvim + dashboard-nvim
    │           ├── notify.lua
    │           ├── noice.lua
    │           ├── flash.lua
    │           ├── trouble.lua
    │           ├── todo_comments.lua
    │           ├── dap.lua           ← nvim-dap + nvim-dap-ui
    │           ├── mason.lua
    │           ├── lazy.lua
    │           ├── render_markdown.lua  ← render-markdown.nvim + headlines.nvim
    │           ├── diffview.lua
    │           ├── aerial.lua
    │           ├── navic.lua         ← nvim-navic + barbecue
    │           └── mini.lua          ← multiple mini.nvim submodules
    │
    └── lualine/
        └── themes/
            └── zero.lua              ← lualine theme (reads vim.o.background)
```

### File Roles and Constraints

| File | Role | Constraint |
|---|---|---|
| `palette.lua` | stores raw HEX values only | no computation or derivation |
| `theme.lua` | returns final color table with opts applied | derive `transparent`/`dim_inactive` here |
| `util.lua` | color math + highlight application | depends on Neovim API; not unit-testable standalone |
| `groups/*.lua` | each `M.get(t, opts)` returns a flat table of groups | no side effects; do not call `set_hl` directly |
| `groups/init.lua` | aggregates groups + detects plugins via `package.loaded` | `plugin_map` keys must match actual `package.loaded` keys |

---

## 3. Data Flow

```
:colorscheme zero
  └─ colors/zero.lua
       └─ require("zero").load()
            ├─ config.extend()          -- resolve final opts table
            ├─ config.resolve_style()   -- "auto" → "dark" or "light"
            ├─ palette[style]           -- deep-copy raw HEX table
            ├─ opts.on_palette(p)       -- user hook: mutate palette
            ├─ theme.get(p, opts)       -- build semantic table t
            ├─ groups.get(t, opts)      -- collect all highlight groups
            ├─ opts.on_highlights(g, p) -- user hook: mutate groups
            ├─ util.set_hl(groups)      -- nvim_set_hl(0, name, spec) loop
            └─ terminal_color_0..15     -- set vim.g.terminal_color_*
```

Plugin detection logic inside `groups.get()`:

```lua
-- when plugins.auto = true (default)
for pkg, mod in pairs(plugin_map) do
  if package.loaded[pkg] ~= nil then
    -- pkg is the require-name used by the plugin; load its group file if present
    load_plugin(mod, t, opts, groups)
  end
end
```

---

## 4. Color Palette Design Knowledge

### 4.1 Role and Key Reference

The palette is structured as **role → key → HEX**. To change a color, edit only
`palette.lua`; the group files never need to be touched.

#### Background keys

| Key | Usage |
|---|---|
| `bg` | `Normal` background (most-referenced key) |
| `bg_dark` | sidebars, inactive splits, darker panels |
| `bg_float` | float windows, popups |
| `bg_cursorline` | `CursorLine`, `ColorColumn` |
| `bg_visual` | visual selection (signature-color tint) |
| `bg_selection` | completion selection, subtle selection, LSP reference |
| `bg_statusline` | status line background |
| `border` | `WinSeparator`, float borders, indent guides |
| `none` | always the string literal `"NONE"` |

#### Foreground keys

| Key | Usage |
|---|---|
| `fg` | normal text |
| `fg_dim` | inactive text, separators |
| `fg_gutter` | `LineNr`, `SignColumn` |
| `comment` | comments |

#### Syntax colors (7 hue families)

| Key | Assignment |
|---|---|
| `green` | keywords — signature color |
| `gold` | strings, character literals |
| `blue` | function definitions and calls |
| `violet` | types, builtins, constructors |
| `orange` | constants, numbers, booleans |
| `teal` | operators, symbols |
| `red` | errors |

#### Diagnostic and Git keys

| Key | Usage |
|---|---|
| `error` / `warn` / `info` / `hint` / `ok` | Diagnostic colors |
| `git_add` / `git_change` / `git_delete` | git signs and indicators |
| `diff_add` / `diff_change` / `diff_delete` / `diff_text` | diff backgrounds (dark, muted) |

#### Terminal ANSI (0–15)

The `terminal` array index maps directly to the ANSI color number:

```
[1]=black  [2]=red  [3]=green  [4]=yellow  [5]=blue  [6]=magenta  [7]=cyan  [8]=white
[9..16] = bright variants of the above
```

### 4.2 Contrast Ratio Calculation

**WCAG relative luminance formula:**

```
Normalize sRGB channel c to [0, 1]:
  c_lin = c / 12.92                      (c <= 0.04045)
  c_lin = ((c + 0.055) / 1.055) ^ 2.4   (c > 0.04045)

Relative luminance:
  L = 0.2126 * R_lin + 0.7152 * G_lin + 0.0722 * B_lin

Contrast ratio:
  (L_bright + 0.05) / (L_dark + 0.05)
```

**Targets:**
- Normal text (`fg` on `bg`): **≥ 4.5:1**
- UI elements (`border`, `fg_gutter`, etc.): **≥ 3:1**
- All syntax colors on `bg`: **≥ 4.5:1**

**Dark vs. light design strategy:**
- Dark: `bg` luminance ≈ 0.005 (near-black), `fg` luminance ≈ 0.85 (light gray)
- Light: `bg` luminance ≈ 0.93 (near-white), `fg` luminance ≈ 0.02 (near-black)
- Syntax colors share the same hue in both modes; dark uses higher saturation and
  brightness, light uses darker, slightly more muted values

### 4.3 Diff Background Generation Pattern

Diff backgrounds are created by blending a syntax color into `bg`.
Using `util.blend(fg, bg, amount)`:

```lua
-- dark mode example
diff_add    = util.blend(green, bg, 0.15)  -- 15% green tint
diff_change = util.blend(blue,  bg, 0.15)
diff_delete = util.blend(red,   bg, 0.15)
diff_text   = util.blend(green, bg, 0.25)  -- slightly stronger than diff_add
```

`palette.lua` currently stores pre-computed fixed values; if dynamic generation is
needed, call `util.blend` from `theme.lua`.

### 4.4 Semantic Keys Added by `theme.lua`

`theme.get(p, opts)` produces these derived keys:

| Key | With transparency | Without transparency |
|---|---|---|
| `t.bg` | `"NONE"` | `p.bg` |
| `t.bg_sidebar` | `"NONE"` | `p.bg_dark` |
| `t.bg_float` | `"NONE"` | `p.bg_float` |
| `t.bg_status` | `"NONE"` | `p.bg_statusline` |
| `t.bg_nc` | `p.bg_dark` (dim_inactive) | `p.bg` |

Group files must always use `t.bg` (post-derivation), not the raw `p.bg`.
For sidebar windows, use `t.bg_sidebar` (which respects `transparent_sidebar`).

### 4.5 Syntax Group Assignment Rules

```
green   → @keyword family / Statement / Conditional / Repeat / Include / Label / @tag
gold    → @string / @character / String / Character
blue    → @function / @function.call / @function.method / Function
violet  → @type / @type.builtin / @constructor / @function.builtin / Type / PreProc
orange  → @number / @boolean / @constant / Constant / Number / Boolean
teal    → @operator / Operator / Special
red     → Error / DiagnosticError
fg      → @variable / @variable.parameter / @property / Identifier (uncolored)
fg_dim  → @punctuation.* / Delimiter / brackets
comment → @comment / Comment
```

`@lsp.type.*` groups are linked to their Treesitter equivalents
(e.g. `@lsp.type.function → @function`).

---

## 5. Development Environment Setup

### 5.1 Prerequisites

```
Neovim >= 0.9
lua >= 5.1         (for syntax checks)
stylua             (formatter — cargo install stylua)
```

### 5.2 Loading the Plugin Locally

With lazy.nvim:

```lua
-- ~/.config/nvim/lua/plugins/zero.lua
return {
  dir = "/home/czrd/development/zero.nvim",
  name = "zero.nvim",
  priority = 1000,
  config = function()
    require("zero").setup({})
    vim.cmd("colorscheme zero")
  end,
}
```

Or directly in `init.lua`:

```lua
vim.opt.rtp:prepend("/home/czrd/development/zero.nvim")
```

### 5.3 Syntax Check (Lua interpreter)

```bash
# detect syntax errors across all Lua files
for f in $(find lua colors -name "*.lua"); do
  result=$(lua -e "local fn,err=loadfile('$f'); if err then print('ERROR: '..err) end" 2>&1)
  [ -n "$result" ] && echo "$result"
done
echo "done"
```

### 5.4 stylua (Formatter)

Config is managed in `.stylua.toml` (`column_width=120`, `indent_width=2`, `Spaces`).

```bash
# install (requires cargo)
cargo install stylua

# format in place
stylua lua/ colors/

# check only (CI)
stylua --check lua/ colors/
```

### 5.5 Activating the pre-commit Hook

The hook script lives in `.githooks/pre-commit`. After `git init`, run:

```bash
git init
git config core.hooksPath .githooks
```

The hook checks only staged `.lua` files with `stylua --check` and aborts the commit
if any file is unformatted, printing the filenames that need fixing.

---

## 6. Testing

### 6.1 Standalone Test via Minimal init.lua

```lua
-- /tmp/test_zero.lua
vim.opt.rtp:prepend("/home/czrd/development/zero.nvim")
vim.opt.termguicolors = true

vim.cmd("colorscheme zero")
assert(vim.g.colors_name == "zero", "colors_name not set")

vim.o.background = "light"
-- OptionSet autocmd fires immediately and re-applies
```

```bash
nvim -u /tmp/test_zero.lua --headless +"lua print(vim.g.colors_name)" +q
# expected output: zero
```

### 6.2 Dark and Light Mode Verification

```bash
# dark
nvim --headless \
  +"set rtp+=/home/czrd/development/zero.nvim" \
  +"colorscheme zero" \
  +"set background=dark" \
  +"lua assert(vim.g.colors_name=='zero')" +q && echo "dark OK"

# light
nvim --headless \
  +"set rtp+=/home/czrd/development/zero.nvim" \
  +"colorscheme zero" \
  +"set background=light" \
  +"lua assert(vim.g.colors_name=='zero')" +q && echo "light OK"
```

### 6.3 Transparent Mode Verification

```lua
-- /tmp/test_transparent.lua
vim.opt.rtp:prepend("/home/czrd/development/zero.nvim")
vim.opt.termguicolors = true
require("zero").setup({ transparent = true })
vim.cmd("colorscheme zero")

local hl = vim.api.nvim_get_hl(0, { name = "Normal" })
assert(hl.bg == nil, "transparent: Normal.bg should be nil")
print("transparent OK")
```

```bash
nvim -u /tmp/test_transparent.lua --headless +q
```

### 6.4 No-setup Verification

```bash
nvim --headless \
  +"set rtp+=/home/czrd/development/zero.nvim" \
  +"colorscheme zero" \
  +"lua assert(vim.g.colors_name=='zero', 'failed')" \
  +q && echo "no-setup OK"
```

### 6.5 Checking Error Messages

After loading, run `:messages` in Neovim to check for Lua errors:

```
E5108: Error executing lua: ...lua/zero/groups/editor.lua:42: ...
```

### 6.6 Inspecting Highlight Groups

```vim
:lua print(vim.inspect(vim.api.nvim_get_hl(0, { name = "Normal" })))
:lua print(vim.inspect(vim.api.nvim_get_hl(0, { name = "@keyword" })))

" filter by prefix
:lua for k,v in pairs(vim.api.nvim_get_hl(0, {})) do if k:match("^@keyword") then print(k, vim.inspect(v)) end end
```

### 6.7 Verifying Terminal Colors

```vim
:lua for i=0,15 do print(i, vim.g["terminal_color_"..i]) end
```

---

## 7. Common Change Patterns

### 7.1 Changing a Color Value

Edit only the HEX in `lua/zero/palette.lua`. No group files need to change.

```lua
-- example: change the dark-mode signature green
M.dark = {
  green = "#2ecc71",  -- only this line changes
  ...
}
```

### 7.2 Adding Support for a New Plugin

1. Create `lua/zero/groups/plugins/<plugin_name>.lua`:

```lua
local M = {}

function M.get(t, _opts)
  return {
    PluginNormal = { fg = t.fg, bg = t.bg_float },
    PluginBorder = { fg = t.border, bg = t.bg_float },
    -- ...
  }
end

return M
```

2. Add entries to `plugin_map` in `lua/zero/groups/init.lua`:

```lua
["plugin-name"]      = "zero.groups.plugins.<plugin_name>",
["plugin-name.nvim"] = "zero.groups.plugins.<plugin_name>",
```

3. Add a linked row to the **Supported plugins** table in `README.md`.

### 7.3 Highlight Spec Syntax

`util.set_hl` accepts these forms:

```lua
-- direct spec
GroupName = { fg = "#rrggbb", bg = "#rrggbb", bold = true, italic = true,
              underline = true, undercurl = true, strikethrough = true, sp = "#rrggbb" }

-- link (string or table — util.set_hl converts automatically)
GroupName = { link = "OtherGroup" }
GroupName = "OtherGroup"
```

`sp` sets the color for undercurl/underline decorations (used in Diagnostic groups).

### 7.4 Neovim Version Guards

Wrap any 0.10+-only API usage:

```lua
if vim.fn.has("nvim-0.10") == 1 then
  -- 0.10+ only code
end
```

### 7.5 Using `on_palette` / `on_highlights` (for end users)

```lua
require("zero").setup({
  -- change a color globally (affects all groups)
  on_palette = function(p)
    p.green = "#00ff88"
  end,

  -- override specific groups after generation
  on_highlights = function(hl, p)
    hl.Comment = { fg = p.comment, italic = false }
    hl.CursorLine = { bg = "#222244" }
  end,
})
```
