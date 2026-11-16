# gui/hud/HUDTextButtonElement.lua

*[Version française](../../../fr/scripts/gui/hud/HUDTextButtonElement.md)*

Source: `dataS/scripts/gui/hud/HUDTextButtonElement.lua` — FS25 1.25.1.0

✍ Minimal text button for the HUD. This file only defines setText, which forwards to a textDisplay member; the constructor and the code that creates that member are not in the file (UNVERIFIED). It is not derived from HUDElement here (plain Class).

- **HUDTextButtonElement** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HUDTextButtonElement:setText(text: string, textSize: number, textAlignment: integer, textColor: table, textBold: boolean)` | 63 | ✍ Forwards text, size, alignment, color and bold flag to the internal textDisplay:setText. Requires self.textDisplay to exist. |
