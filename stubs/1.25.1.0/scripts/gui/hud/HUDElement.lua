---@meta
-- FS25 1.25.1.0 : gui/hud/HUDElement.lua (generated stub, FS25 Lua Atlas)

--- Base class of the lightweight HUD widgets. It wraps one Overlay and keeps a list of child HUDElements, so moving, scaling, drawing and deleting an element acts on its whole subtree. It also holds a rotation pivot and a TweenSequence animation that is stepped in update. Most HUD classes (HUDDisplayElement, HUDFrameElement, InputGlyphElement...) derive from it. Client-side only.
---@class HUDElement
HUDElement = {}

--- Creates an element around the given overlay with an empty child list, zero pivot and no animation. If a parent is given the new element is attached to it through addChild.
---@param overlay table
---@param parentHudElement table?
---@param customMt table?
---@return table
function HUDElement.new(overlay, parentHudElement, customMt) end

--- Deletes the overlay (releasing its engine handle), detaches the element from its parent, then recursively deletes every child. Do not use the element afterwards.
function HUDElement:delete() end

--- Appends a child to the draw list. If the child already belongs to another parent it is removed from it first; adding an existing child again does nothing.
---@param childHudElement table
function HUDElement:addChild(childHudElement) end

--- Removes the given child from this element's list and clears its parent reference, only if this element really is its parent. The child is not deleted.
---@param childHudElement table
function HUDElement:removeChild(childHudElement) end

--- Moves the overlay to an absolute screen position (nil keeps the current coordinate) and shifts every direct child by the same delta so the group moves together.
---@param x any
---@param y any
function HUDElement:setPosition(x, y) end

--- Rotates the overlay by an angle in radians around the given center, or around the element's stored pivot when no center is passed. Children are not rotated.
---@param rotation number
---@param centerX number?
---@param centerY number?
function HUDElement:setRotation(rotation, centerX, centerY) end

--- Stores the rotation pivot offset and also records it as the default pivot used again after scaling or dimension reset. Passing nil keeps the previous default.
---@param pivotX number
---@param pivotY number
function HUDElement:setRotationPivot(pivotX, pivotY) end

--- Returns the current pivot offset (x, y) in screen space, which may be scaled relative to the default.
---@return number
---@return number
function HUDElement:getRotationPivot() end

--- Returns the overlay's x and y screen position.
---@return number
---@return number
function HUDElement:getPosition() end

--- Scales the overlay and proportionally repositions and rescales every direct child around this element's position, then rescales the pivot from the default pivot.
---@param scaleWidth number
---@param scaleHeight number
function HUDElement:setScale(scaleWidth, scaleHeight) end

--- Returns the overlay's width and height scale factors.
---@return Width
---@return Height
function HUDElement:getScale() end

--- Forwards vertical and horizontal alignment constants (Overlay.ALIGN_*) to the overlay, which decides how the position is interpreted.
---@param vertical integer
---@param horizontal integer
function HUDElement:setAlignment(vertical, horizontal) end

--- Sets the overlay's visible flag if the overlay still exists. Children keep their own flag but are skipped by draw when the parent is hidden.
---@param isVisible any
function HUDElement:setVisible(isVisible) end

--- Returns the overlay's visible flag.
function HUDElement:getVisible() end

--- Returns the overlay's r, g, b, a color components.
---@return number
---@return number
---@return number
---@return number
function HUDElement:getColor() end

--- Returns the overlay's alpha value.
---@return number
function HUDElement:getAlpha() end

--- Returns the overlay width in screen units.
function HUDElement:getWidth() end

--- Returns the overlay height in screen units.
function HUDElement:getHeight() end

--- Sets overlay width and height; passing nil for one of them leaves it unchanged. Children are not touched.
---@param width any
---@param height any
function HUDElement:setDimension(width, height) end

--- Returns the overlay width and height.
---@return number
---@return number
function HUDElement:getDimension() end

--- Asks the overlay to restore its default dimensions and scale, and resets the pivot to the stored default pivot.
function HUDElement:resetDimensions() end

--- Sets the overlay color only; children keep their own colors.
---@param r any
---@param g any
---@param b any
---@param a any
function HUDElement:setColor(r, g, b, a) end

--- Changes only the overlay's alpha channel, leaving RGB untouched.
---@param alpha any
function HUDElement:setAlpha(alpha) end

--- Replaces the overlay's image file.
---@param imageFilename any
function HUDElement:setImage(imageFilename) end

--- Sets the overlay's texture coordinates.
---@param uvs any
function HUDElement:setUVs(uvs) end

--- Assigns a GUI slice id to the overlay.
---@param sliceId any
function HUDElement:setSliceId(sliceId) end

--- Advances the element's animation by dt milliseconds while it has not finished. Subclasses extend it; children are not updated here.
---@param dt any
function HUDElement:update(dt) end

--- Renders the overlay (with an optional clip rectangle) and then each child in insertion order, only when the overlay is visible.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function HUDElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Converts a two-value pixel vector (reference resolution) to screen units using the overlay scale, the aspect scale and g_referenceScreenWidth/Height. Returns two numbers.
---@param vector2D table
function HUDElement:scalePixelToScreenVector(vector2D) end

--- Converts a vertical pixel value at reference resolution to screen units, including overlay scale and aspect scale.
---@param height number
function HUDElement:scalePixelToScreenHeight(height) end

--- Converts a horizontal pixel value at reference resolution to screen units, including overlay scale and aspect scale.
---@param width number
function HUDElement:scalePixelToScreenWidth(width) end

--- Converts a pivot given in texture pixels into a local screen-space pivot, using the element size ratio to the UV rectangle. Note: the doc comment omits the size parameter.
---@param uvPivot table
---@param size table
---@param uvs table
function HUDElement:normalizeUVPivot(uvPivot, size, uvs) end
