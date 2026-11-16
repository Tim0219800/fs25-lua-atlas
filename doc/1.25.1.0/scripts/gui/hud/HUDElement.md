# gui/hud/HUDElement.lua

*[Version française](../../../fr/scripts/gui/hud/HUDElement.md)*

Source: `dataS/scripts/gui/hud/HUDElement.lua` — FS25 1.25.1.0

✍ Base class of the lightweight HUD widgets. It wraps one Overlay and keeps a list of child HUDElements, so moving, scaling, drawing and deleting an element acts on its whole subtree. It also holds a rotation pivot and a TweenSequence animation that is stepped in update. Most HUD classes (HUDDisplayElement, HUDFrameElement, InputGlyphElement...) derive from it. Client-side only.

- **HUDElement** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `HUDElement.new(overlay: table, parentHudElement: table?, customMt: table?) → table` | 22 | ✍ Creates an element around the given overlay with an empty child list, zero pivot and no animation. If a parent is given the new element is attached to it through addChild. |
| `HUDElement:delete()` | 47 | ✍ Deletes the overlay (releasing its engine handle), detaches the element from its parent, then recursively deletes every child. Do not use the element afterwards. |
| `HUDElement:addChild(childHudElement: table)` | 69 | ✍ Appends a child to the draw list. If the child already belongs to another parent it is removed from it first; adding an existing child again does nothing. |
| `HUDElement:removeChild(childHudElement: table)` | 91 | ✍ Removes the given child from this element's list and clears its parent reference, only if this element really is its parent. The child is not deleted. |
| `HUDElement:setPosition(x: any, y: any)` | 106 | ✍ Moves the overlay to an absolute screen position (nil keeps the current coordinate) and shifts every direct child by the same delta so the group moves together. |
| `HUDElement:setRotation(rotation: number, centerX: number?, centerY: number?)` | 132 | ✍ Rotates the overlay by an angle in radians around the given center, or around the element's stored pivot when no center is passed. Children are not rotated. |
| `HUDElement:setRotationPivot(pivotX: number, pivotY: number)` | 140 | ✍ Stores the rotation pivot offset and also records it as the default pivot used again after scaling or dimension reset. Passing nil keeps the previous default. |
| `HUDElement:getRotationPivot() → number, number` | 149 | ✍ Returns the current pivot offset (x, y) in screen space, which may be scaled relative to the default. |
| `HUDElement:getPosition() → number, number` | 157 | ✍ Returns the overlay's x and y screen position. |
| `HUDElement:setScale(scaleWidth: number, scaleHeight: number)` | 166 | ✍ Scales the overlay and proportionally repositions and rescales every direct child around this element's position, then rescales the pivot from the default pivot. |
| `HUDElement:getScale() → Width, Height` | 197 | ✍ Returns the overlay's width and height scale factors. |
| `HUDElement:setAlignment(vertical: integer, horizontal: integer)` | 206 | ✍ Forwards vertical and horizontal alignment constants (Overlay.ALIGN_*) to the overlay, which decides how the position is interpreted. |
| `HUDElement:setVisible(isVisible: any)` | 212 | ✍ Sets the overlay's visible flag if the overlay still exists. Children keep their own flag but are skipped by draw when the parent is hidden. |
| `HUDElement:getVisible()` | 220 | ✍ Returns the overlay's visible flag. |
| `HUDElement:getColor() → number, number, number, number` | 230 | ✍ Returns the overlay's r, g, b, a color components. |
| `HUDElement:getAlpha() → number` | 237 | ✍ Returns the overlay's alpha value. |
| `HUDElement:getWidth()` | 243 | ✍ Returns the overlay width in screen units. |
| `HUDElement:getHeight()` | 249 | ✍ Returns the overlay height in screen units. |
| `HUDElement:setDimension(width: any, height: any)` | 256 | ✍ Sets overlay width and height; passing nil for one of them leaves it unchanged. Children are not touched. |
| `HUDElement:getDimension() → number, number` | 264 | ✍ Returns the overlay width and height. |
| `HUDElement:resetDimensions()` | 271 | ✍ Asks the overlay to restore its default dimensions and scale, and resets the pivot to the stored default pivot. |
| `HUDElement:setColor(r: any, g: any, b: any, a: any)` | 280 | ✍ Sets the overlay color only; children keep their own colors. |
| `HUDElement:setAlpha(alpha: any)` | 286 | ✍ Changes only the overlay's alpha channel, leaving RGB untouched. |
| `HUDElement:setImage(imageFilename: any)` | 292 | ✍ Replaces the overlay's image file. |
| `HUDElement:setUVs(uvs: any)` | 298 | ✍ Sets the overlay's texture coordinates. |
| `HUDElement:setSliceId(sliceId: any)` | 304 | ✍ Assigns a GUI slice id to the overlay. |
| `HUDElement:update(dt: any)` | 310 | ✍ Advances the element's animation by dt milliseconds while it has not finished. Subclasses extend it; children are not updated here. |
| `HUDElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 318 | ✍ Renders the overlay (with an optional clip rectangle) and then each child in insertion order, only when the overlay is visible. |
| `HUDElement:scalePixelToScreenVector(vector2D: table)` | 335 | ✍ Converts a two-value pixel vector (reference resolution) to screen units using the overlay scale, the aspect scale and g_referenceScreenWidth/Height. Returns two numbers. |
| `HUDElement:scalePixelToScreenHeight(height: number)` | 349 | ✍ Converts a vertical pixel value at reference resolution to screen units, including overlay scale and aspect scale. |
| `HUDElement:scalePixelToScreenWidth(width: number)` | 356 | ✍ Converts a horizontal pixel value at reference resolution to screen units, including overlay scale and aspect scale. |
| `HUDElement:normalizeUVPivot(uvPivot: table, size: table, uvs: table)` | 364 | ✍ Converts a pivot given in texture pixels into a local screen-space pivot, using the element size ratio to the UV rectangle. Note: the doc comment omits the size parameter. |
