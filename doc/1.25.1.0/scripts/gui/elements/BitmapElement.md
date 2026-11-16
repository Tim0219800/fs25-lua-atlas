# gui/elements/BitmapElement.lua

*[Version française](../../../fr/scripts/gui/elements/BitmapElement.md)*

Source: `dataS/scripts/gui/elements/BitmapElement.lua` — FS25 1.25.1.0

✍ Base GUI element that displays an image overlay (layer "image"), derived from GuiElement. Supports per-state offsets (focused, selected, highlighted, pressed), X/Y flipping, texture slices from `g_overlayManager`, an optional mask rectangle, color/UV/rotation setters, and focus passthrough to children. Parent of many other elements. Client-side GUI.

- **BitmapElement** inherits from `GuiElement` (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `BitmapElement.new(target: any, custom_mt: any)` | 23 | ✍ Constructor with a default image size of 2048x2048, zero offset, an empty overlay table and no mask. |
| `BitmapElement:delete()` | 38 | ✍ Frees the overlay then runs the parent delete. |
| `BitmapElement:loadFromXML(xmlFile: any, key: any)` | 46 | ✍ Loads imageSize, the overlay, the offsets for each state, invertX/invertY and the mask position/size from the XML node, then creates the overlay. Note: invertY is read from the key `#invert>`, which looks like a typo, so `#invertY` is likely ignored in XML. |
| `BitmapElement:loadProfile(profile: any, applyProfile: any)` | 69 | ✍ Same attributes as the XML loader but from a GUI profile; recreates the overlay if its filename or preview filename changed. |
| `BitmapElement:copyAttributes(src: any)` | 97 | ✍ Copies image size, overlay, offsets (only those defined on the source), mask data and invert flags from a source element. |
| `BitmapElement:setAlpha(alpha: any)` | 126 | ✍ Sets the element alpha through the parent and mirrors it into the overlay alpha. |
| `BitmapElement:getOffset()` | 135 | ✍ Returns the x/y draw offset for the current overlay state (focused, selected, highlighted or pressed when defined), otherwise the base offset. |
| `BitmapElement:getOverlayMaskData(xOffset: any, yOffset: any)` | 158 | ✍ Returns the mask position x/y and mask size x/y, each nil when no mask is configured. The offset parameters are unused. |
| `BitmapElement:setIsWebOverlay(isWebOverlay: any)` | 169 | ✍ Flags the overlay as a web overlay (remote image) or not. |
| `BitmapElement:setImageFilename(filename: any)` | 175 | ✍ Recreates the overlay for the given image file name. |
| `BitmapElement:setImageColor(state: state, r: number, g: number, b: number, a: number)` | 187 | ✍ Sets the RGBA color of the overlay for a given state (nil = default color); nil channels keep their previous value. |
| `BitmapElement:setImageUVs(state: any, v0: any, u0: any, v1: any, u1: any, v2: any, u2: any, v3: any, u3: any)` | 197 | ✍ Sets the four UV corner pairs for a state (default: the current state), nil values keep the old ones, then applies X/Y inversion if enabled. |
| `BitmapElement:setImageRotation(rotation: number)` | 221 | ✍ Sets the overlay rotation in radians. |
| `BitmapElement:setImageSlice(state: string, sliceId: string)` | 228 | ✍ Looks up a texture slice by id in `g_overlayManager`; if found, applies its UVs and file name and stores the slice id. Does nothing for an unknown id. |
| `BitmapElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 243 | ✍ Renders the overlay at the absolute position plus state offset, with clipping and optional mask, then draws children through the parent. |
| `BitmapElement:canReceiveFocus()` | 255 | ✍ Returns false if hidden or childless, and true only when every child can receive focus. |
| `BitmapElement:getFocusTarget()` | 272 | ✍ Returns the first child as focus target, or the element itself when it has none. |
