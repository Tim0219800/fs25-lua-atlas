---@meta
-- FS25 1.25.1.0 : gui/base/ButtonOverlay.lua (generated stub, FS25 Lua Atlas)

--- Overlay helper that draws a keyboard key button (left cap, stretched middle, right cap) with text on top. Uses overlays `gui.button_left`, `gui.button_middle` and `gui.button_right` from `g_overlayManager`.
---@class ButtonOverlay
ButtonOverlay = {}

--- Constructor: creates the three button overlays, sets the text size and offset ratios and the default white colour. `minWidth` and `debugEnabled` start as nil.
---@param customMt any
function ButtonOverlay.new(customMt) end

--- Deletes the three overlays and sets their references to nil. Safe to call when some are already nil.
function ButtonOverlay:delete() end

--- Sets text colour (r,g,b,a) and optional background colour (r2..a2, defaulting to the text colour or the previous background), keeping old values for nil arguments; applies the background to all three overlays.
---@param r number?
---@param g number?
---@param b number?
---@param a number?
---@param r2 number?
---@param g2 number?
---@param b2 number?
---@param a2 number?
function ButtonOverlay:setColor(r, g, b, a, r2, g2, b2, a2) end

--- Draws the button background and the upper-cased key text at the given position and height, with optional clip area, left offset and grey custom text. Returns the total width; draws debug frames if UI debug is on. Note: calls `self:renderBackground`, not defined in this file (UNVERIFIED).
---@param buttonText buttonText
---@param posX posX
---@param posY posY
---@param height height
---@param colorText any
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
---@param customOffsetLeft any
---@param customButtonInputText any
function ButtonOverlay:renderButton(buttonText, posX, posY, height, colorText, clipX1, clipY1, clipX2, clipY2, customOffsetLeft, customButtonInputText) end

--- Computes the button width for a key text and height from the bold text width plus padding, custom left offset and custom text width, respecting `minWidth`. Returns the full width and the width without offset.
---@param buttonText any
---@param height any
---@param customOffsetLeft any
---@param customButtonInputText any
function ButtonOverlay:getButtonWidth(buttonText, height, customOffsetLeft, customButtonInputText) end
