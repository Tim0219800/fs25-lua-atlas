---@meta
-- FS25 1.25.1.0 : gui/elements/ThreePartBitmapElement.lua (generated stub, FS25 Lua Atlas)

--- Bitmap element drawn in three parts: a start image, a stretched middle image (the element's normal overlay) and an end image. Derived from BitmapElement; it can run horizontally or vertically (isHorizontal). XML keys include startImage*, endImage*, startImageSize, endImageSize and isHorizontal.
---@class ThreePartBitmapElement : BitmapElement
ThreePartBitmapElement = {}

--- Constructor. Creates the element on BitmapElement with empty start/end overlays, zero part sizes and horizontal layout.
---@param target any
---@param custom_mt any
function ThreePartBitmapElement.new(target, custom_mt) end

--- Deletes the start and end overlays, then calls the parent delete.
function ThreePartBitmapElement:delete() end

--- Loads the start/end overlays, their sizes and isHorizontal from XML, creates the overlays and applies the normal-state colour of the main overlay to both ends.
---@param xmlFile any
---@param key any
function ThreePartBitmapElement:loadFromXML(xmlFile, key) end

--- Applies profile values for the start/end images, their sizes and isHorizontal; recreates an overlay only if its image file changed.
---@param profile any
---@param applyProfile any
function ThreePartBitmapElement:loadProfile(profile, applyProfile) end

--- Copies part sizes, orientation and both end overlays from a source element.
---@param src any
function ThreePartBitmapElement:copyAttributes(src) end

--- Sets the colour for a GuiOverlay state on the main overlay and on both end overlays; nil channels keep their previous value, nil state means the default.
---@param state integer
---@param r number
---@param g number
---@param b number
---@param a number
function ThreePartBitmapElement:setImageColor(state, r, g, b, a) end

--- Renders start, middle and end overlays side by side (or stacked vertically; start at the top) using the current overlay state and clip area. Skips BitmapElement's own draw and calls GuiElement's.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function ThreePartBitmapElement:draw(clipX1, clipY1, clipX2, clipY2) end
