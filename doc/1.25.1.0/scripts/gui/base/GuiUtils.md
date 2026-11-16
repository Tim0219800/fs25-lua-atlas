# gui/base/GuiUtils.lua

*[Version française](../../../fr/scripts/gui/base/GuiUtils.md)*

Source: `dataS/scripts/gui/base/GuiUtils.lua` — FS25 1.25.1.0

✍ Static helpers that convert GUI XML attribute strings into numbers: normalized sizes (px / dp units), colors, UV rectangles, plus a point/overlay hit test. Used by the GUI layer when reading layouts and texture configs. Some functions called from other files (for example GuiUtils.rotateUVs) are not defined in this file.

- **GuiUtils** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `GuiUtils.getNormalizedValues(data: str, refSize: refSize, defaultValue: defaultValue) → array` | 18 | ✍ Splits a space-separated string (or reads a table) into numbers and normalizes them against a reference size; handles `px` and `dp` suffixes and alternates X/Y references. Missing entries are repeated from the default's length, CSS-style; returns the default if input is nil. |
| `GuiUtils.getColorArray(colorStr: str, defaultValue: defaultValue) → array` | 176 | ✍ Parses a string into a 4-number {r, g, b, a} array through `string.getVector(str, 4)`, or returns the given default when parsing fails. |
| `GuiUtils.getColorGradientArray(colorStr: str, defaultValue: defaultValue) → array` | 185 | ✍ Parses a string into a vector and accepts it only if it has 4 numbers (one color) or 16 numbers (four colors, one per corner); otherwise returns the default. |
| `GuiUtils.getUVs(str: str, ref: ref, defaultValue: defaultValue, rotation: any) → array` | 230 | ✍ Converts a string "x y sizeX sizeY" (pixels) into the 8-value UV array, using the reference texture size (default 1024x1024), flipping V. Optionally rotates the result via `GuiUtils.rotateUVs` (not in this file, UNVERIFIED); logs a dev error if unreadable. |
| `GuiUtils.checkOverlayOverlap(posX: posX, posY: posY, overlayX: overlayX, overlayY: overlayY, overlaySizeX: overlaySizeX, overlaySizeY: overlaySizeY, hotspot: hotspot)` | 268 | ✍ Returns true if a point lies inside the overlay rectangle, which must have positive size. With a 4-number hotspot table the rectangle bounds are shifted by those offsets. |
