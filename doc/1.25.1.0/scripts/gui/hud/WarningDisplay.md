# gui/hud/WarningDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/WarningDisplay.md)*

Source: `dataS/scripts/gui/hud/WarningDisplay.lua` — FS25 1.25.1.0

✍ HUD element (HUDDisplay subclass) drawing a vertical stack of red warning boxes with an info icon, slightly below the screen centre. Each entry of the warnings list is rendered as one rounded black box with wrapped bold text. How warnings are added to the list is UNVERIFIED (not in this file).

- **WarningDisplay** inherits from `HUDDisplay` (l.25)

## Functions

| Function | Line | Description |
|---|---|---|
| `WarningDisplay.new(customMt: any?) → any` | 32 | ✍ Creates the display with an empty warnings list and a grey semi-transparent info icon overlay. Note: the customMt argument is ignored; the class metatable is always used. |
| `WarningDisplay:storeScaledValues()` | 49 | ✍ Stores the scaled position (horizontal centre, 0.45 of the screen height), maximum text width, text size, paddings, offsets and icon size for the current UI scale. |
| `WarningDisplay:draw()` | 78 | ✍ Draws every warning in the list as a centred stack of boxes, each sized to its wrapped text and the icon, with the text alpha tied to IngameMap.alpha. Returns early when there are no warnings and restores text render state afterwards. |
