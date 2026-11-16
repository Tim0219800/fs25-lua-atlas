---@meta
-- FS25 1.25.1.0 : debug/elements/DebugText.lua (generated stub, FS25 Lua Atlas)

--- DebugText is a debug element drawing 2D screen text at the projected position of a world point or node, with a black drop shadow, centred by default. Static helpers can be used without creating an element.
---@class DebugText : DebugElement
DebugText = {}

--- Creates a text element with centre alignment, middle vertical alignment, size 0.1, no screen offset and no node.
---@param customMt table?
---@return DebugText
function DebugText.new(customMt) end

--- If a node is set and exists, updates the position from it, then renders the text at that projected world position.
function DebugText:draw() end

--- Projects a world position to the screen and draws text there; a nil Y places it 0.01 m above the terrain, and nothing is drawn if the point is behind the far plane (z > 1) or no terrain exists.
---@param x number
---@param y number
---@param z number
---@param text string
---@param color table?
---@param size number?
---@param screenSpaceYOffset number?
---@param alignment integer?
---@param verticalAlignment integer?
function DebugText.renderAtPosition(x, y, z, text, color, size, screenSpaceYOffset, alignment, verticalAlignment) end

--- Draws text at normalised screen coordinates (default size 0.02) with a black shadow, after bounds checks, then resets text alignment and colour. Returns the Y for a following line, or nothing if clipped.
---@param x number
---@param y number
---@param text string
---@param color table?
---@param size number?
---@param yOffset number?
---@param alignment integer?
---@param verticalAlignment integer?
function DebugText.renderAtScreenPosition(x, y, text, color, size, yOffset, alignment, verticalAlignment) end

--- Draws text at the screen projection of a node's world position, with zero extra Y offset.
---@param node integer
---@param text string
---@param color table?
---@param size number?
---@param alignment integer?
---@param verticalAlignment integer?
function DebugText.renderAtNode(node, text, color, size, alignment, verticalAlignment) end
