# gui/base/Overlay.lua

*[Version française](../../../fr/scripts/gui/base/Overlay.md)*

Source: `dataS/scripts/gui/base/Overlay.lua` — FS25 1.25.1.0

✍ Basic 2D image overlay: wraps an engine image overlay handle with position, size, alignment, UVs, color, rotation, scale and visibility, and renders it with optional clipping. Used throughout the HUD and menus, and created by `OverlayManager` from texture slices. Constants such as `Overlay.DEFAULT_UVS` and the ALIGN_* values are defined elsewhere (UNVERIFIED). Client-side only.

- **Overlay** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Overlay.new(overlayFilename: string?, x: number, y: number, width: number, height: number, customMt: table?) → Overlay` | 39 | ✍ Creates an overlay at x, y with the given size, loading the image file if a filename is given (otherwise the engine id stays 0 and nothing is drawn). Defaults: white, bottom-left alignment, no rotation, full UVs. |
| `Overlay:delete()` | 87 | ✍ Releases the engine image handle if one exists. The overlay must not be rendered afterwards. |
| `Overlay:setColor(r: number?, g: number?, b: number?, a: number?)` | 101 | ✍ Sets the RGBA tint multiplied with the texture; nil channels keep their current value, and the engine is only called when something changes. |
| `Overlay:setUVs(uvs: array)` | 117 | ✍ Stores and applies 8 UV values defining the displayed texture area; ignored when the overlay has no image. |
| `Overlay:setSliceId(sliceId: string)` | 127 | ✍ Looks up the slice "prefix.id" in `g_overlayManager` and applies its UVs; does nothing if the slice is unknown or there is no image. Size is not changed. |
| `Overlay:setPosition(x: number?, y: number?)` | 142 | ✍ Sets the screen position (0 to 1); nil keeps the current coordinate. Alignment offsets are applied separately at render time. |
| `Overlay:getPosition() → number, number` | 151 | ✍ Returns the stored x and y position, without alignment offsets. |
| `Overlay:setDimension(width: number?, height: number?)` | 160 | ✍ Sets width and height (nil keeps the current one) and recomputes the alignment offsets. Does not change the scale factors. |
| `Overlay:resetDimensions()` | 168 | ✍ Restores the width and height given at construction and resets the scale to 1. |
| `Overlay:setInvertX(invertX: boolean)` | 177 | ✍ Flips the image horizontally by swapping UV pairs, or restores normal UVs. Only acts if the state changes and an image exists. |
| `Overlay:setRotation(rotation: number, centerX: number, centerY: number)` | 195 | ✍ Sets rotation in radians around a pivot given as an offset from the overlay position (screen units); the engine is only called on change. |
| `Overlay:setScale(scaleWidth: number, scaleHeight: number)` | 211 | ✍ Sets the size as default size times the given factors, stores the factors and refreshes the alignment offsets. |
| `Overlay:getScale() → number, number` | 224 | ✍ Returns the current width and height scale factors. |
| `Overlay:render(clipX1: number?, clipY1: number?, clipX2: number?, clipY2: number?)` | 234 | ✍ Draws the overlay if visible, with an image and alpha above 0. With clip bounds it renders a clipped part via temporary UVs (`Overlay.getClippingUVs`, not in this file, UNVERIFIED) and restores them; also draws debug frames in debug builds. |
| `Overlay:setAlignment(vertical: integer?, horizontal: integer?)` | 335 | ✍ Sets vertical (bottom, middle, top) and horizontal (left, center, right) alignment and computes the draw offsets from the current size; nil values fall back to bottom/left. |
| `Overlay:setIsVisible(visible: boolean?)` | 358 | ✍ Shows or hides the overlay; hidden overlays skip drawing in `render`. |
| `Overlay:getIsVisible() → boolean` | 366 | ✍ Returns whether the overlay is currently set visible. |
| `Overlay:setImage(overlayFilename: string)` | 375 | ✍ Switches to another image file: deletes the old engine handle and creates a new one when the filename differs. Previously set UVs are not reapplied here. |
