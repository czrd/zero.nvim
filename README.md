# 🌿 zero.nvim

A flat, high-contrast Neovim colorscheme with green as its signature color.
Dual dark/light modes, full Treesitter support, and coverage for 25+ popular plugins.

## ✨ Design

- 🪟 **Flat** — solid colors only, no gradients or decorative bold/italic
- 🔆 **High contrast** — WCAG 4.5:1+ for normal text, 3:1+ for UI elements
- 🌿 **Green signature** — keywords, cursor, selections, and UI chrome all anchored in green
- 🎯 **Tight palette** — 7 hue families (green · gold · blue · violet · orange · teal · red)
- 🌓 **Dual mode** — dark and light share the same role assignments; only HEX values differ

---

## 📦 Installation

### lazy.nvim

```lua
{
  "czrd/zero.nvim",
  priority = 1000,
  config = function()
    require("zero").setup({
      -- options (all optional)
    })
    vim.cmd("colorscheme zero")
  end,
}
```

### ⚡ No setup (minimal)

```lua
vim.cmd("colorscheme zero")
```

---

## ⚙️ Configuration

```lua
require("zero").setup({
  -- 'light' or 'dark' to force a mode; 'auto' follows vim.o.background
  style = "light",

  -- Remove all background colors (terminal transparency)
  transparent = false,

  -- Remove backgrounds only from sidebar-style windows (NvimTree, Aerial, etc.)
  transparent_sidebar = false,

  -- Dim inactive windows slightly
  dim_inactive = false,

  -- Set vim.g.terminal_color_0..15
  terminal_colors = true,

  styles = {
    comments  = { italic = true },   -- style table passed to nvim_set_hl
    keywords  = { bold = true },
    functions = {},
    variables = {},
    booleans  = {},
  },

  plugins = {
    all  = false,  -- load all plugin groups unconditionally
    auto = true,   -- load a plugin group when its package is in package.loaded
  },

  -- Mutate the raw palette before highlights are computed
  on_palette = function(palette)
    -- palette.green = "#00ff88"
  end,

  -- Mutate the final highlight table before it is applied
  on_highlights = function(highlights, palette)
    -- highlights.Comment = { fg = palette.comment, italic = false }
  end,
})
```

---

## 🌓 Dark / Light switching

The default is **`"light"`**. Pass `style` to `setup` to override:

```lua
-- light (default)
require("zero").setup({ style = "light" })
vim.cmd("colorscheme zero")

-- dark
require("zero").setup({ style = "dark" })
vim.cmd("colorscheme zero")
```

**Auto mode** — follows `vim.o.background` and reloads on change:

```lua
require("zero").setup({ style = "auto" })
vim.cmd("colorscheme zero")
```

```vim
:set background=dark
:set background=light
```

---

## 🎨 Color Palette

