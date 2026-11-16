# gui/base/StatusBar.lua

*[Version française](../../../fr/scripts/gui/base/StatusBar.md)*

Source: `dataS/scripts/gui/base/StatusBar.lua` — FS25 1.25.1.0

✍ Simple horizontal progress bar drawn from plain-colour overlays: a background, a value fill and an optional marker. The value is a fraction between 0 and 1. Pure rendering helper with no event handling.

- **StatusBar** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `StatusBar.new(x: any, y: any, width: any, height: any, bgColor: any, valueColor: any, markerSize: any, custom_mt: any)` | 16 | ✍ Creates a bar at x, y with the given size, background colour and value colour (colour tables are unpacked). A markerSize table {w, h} adds a marker overlay centred on the fill edge. Starts at value 0. |
| `StatusBar:delete()` | 50 | ✍ Deletes the background, value and marker overlays that exist. |
| `StatusBar:setDisabled(isDisabled: any)` | 64 | ✍ Sets the disabled flag; while disabled only the background is rendered. |
| `StatusBar:setPosition(x: any, y: any)` | 70 | ✍ Moves the bar and its overlays to x, y, keeping the marker vertically centred on the bar. Note: the marker goes to the bar's left edge, not the current value position, until setValue is called again. |
| `StatusBar:setColor(r: any, g: any, b: any, a: any)` | 86 | ✍ Sets the colour of the value fill and of the marker; the background keeps its colour. |
| `StatusBar:setValue(newValue: any)` | 97 | ✍ Stores the value clamped to 0..1 and resizes the fill and moves the marker. Note: the overlay width and marker use the unclamped newValue, so out-of-range inputs draw outside the bar. |
| `StatusBar:render()` | 108 | ✍ Draws the background, then the fill and marker unless the bar is disabled. |
