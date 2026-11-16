# gui/base/RoundStatusBar.lua

*[Version française](../../../fr/scripts/gui/base/RoundStatusBar.md)*

Source: `dataS/scripts/gui/base/RoundStatusBar.lua` — FS25 1.25.1.0

✍ Circular (ring) progress bar built from several slice overlays: two half-ring backgrounds, two half-ring value overlays rotated according to the value, an optional front overlay and an optional marker at the progress tip. Overlays are created through `g_overlayManager`. Client-side HUD element.

- **RoundStatusBar** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `RoundStatusBar.new(frontSliceId: any, valueSliceId: any, markerSliceId: any, x: any, y: any, width: any, height: any, valueWidth: any, valueHeight: any, radius: any, color: any, bgColor: any, valueColor: any, markerSize: any, custom_mt: any)` | 17 | ✍ Creates the bar from slice ids, position, sizes, radius, and colors, then sets the value to 0. Note: `overlayFront` is never assigned (the front overlay is stored as `overlayBackground`) and the marker uses the value slice id, not the marker slice id. |
| `RoundStatusBar:delete()` | 61 | ✍ Deletes the front, background, value and marker overlays that exist. Note: because the front overlay is stored as `overlayBackground`, it is never deleted. |
| `RoundStatusBar:setPosition(x: any, y: any)` | 84 | ✍ Moves the bar (nil keeps a coordinate) and repositions the ring overlays with their centering offset and the front overlay if `overlayFront` exists. The marker is not moved here. |
| `RoundStatusBar:setValue(newValue: any)` | 99 | ✍ Clamps the value to 0..1, rotates the value and background half rings accordingly and places the marker on the ellipse defined by `radius`. |
| `RoundStatusBar:render()` | 113 | ✍ Draws the layers in order, depending on whether the value is above one half: backgrounds, value halves, then the front overlay and the marker when present. |
