# zero.nvim — Windows Terminal

Two theme files: `zero-dark.json` and `zero-light.json`.

## Setup

1. Open Windows Terminal → **Settings** → **Open JSON file** (bottom-left gear icon)
2. Find the `"schemes"` array (create it if absent)
3. Paste the contents of `zero-dark.json` and/or `zero-light.json` into the array:

```json
{
  "schemes": [
    {
      "name": "zero-dark",
      "background": "#141519",
      ...
    },
    {
      "name": "zero-light",
      "background": "#f7f8fa",
      ...
    }
  ]
}
```

4. In your profile's `"colorScheme"` field, set:

```json
"colorScheme": "zero-dark"
```

or for light mode:

```json
"colorScheme": "zero-light"
```

## Automatic dark/light switching

Windows Terminal (1.16+) supports appearance-based scheme switching:

```json
{
  "profiles": {
    "defaults": {
      "colorScheme": {
        "dark": "zero-dark",
        "light": "zero-light"
      }
    }
  }
}
```
