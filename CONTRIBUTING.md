# Contributing to zero.nvim

Thank you for taking the time to contribute! This document covers everything
you need to know before opening a PR.

---

## Table of Contents

1. [Ways to Contribute](#ways-to-contribute)
2. [Development Setup](#development-setup)
3. [Code Style](#code-style)
4. [Architecture Quick Reference](#architecture-quick-reference)
5. [Types of Changes](#types-of-changes)
6. [Submitting a Pull Request](#submitting-a-pull-request)
7. [Reporting Bugs](#reporting-bugs)

---

## Ways to Contribute

- **Bug reports** — wrong colors, missing highlight groups, contrast issues
- **Plugin support** — add highlight groups for a plugin not yet covered
- **Palette improvements** — better contrast, more coherent color choices
- **Terminal themes** — new terminal emulator export format
- **Documentation** — README, AGENTS.md, code comments

---

## Development Setup

### Requirements

| Tool | Version | Install |
|---|---|---|
| Neovim | ≥ 0.9 | [neovim.io](https://neovim.io) |
| Lua | ≥ 5.1 | system package manager |
| stylua | latest | `cargo install stylua` |

### Load the plugin locally

```lua
-- lazy.nvim
{
  dir = "/path/to/zero.nvim",
  name = "zero.nvim",
  priority = 1000,
  config = function()
    require("zero").setup({})
    vim.cmd("colorscheme zero")
  end,
}
```

### Activate the pre-commit hook

```sh
git init
git config core.hooksPath .githooks
```

The hook runs `stylua --check` on staged `.lua` files and blocks the commit if
any file is unformatted.

---

## Code Style

All Lua files are formatted with [stylua](https://github.com/JohnnyMorganz/StyLua).
Config lives in `.stylua.toml`. Before committing:

```sh
stylua lua/ colors/
```

To check without modifying files:

```sh
stylua --check lua/ colors/
```

**Key conventions:**

- Indent: 2 spaces
- Max line width: 120 characters
- Quotes: double (`"`)
- No trailing whitespace

---

## Architecture Quick Reference

See [AGENTS.md](AGENTS.md) for the full guide. Short version:

| File | What to change |
|---|---|
| `lua/zero/palette.lua` | color values (HEX only) |
| `lua/zero/theme.lua` | derived keys (`transparent`, `dim_inactive`) |
| `lua/zero/groups/editor.lua` | core Neovim UI groups |
| `lua/zero/groups/syntax.lua` | legacy `vim syntax` groups |
| `lua/zero/groups/treesitter.lua` | `@capture` and `@lsp.type.*` groups |
| `lua/zero/groups/lsp.lua` | Diagnostic and LSP groups |
| `lua/zero/groups/plugins/<name>.lua` | plugin-specific groups |
| `lua/zero/groups/init.lua` | `plugin_map` (auto-detection keys) |
| `lua/lualine/themes/zero.lua` | lualine mode colors |
| `extras/*/` | terminal emulator themes |

**Key rule:** group files call `M.get(t, opts)` and return a plain table.
They must not call `vim.api.nvim_set_hl` directly.

---

## Types of Changes

### Changing a color value

Edit the HEX in `lua/zero/palette.lua` only. Do not touch group files.
Both `dark` and `light` tables must be updated consistently.

### Adding a new plugin

1. Create `lua/zero/groups/plugins/<snake_case_name>.lua`:

   ```lua
   local M = {}
   function M.get(t, _opts)
     return {
       MyPluginNormal = { fg = t.fg, bg = t.bg_float },
     }
   end
   return M
   ```

2. Register in `lua/zero/groups/init.lua` → `plugin_map`:

   ```lua
   ["plugin-name"]      = "zero.groups.plugins.<name>",
   ["plugin-name.nvim"] = "zero.groups.plugins.<name>",
   ```

3. Add a linked row to the **Supported plugins** table in `README.md`.

### Adding a terminal emulator theme

1. Create `extras/<terminal>/zero-dark.<ext>` and `zero-light.<ext>`
2. Create `extras/<terminal>/README.md` with setup instructions
3. Reference the new entry in `README.md`'s terminal section (if present)

### Modifying the lualine theme

Edit `lua/lualine/themes/zero.lua`. Mode-to-color mapping:
`normal=green`, `insert=blue`, `visual=violet`, `replace=red`, `command=gold`, `terminal=teal`.

---

## Submitting a Pull Request

Before opening a PR, verify:

- [ ] `stylua --check lua/ colors/` passes
- [ ] Lua syntax check passes:
  ```sh
  for f in $(find lua colors -name "*.lua"); do
    result=$(lua -e "local fn,err=loadfile('$f'); if err then print('ERROR: '..err) end" 2>&1)
    [ -n "$result" ] && echo "$result"
  done
  ```
- [ ] Tested in **dark** mode (`:colorscheme zero`)
- [ ] Tested in **light** mode (`set background=light`)
- [ ] Tested with `transparent = true` if background groups were changed
- [ ] `README.md` updated if a plugin or option was added
- [ ] `AGENTS.md` updated if the architecture or color roles changed

Use the PR template — it has the full checklist.

---

## Reporting Bugs

Use the **Bug report** issue template. The most helpful information:

- Neovim version (`:version`)
- Dark or light mode
- Terminal and whether `termguicolors` is set
- The specific highlight group that looks wrong (`:hi GroupName`)
- A screenshot if possible

For contrast issues, include the two colors and the measured ratio.
