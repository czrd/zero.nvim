# zero.nvim — Kitty

Two theme files: `zero-dark.conf` and `zero-light.conf`.

## Setup

### Option A — include directive

Add to your `~/.config/kitty/kitty.conf`:

```
include /path/to/zero.nvim/extras/kitty/zero-dark.conf
```

Switch to light:

```
include /path/to/zero.nvim/extras/kitty/zero-light.conf
```

### Option B — kitty themes (Kitty 0.23.1+)

Copy the file to kitty's themes directory:

```sh
cp zero-dark.conf ~/.config/kitty/themes/zero-dark.conf
```

Then select it:

```sh
kitty +kitten themes zero-dark
```

## Live reload

```sh
kill -SIGUSR1 $(pgrep kitty)
```