| Role                   | Key             | ☀️ Light  | &nbsp;                                        | 🌑 Dark   | &nbsp;                                        |
| ---------------------- | --------------- | --------- | --------------------------------------------- | --------- | --------------------------------------------- |
| Background             | `bg`            | `#f7f8fa` | ![](https://placehold.co/20x20/f7f8fa/f7f8fa) | `#141519` | ![](https://placehold.co/20x20/141519/141519) |
| Background dark        | `bg_dark`       | `#eceef1` | ![](https://placehold.co/20x20/eceef1/eceef1) | `#0f1013` | ![](https://placehold.co/20x20/0f1013/0f1013) |
| Background float       | `bg_float`      | `#ffffff` | ![](https://placehold.co/20x20/ffffff/ffffff) | `#1c1d24` | ![](https://placehold.co/20x20/1c1d24/1c1d24) |
| CursorLine             | `bg_cursorline` | `#eef0f3` | ![](https://placehold.co/20x20/eef0f3/eef0f3) | `#1d1e26` | ![](https://placehold.co/20x20/1d1e26/1d1e26) |
| Visual                 | `bg_visual`     | `#cdebd9` | ![](https://placehold.co/20x20/cdebd9/cdebd9) | `#2e3b33` | ![](https://placehold.co/20x20/2e3b33/2e3b33) |
| Foreground             | `fg`            | `#1b1d24` | ![](https://placehold.co/20x20/1b1d24/1b1d24) | `#eef0f4` | ![](https://placehold.co/20x20/eef0f4/eef0f4) |
| Foreground dim         | `fg_dim`        | `#5b626e` | ![](https://placehold.co/20x20/5b626e/5b626e) | `#b8bcc6` | ![](https://placehold.co/20x20/b8bcc6/b8bcc6) |
| Gutter                 | `fg_gutter`     | `#aab0bb` | ![](https://placehold.co/20x20/aab0bb/aab0bb) | `#4b5160` | ![](https://placehold.co/20x20/4b5160/4b5160) |
| Comment                | `comment`       | `#828995` | ![](https://placehold.co/20x20/828995/828995) | `#6e7689` | ![](https://placehold.co/20x20/6e7689/6e7689) |
| 🌿 **Green** (keyword) | `green`         | `#0c7d43` | ![](https://placehold.co/20x20/0c7d43/0c7d43) | `#36e07e` | ![](https://placehold.co/20x20/36e07e/36e07e) |
| 🟡 Gold (string)       | `gold`          | `#847000` | ![](https://placehold.co/20x20/847000/847000) | `#f2d24c` | ![](https://placehold.co/20x20/f2d24c/f2d24c) |
| 🔵 Blue (function)     | `blue`          | `#2070d0` | ![](https://placehold.co/20x20/2070d0/2070d0) | `#4ea6ff` | ![](https://placehold.co/20x20/4ea6ff/4ea6ff) |
| 🟣 Violet (type)       | `violet`        | `#6a30db` | ![](https://placehold.co/20x20/6a30db/6a30db) | `#a98cff` | ![](https://placehold.co/20x20/a98cff/a98cff) |
| 🟠 Orange (constant)   | `orange`        | `#b35411` | ![](https://placehold.co/20x20/b35411/b35411) | `#ff9356` | ![](https://placehold.co/20x20/ff9356/ff9356) |
| 🩵 Teal (operator)     | `teal`          | `#0a7268` | ![](https://placehold.co/20x20/0a7268/0a7268) | `#2fd9c8` | ![](https://placehold.co/20x20/2fd9c8/2fd9c8) |
| 🔴 Red (error)         | `red`           | `#d61f3a` | ![](https://placehold.co/20x20/d61f3a/d61f3a) | `#ff5c5c` | ![](https://placehold.co/20x20/ff5c5c/ff5c5c) |

---

## 🎨 Accessing the palette from Lua

Use `get_palette()` to retrieve the resolved color table — useful for
building integrations with other plugins (statuslines, custom highlights, etc.).

```lua
-- follows the style set in setup() (or vim.o.background when style = "auto")
local p = require("zero").get_palette()

-- force a specific mode regardless of setup()
local dark  = require("zero").get_palette({ style = "dark" })
local light = require("zero").get_palette({ style = "light" })
```

The returned table contains all palette keys:

```lua
p.green    -- #36e07e (dark) / #0c7d43 (light)
p.blue     -- #4ea6ff / #2070d0
p.violet   -- #a98cff / #6a30db
p.gold     -- #f2d24c / #847000
p.orange   -- #ff9356 / #b35411
p.teal     -- #2fd9c8 / #0a7268
p.red      -- #ff5c5c / #d61f3a
p.bg       -- background
p.fg       -- foreground
-- ... (all keys listed in the Color Palette table above)
```

**Example — custom highlight using palette colors:**

```lua
local p = require("zero").get_palette()
vim.api.nvim_set_hl(0, "MyCustomHL", { fg = p.green, bg = p.bg_float })
```

---

## 📊 lualine theme

### String (simple)

```lua
require("lualine").setup({
  options = { theme = "zero" },
})
```

### Lua utility (programmatic)

`require("zero.utils.lualine")` returns the theme table built from the current palette,
letting you inspect or modify it before passing it to lualine.

```lua
require("zero").setup({ style = "dark" })

local zero_lualine = require("zero.utils.lualine")
require("lualine").setup({
  options = { theme = zero_lualine },
})
```

You can override individual sections before passing the table:

```lua
local theme = require("zero.utils.lualine")
theme.normal.a.bg = require("zero").get_palette().teal
require("lualine").setup({ options = { theme = theme } })
```

---

## 🔌 Supported plugins

| Plugin                                                                                                                                                   | Notes                                                               |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                                                                                    | Full `@capture` coverage                                            |
| [LSP Diagnostics / semantic tokens](https://github.com/neovim/neovim)                                                                                    | Underlines + virtual text, no bg on virtual                         |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                                                                                       | 3-pane border hierarchy                                             |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)                                                                                              | Sidebar bg, git signs                                               |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)                                                                                          | Sidebar bg, git signs                                               |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                                                                                             | Dedicated theme file                                                |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)                                                                                            | Green accent on selected tab                                        |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                                                                                              | add/change/delete signs + line bg                                   |
| [mini.nvim](https://github.com/echasnovski/mini.nvim)                                                                                                    | statusline, tabline, files, diff, indentscope, icons, pick, clue, … |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) v3                                                                       | scope = green                                                       |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                                                                                          | Kind icons mapped to palette                                        |
| [blink.cmp](https://github.com/Saghen/blink.cmp)                                                                                                         | Kind icons mapped to palette                                        |
| [which-key.nvim](https://github.com/folke/which-key.nvim)                                                                                                | v2 + v3                                                             |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) / [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)                                        | Header = green                                                      |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)                                                                                                   | Per-level colors                                                    |
| [noice.nvim](https://github.com/folke/noice.nvim)                                                                                                        | Cmdline popup, lsp progress                                         |
| [flash.nvim](https://github.com/folke/flash.nvim)                                                                                                        | Label = green bg                                                    |
| [trouble.nvim](https://github.com/folke/trouble.nvim)                                                                                                    | v2 + v3                                                             |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)                                                                                        | All keyword tags                                                    |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) / [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)                                            | Breakpoint = red, stopped line = gold                               |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                                                                                                 |                                                                     |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                                                                                                          | Plugin manager UI                                                   |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) / [headlines.nvim](https://github.com/lukas-reineke/headlines.nvim) | Headings = green                                                    |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim)                                                                                               | File panel, diff regions                                            |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim)                                                                                                   | Symbol sidebar                                                      |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic) / [barbecue.nvim](https://github.com/utilyre/barbecue.nvim)                                         | Breadcrumb                                                          |

---

## 💻 Terminal emulator themes

Dark and light theme files are provided for the most common terminal emulators under [`extras/`](extras/).

| Terminal                                    | Files                                              | Setup guide                                                            |
| ------------------------------------------- | -------------------------------------------------- | ---------------------------------------------------------------------- |
| [Alacritty](https://alacritty.org)          | `zero-dark.toml` / `zero-light.toml`               | [extras/alacritty/README.md](extras/alacritty/README.md)               |
| [foot](https://codeberg.org/dnkl/foot)      | `zero-dark.ini` / `zero-light.ini`                 | [extras/foot/README.md](extras/foot/README.md)                         |
| [Ghostty](https://ghostty.org)              | `zero-dark` / `zero-light`                         | [extras/ghostty/README.md](extras/ghostty/README.md)                   |
| [iTerm2](https://iterm2.com)                | `zero-dark.itermcolors` / `zero-light.itermcolors` | [extras/iterm/README.md](extras/iterm/README.md)                       |
| [Kitty](https://sw.kovidgoyal.net/kitty)    | `zero-dark.conf` / `zero-light.conf`               | [extras/kitty/README.md](extras/kitty/README.md)                       |
| [WezTerm](https://wezfurlong.org/wezterm)   | `zero-dark.toml` / `zero-light.toml`               | [extras/wezterm/README.md](extras/wezterm/README.md)                   |
| [Windows Terminal](https://aka.ms/terminal) | `zero-dark.json` / `zero-light.json`               | [extras/windows_terminal/README.md](extras/windows_terminal/README.md) |
