# zero.nvim — foot

Two theme files: `zero-dark.ini` and `zero-light.ini`.

## Setup

Add an `include` directive to your `~/.config/foot/foot.ini`:

```ini
include=/path/to/zero.nvim/extras/foot/zero-dark.ini
```

Switch to light:

```ini
include=/path/to/zero.nvim/extras/foot/zero-light.ini
```

## Live reload

foot reloads its config when it receives `SIGHUP`:

```sh
pkill -SIGHUP foot
```
