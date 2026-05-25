# 🌿 zero.nvim

A flat, high-contrast Neovim colorscheme with green as its signature color.
Dual dark/light modes, full Treesitter support, and coverage for 25+ popular plugins.


## 🎨 Color Palette

| Role | Key | ☀️ Light | &nbsp; | 🌑 Dark | &nbsp; |
|---|---|---|---|---|---|
| Background | `bg` | `#eef7f2` | ![](https://placehold.co/20x20/eef7f2/eef7f2) | `#0a0d0b` | ![](https://placehold.co/20x20/0a0d0b/0a0d0b) |
| Background dark | `bg_dark` | `#e1ede8` | ![](https://placehold.co/20x20/e1ede8/e1ede8) | `#060908` | ![](https://placehold.co/20x20/060908/060908) |
| Background float | `bg_float` | `#f6fbf8` | ![](https://placehold.co/20x20/f6fbf8/f6fbf8) | `#0f1410` | ![](https://placehold.co/20x20/0f1410/0f1410) |
| CursorLine | `bg_cursorline` | `#e5f2ea` | ![](https://placehold.co/20x20/e5f2ea/e5f2ea) | `#131b14` | ![](https://placehold.co/20x20/131b14/131b14) |
| Visual | `bg_visual` | `#bce6cc` | ![](https://placehold.co/20x20/bce6cc/bce6cc) | `#183024` | ![](https://placehold.co/20x20/183024/183024) |
| Foreground | `fg` | `#0c1a12` | ![](https://placehold.co/20x20/0c1a12/0c1a12) | `#c8e8d4` | ![](https://placehold.co/20x20/c8e8d4/c8e8d4) |
| Foreground dim | `fg_dim` | `#3c5e4f` | ![](https://placehold.co/20x20/3c5e4f/3c5e4f) | `#6e9878` | ![](https://placehold.co/20x20/6e9878/6e9878) |
| Gutter | `fg_gutter` | `#789e8c` | ![](https://placehold.co/20x20/789e8c/789e8c) | `#2e4a38` | ![](https://placehold.co/20x20/2e4a38/2e4a38) |
| Comment | `comment` | `#507868` | ![](https://placehold.co/20x20/507868/507868) | `#3d5c48` | ![](https://placehold.co/20x20/3d5c48/3d5c48) |
| 🌿 **Green** (keyword) | `green` | `#007838` | ![](https://placehold.co/20x20/007838/007838) | `#00f06a` | ![](https://placehold.co/20x20/00f06a/00f06a) |
| 🟡 Gold (string) | `gold` | `#7a5c00` | ![](https://placehold.co/20x20/7a5c00/7a5c00) | `#ffc800` | ![](https://placehold.co/20x20/ffc800/ffc800) |
| 🔵 Blue (function) | `blue` | `#0050b8` | ![](https://placehold.co/20x20/0050b8/0050b8) | `#0fa0ff` | ![](https://placehold.co/20x20/0fa0ff/0fa0ff) |
| 🟣 Violet (type) | `violet` | `#5a14c0` | ![](https://placehold.co/20x20/5a14c0/5a14c0) | `#c070ff` | ![](https://placehold.co/20x20/c070ff/c070ff) |
| 🟠 Orange (constant) | `orange` | `#a83800` | ![](https://placehold.co/20x20/a83800/a83800) | `#ff6428` | ![](https://placehold.co/20x20/ff6428/ff6428) |
| 🩵 Teal (operator) | `teal` | `#006655` | ![](https://placehold.co/20x20/006655/006655) | `#00dcc8` | ![](https://placehold.co/20x20/00dcc8/00dcc8) |
| 🔴 Red (error) | `red` | `#c01428` | ![](https://placehold.co/20x20/c01428/c01428) | `#ff2040` | ![](https://placehold.co/20x20/ff2040/ff2040) |

---

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

## 📊 lualine theme

```lua
require("lualine").setup({
  options = { theme = "zero" },
})
```

| Mode | Color |
|---|---|
| 🟢 Normal | green |
| 🔵 Insert | blue |
| 🟣 Visual | violet |
| 🔴 Replace | red |
| 🟡 Command | gold |
| 🩵 Terminal | teal |

---


## 🔌 Supported plugins

| Plugin | Notes |
|---|---|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Full `@capture` coverage |
| [LSP Diagnostics / semantic tokens](https://github.com/neovim/neovim) | Underlines + virtual text, no bg on virtual |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 3-pane border hierarchy |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | Sidebar bg, git signs |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | Sidebar bg, git signs |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Dedicated theme file |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Green accent on selected tab |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | add/change/delete signs + line bg |
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | statusline, tabline, files, diff, indentscope, icons, pick, clue, … |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) v3 | scope = green |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Kind icons mapped to palette |
| [blink.cmp](https://github.com/Saghen/blink.cmp) | Kind icons mapped to palette |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | v2 + v3 |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) / [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | Header = green |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | Per-level colors |
| [noice.nvim](https://github.com/folke/noice.nvim) | Cmdline popup, lsp progress |
| [flash.nvim](https://github.com/folke/flash.nvim) | Label = green bg |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | v2 + v3 |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | All keyword tags |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) / [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Breakpoint = red, stopped line = gold |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager UI |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) / [headlines.nvim](https://github.com/lukas-reineke/headlines.nvim) | Headings = green |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | File panel, diff regions |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Symbol sidebar |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic) / [barbecue.nvim](https://github.com/utilyre/barbecue.nvim) | Breadcrumb |

---

## 💻 Terminal emulator themes

Dark and light theme files are provided for the most common terminal emulators under [`extras/`](extras/).

| Terminal | Files | Setup guide |
|---|---|---|
| [Alacritty](https://alacritty.org) | `zero-dark.toml` / `zero-light.toml` | [extras/alacritty/README.md](extras/alacritty/README.md) |
| [foot](https://codeberg.org/dnkl/foot) | `zero-dark.ini` / `zero-light.ini` | [extras/foot/README.md](extras/foot/README.md) |
| [Ghostty](https://ghostty.org) | `zero-dark` / `zero-light` | [extras/ghostty/README.md](extras/ghostty/README.md) |
| [iTerm2](https://iterm2.com) | `zero-dark.itermcolors` / `zero-light.itermcolors` | [extras/iterm/README.md](extras/iterm/README.md) |
| [Kitty](https://sw.kovidgoyal.net/kitty) | `zero-dark.conf` / `zero-light.conf` | [extras/kitty/README.md](extras/kitty/README.md) |
| [WezTerm](https://wezfurlong.org/wezterm) | `zero-dark.toml` / `zero-light.toml` | [extras/wezterm/README.md](extras/wezterm/README.md) |
| [Windows Terminal](https://aka.ms/terminal) | `zero-dark.json` / `zero-light.json` | [extras/windows_terminal/README.md](extras/windows_terminal/README.md) |

---

## 📄 License

MIT — see [LICENSE](LICENSE).
