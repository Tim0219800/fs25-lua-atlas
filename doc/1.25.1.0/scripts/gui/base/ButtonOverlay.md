# gui/base/ButtonOverlay.lua

*[Version française](../../../fr/scripts/gui/base/ButtonOverlay.md)*

Source: `dataS/scripts/gui/base/ButtonOverlay.lua` — FS25 1.25.1.0

✍ Overlay helper that draws a keyboard key button (left cap, stretched middle, right cap) with text on top. Uses overlays `gui.button_left`, `gui.button_middle` and `gui.button_right` from `g_overlayManager`.

- **ButtonOverlay** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `ButtonOverlay.new(customMt: any)` | 18 | ✍ Constructor: creates the three button overlays, sets the text size and offset ratios and the default white colour. `minWidth` and `debugEnabled` start as nil. |
| `ButtonOverlay:delete()` | 41 | ✍ Deletes the three overlays and sets their references to nil. Safe to call when some are already nil. |
| `ButtonOverlay:setColor(r: number?, g: number?, b: number?, a: number?, r2: number?, g2: number?, b2: number?, a2: number?)` | 66 | ✍ Sets text colour (r,g,b,a) and optional background colour (r2..a2, defaulting to the text colour or the previous background), keeping old values for nil arguments; applies the background to all three overlays. |
| `ButtonOverlay:renderButton(buttonText: buttonText, posX: posX, posY: posY, height: height, colorText: any, clipX1: any, clipY1: any, clipX2: any, clipY2: any, customOffsetLeft: any, customButtonInputText: any)` | 112 | ✍ Draws the button background and the upper-cased key text at the given position and height, with optional clip area, left offset and grey custom text. Returns the total width; draws debug frames if UI debug is on. Note: calls `self:renderBackground`, not defined in this file (UNVERIFIED). |
| `ButtonOverlay:getButtonWidth(buttonText: any, height: any, customOffsetLeft: any, customButtonInputText: any)` | 166 | ✍ Computes the button width for a key text and height from the bold text width plus padding, custom left offset and custom text width, respecting `minWidth`. Returns the full width and the width without offset. |
