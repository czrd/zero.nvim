# zero.nvim — WezTerm

Two theme files: `zero-dark.toml` and `zero-light.toml`.

## Setup

### Option A — load_scheme (WezTerm nightly / 20240127+)

```lua
-- wezterm.lua
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.colors = wezterm.color.load_scheme(
  "/path/to/zero.nvim/extras/wezterm/zero-dark.toml"
)

return config
```

### Option B — inline colors table

Open `zero-dark.toml` and copy the values into your `config.colors` table manually.

## Dynamic switching (dark/light)

```lua
-- wezterm.lua
local function get_scheme()
  -- match the system appearance
  local appearance = wezterm.gui.get_appearance()
  if appearance:find("Dark") then
    return wezterm.color.load_scheme(
      "/path/to/zero.nvim/extras/wezterm/zero-dark.toml"
    )
  else
    return wezterm.color.load_scheme(
      "/path/to/zero.nvim/extras/wezterm/zero-light.toml"
    )
  end
end

config.colors = get_scheme()
```
