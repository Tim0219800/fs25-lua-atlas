# gui/elements/ClearElement.lua

*[Version française](../../../fr/scripts/gui/elements/ClearElement.md)*

Source: `dataS/scripts/gui/elements/ClearElement.lua` — FS25 1.25.1.0

✍ GUI element that punches a transparent hole in what was already drawn, by calling the engine function `clearOverlayArea` over its own rectangle before drawing its children. Derived from GuiElement; uses a "clear" overlay for rotation and an optional offset. It only takes focus when it has children that can all take focus. Client-side GUI.

- **ClearElement** inherits from `GuiElement` (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `ClearElement.new(target: any, custom_mt: any)` | 23 | ✍ Constructor with zero offset and focused offset and an empty overlay table. Note: the fallback metatable is `BitmapElement_mt`, which is not defined in this file, so it is presumably nil when no custom_mt is given. |
| `ClearElement:delete()` | 34 | ✍ Releases the overlay then runs the parent delete. |
| `ClearElement:loadFromXML(xmlFile: any, key: any)` | 42 | ✍ Loads the "clear" overlay and the `offset` and `focusedOffset` attributes (screen-normalized values) from the XML node. |
| `ClearElement:loadProfile(profile: any, applyProfile: any)` | 52 | ✍ Same as the XML loader but from a GUI profile; focusedOffset defaults to the normal offset when absent. |
| `ClearElement:copyAttributes(src: any)` | 62 | ✍ Copies the overlay, offset and focusedOffset from a source element. |
| `ClearElement:getOffset()` | 72 | ✍ Returns the x/y offset to use for drawing. Note: the state test ends with `or GuiOverlay.STATE_HIGHLIGHTED` without comparing, so it is always true and the focused offset is always returned. |
| `ClearElement:setImageRotation(rotation: number)` | 86 | ✍ Sets the rotation of the clear overlay, in radians. |
| `ClearElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 92 | ✍ Clears the screen area of the element (position plus offset, size, rotation around its center) with `clearOverlayArea`, then draws the children through the parent. |
| `ClearElement:canReceiveFocus()` | 102 | ✍ Returns false if the element is hidden or has no children, and true only if every child can receive focus. |
| `ClearElement:getFocusTarget()` | 117 | ✍ Returns the first child element as focus target, or the element itself when it has no children. |
