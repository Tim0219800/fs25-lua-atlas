# gui/hud/InfoDisplayKeyValueBoxMobile.lua

*[Version française](../../../fr/scripts/gui/hud/InfoDisplayKeyValueBoxMobile.md)*

Source: `dataS/scripts/gui/hud/InfoDisplayKeyValueBoxMobile.lua` — FS25 1.25.1.0

✍ Mobile variant of the key/value info box (extends InfoDisplayBox). It keeps a pool of reusable line tables (cached/active) and draws a rounded translucent black panel with bold key text on the left and value text on the right, truncated with an ellipsis. It must be re-armed every frame with showNextFrame. Client-side only.

- **InfoDisplayKeyValueBoxMobile** inherits from `InfoDisplayBox` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `InfoDisplayKeyValueBoxMobile.new(infoDisplay: any, uiScale: any)` | 16 | ✍ Creates the box with empty line pools and a vertical offset computed from 160 reference pixels scaled to the current screen height. |
| `InfoDisplayKeyValueBoxMobile:canDraw()` | 35 | ✍ Returns true only if showNextFrame was called since the last draw. |
| `InfoDisplayKeyValueBoxMobile:getDisplayHeight() → number` | 42 | ✍ Returns the panel height for the active lines (margins plus rows) plus a small label offset. |
| `InfoDisplayKeyValueBoxMobile:draw(posX: any, posY: any)` | 48 | ✍ Draws the rounded panel right-aligned inside the safe-frame inset, then the active lines from bottom to top with an optional highlight color. Clears the show-next-frame flag. |
| `InfoDisplayKeyValueBoxMobile:clear()` | 103 | ✍ Moves all active lines back into the cache pool for reuse. |
| `InfoDisplayKeyValueBoxMobile:setTitle(title: any)` | 112 | ✍ Empty function: the mobile box ignores titles. |
| `InfoDisplayKeyValueBoxMobile:textSizeToFit(baseSize: any, text: any, maxWidth: any, minSize: any)` | 117 | ✍ Shrinks the text size in 5 percent steps until the text fits on one line within maxWidth, never below minSize (default half the base size), and returns the size. Not called in this file. |
| `InfoDisplayKeyValueBoxMobile:addLine(key: any, value: any, accentuate: any, accentuateColor: any)` | 145 | ✍ Appends a key/value line, reusing a cached table when possible; a missing value becomes an empty string. The accentuate flag and optional color highlight the key. |
| `InfoDisplayKeyValueBoxMobile:showNextFrame()` | 166 | ✍ Marks the box to be drawn on the next frame. |
| `InfoDisplayKeyValueBoxMobile:setScale(uiScale: any)` | 176 | ✍ Stores the UI scale and recomputes scaled values. |
| `InfoDisplayKeyValueBoxMobile:storeScaledValues()` | 183 | ✍ Converts reference-pixel constants (box width 500, rows 450x40, margins, text offsets) and HUDElement.TEXT_SIZE.DEFAULT_TEXT_MOBILE to screen units for the current scale. |
