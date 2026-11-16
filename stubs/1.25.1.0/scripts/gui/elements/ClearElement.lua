---@meta
-- FS25 1.25.1.0 : gui/elements/ClearElement.lua (generated stub, FS25 Lua Atlas)

--- GUI element that punches a transparent hole in what was already drawn, by calling the engine function `clearOverlayArea` over its own rectangle before drawing its children. Derived from GuiElement; uses a "clear" overlay for rotation and an optional offset. It only takes focus when it has children that can all take focus. Client-side GUI.
---@class ClearElement : GuiElement
ClearElement = {}

--- Constructor with zero offset and focused offset and an empty overlay table. Note: the fallback metatable is `BitmapElement_mt`, which is not defined in this file, so it is presumably nil when no custom_mt is given.
---@param target any
---@param custom_mt any
function ClearElement.new(target, custom_mt) end

--- Releases the overlay then runs the parent delete.
function ClearElement:delete() end

--- Loads the "clear" overlay and the `offset` and `focusedOffset` attributes (screen-normalized values) from the XML node.
---@param xmlFile any
---@param key any
function ClearElement:loadFromXML(xmlFile, key) end

--- Same as the XML loader but from a GUI profile; focusedOffset defaults to the normal offset when absent.
---@param profile any
---@param applyProfile any
function ClearElement:loadProfile(profile, applyProfile) end

--- Copies the overlay, offset and focusedOffset from a source element.
---@param src any
function ClearElement:copyAttributes(src) end

--- Returns the x/y offset to use for drawing. Note: the state test ends with `or GuiOverlay.STATE_HIGHLIGHTED` without comparing, so it is always true and the focused offset is always returned.
function ClearElement:getOffset() end

--- Sets the rotation of the clear overlay, in radians.
---@param rotation number
function ClearElement:setImageRotation(rotation) end

--- Clears the screen area of the element (position plus offset, size, rotation around its center) with `clearOverlayArea`, then draws the children through the parent.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function ClearElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Returns false if the element is hidden or has no children, and true only if every child can receive focus.
function ClearElement:canReceiveFocus() end

--- Returns the first child element as focus target, or the element itself when it has no children.
function ClearElement:getFocusTarget() end
