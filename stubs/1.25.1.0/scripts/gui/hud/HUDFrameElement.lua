---@meta
-- FS25 1.25.1.0 : gui/hud/HUDFrameElement.lua (generated stub, FS25 Lua Atlas)

--- HUD background frame built from a transparent base overlay plus four child HUDElements: a top line, left and right lines and a bottom bar. Line thickness is rounded up to whole screen pixels. The bottom bar can be turned into a plain frame line with showBar=false. Extends HUDElement; client-side only.
---@class HUDFrameElement : HUDElement
HUDFrameElement = {}

--- Creates the frame at the given position and size, optionally parented, with optional bar visibility and frame/bar thicknesses (defaults from HUDFrameElement.THICKNESS), then builds the line components.
---@param posX number
---@param posY number
---@param width number
---@param height number
---@param parent table?
---@param showBar any
---@param frameThickness any
---@param barThickness any
function HUDFrameElement.new(posX, posY, width, height, parent, showBar, frameThickness, barThickness) end

--- Builds the top, left, right and bottom overlays as children, rounding thickness up to at least one screen pixel. With the bar disabled the bottom uses the frame thickness and color.
---@param baseX any
---@param baseY any
---@param width any
---@param height any
function HUDFrameElement:createComponents(baseX, baseY, width, height) end

--- Overrides HUDElement:setDimension to resize the frame and keep the lines in place: top and bottom span the new width, side lines the new height minus two line thicknesses, and top/right are repositioned.
---@param width any
---@param height any
function HUDFrameElement:setDimension(width, height) end

--- Sets only the height of the bottom bar.
---@param height any
function HUDFrameElement:setBottomBarHeight(height) end

--- Sets the bottom bar color. Note: its doc comment wrongly repeats the bar-height description.
---@param r any
---@param g any
---@param b any
---@param a any
function HUDFrameElement:setBottomBarColor(r, g, b, a) end

--- Shows or hides the left frame line.
---@param visible any
function HUDFrameElement:setLeftLineVisible(visible) end

--- Shows or hides the right frame line.
---@param visible any
function HUDFrameElement:setRightLineVisible(visible) end

--- Applies one color to the top, left and right lines and to the bottom bar (this overrides a distinct bar color).
---@param r any
---@param g any
---@param b any
---@param a any
function HUDFrameElement:setFrameColor(r, g, b, a) end
