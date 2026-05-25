# zero.nvim — Ghostty

Two theme files: `zero-dark` and `zero-light` (no extension, as Ghostty requires).

## Setup

1. Copy the theme file to Ghostty's themes directory:

```sh
cp zero-dark ~/.config/ghostty/themes/zero-dark
cp zero-light ~/.config/ghostty/themes/zero-light
```

2. Reference it in `~/.config/ghostty/config`:

```
theme = zero-dark
```

Switch to light:

```
theme = zero-light
```

## Dynamic dark/light (Ghostty 1.1+)

```
theme = dark:zero-dark,light:zero-light
```

Ghostty will automatically switch based on the system appearance.
