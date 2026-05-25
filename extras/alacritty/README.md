# zero.nvim — Alacritty

Two theme files: `zero-dark.toml` and `zero-light.toml`.

## Setup

### Option A — import (Alacritty 0.13+)

Add to your `~/.config/alacritty/alacritty.toml`:

```toml
import = [
  "/path/to/zero.nvim/extras/alacritty/zero-dark.toml"
]
```

Switch to light:

```toml
import = [
  "/path/to/zero.nvim/extras/alacritty/zero-light.toml"
]
```

### Option B — copy colors block

Copy the contents of either file directly into your `alacritty.toml` under the
`[colors]` sections.

## Live reload

Alacritty reloads the config file on write. To switch themes without restarting,
change the `import` path and save.
