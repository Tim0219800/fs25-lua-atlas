# gui/hud/POIInfoDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/POIInfoDisplay.md)*

Source: `dataS/scripts/gui/hud/POIInfoDisplay.lua` — FS25 1.25.1.0

✍ Small HUD label at the top-left corner (extends HUDDisplayElement) that shows one line of text, used for points-of-interest info. It draws a rounded background sized to the text width plus offsets. text, offsets and applyValues are set elsewhere (UNVERIFIED). Client-side only.

- **POIInfoDisplay** inherits from `HUDDisplayElement` (l.22)

## Functions

| Function | Line | Description |
|---|---|---|
| `POIInfoDisplay:draw()` | 47 | ✍ Draws a rounded filled rectangle fitted to the text width plus left/right offsets, then the text, then the parent draw. Does nothing when the text is empty. |
| `POIInfoDisplay:setScale(uiScale: number)` | 76 | ✍ Applies the scale through the parent, repositions at the scaled background position and calls applyValues with the scale. |
| `POIInfoDisplay.getBackgroundPosition(uiScale: any)` | 107 | ✍ Returns the base position: configured X offset times scale, and Y measured from the top of the screen minus the scaled height. |
| `POIInfoDisplay.createBackground()` | 118 | ✍ Creates an image-less overlay with the base position and configured size, used as the positioning frame. |
