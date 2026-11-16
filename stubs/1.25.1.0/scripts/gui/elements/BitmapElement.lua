---@meta
-- FS25 1.25.1.0 : gui/elements/BitmapElement.lua (generated stub, FS25 Lua Atlas)

--- Base GUI element that displays an image overlay (layer "image"), derived from GuiElement. Supports per-state offsets (focused, selected, highlighted, pressed), X/Y flipping, texture slices from `g_overlayManager`, an optional mask rectangle, color/UV/rotation setters, and focus passthrough to children. Parent of many other elements. Client-side GUI.
---@class BitmapElement : GuiElement
BitmapElement = {}

--- Constructor with a default image size of 2048x2048, zero offset, an empty overlay table and no mask.
---@param target any
---@param custom_mt any
function BitmapElement.new(target, custom_mt) end

--- Frees the overlay then runs the parent delete.
function BitmapElement:delete() end

--- Loads imageSize, the overlay, the offsets for each state, invertX/invertY and the mask position/size from the XML node, then creates the overlay. Note: invertY is read from the key `#invert>`, which looks like a typo, so `#invertY` is likely ignored in XML.
---@param xmlFile any
---@param key any
function BitmapElement:loadFromXML(xmlFile, key) end

--- Same attributes as the XML loader but from a GUI profile; recreates the overlay if its filename or preview filename changed.
---@param profile any
---@param applyProfile any
function BitmapElement:loadProfile(profile, applyProfile) end

--- Copies image size, overlay, offsets (only those defined on the source), mask data and invert flags from a source element.
---@param src any
function BitmapElement:copyAttributes(src) end

--- Sets the element alpha through the parent and mirrors it into the overlay alpha.
---@param alpha any
function BitmapElement:setAlpha(alpha) end

--- Returns the x/y draw offset for the current overlay state (focused, selected, highlighted or pressed when defined), otherwise the base offset.
function BitmapElement:getOffset() end

--- Returns the mask position x/y and mask size x/y, each nil when no mask is configured. The offset parameters are unused.
---@param xOffset any
---@param yOffset any
function BitmapElement:getOverlayMaskData(xOffset, yOffset) end

--- Flags the overlay as a web overlay (remote image) or not.
---@param isWebOverlay any
function BitmapElement:setIsWebOverlay(isWebOverlay) end

--- Recreates the overlay for the given image file name.
---@param filename any
function BitmapElement:setImageFilename(filename) end

--- Sets the RGBA color of the overlay for a given state (nil = default color); nil channels keep their previous value.
---@param state state
---@param r number
---@param g number
---@param b number
---@param a number
function BitmapElement:setImageColor(state, r, g, b, a) end

--- Sets the four UV corner pairs for a state (default: the current state), nil values keep the old ones, then applies X/Y inversion if enabled.
---@param state any
---@param v0 any
---@param u0 any
---@param v1 any
---@param u1 any
---@param v2 any
---@param u2 any
---@param v3 any
---@param u3 any
function BitmapElement:setImageUVs(state, v0, u0, v1, u1, v2, u2, v3, u3) end

--- Sets the overlay rotation in radians.
---@param rotation number
function BitmapElement:setImageRotation(rotation) end

--- Looks up a texture slice by id in `g_overlayManager`; if found, applies its UVs and file name and stores the slice id. Does nothing for an unknown id.
---@param state string
---@param sliceId string
function BitmapElement:setImageSlice(state, sliceId) end

--- Renders the overlay at the absolute position plus state offset, with clipping and optional mask, then draws children through the parent.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function BitmapElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Returns false if hidden or childless, and true only when every child can receive focus.
function BitmapElement:canReceiveFocus() end

--- Returns the first child as focus target, or the element itself when it has none.
function BitmapElement:getFocusTarget() end
