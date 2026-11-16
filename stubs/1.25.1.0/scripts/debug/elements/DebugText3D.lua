---@meta
-- FS25 1.25.1.0 : debug/elements/DebugText3D.lua (generated stub, FS25 Lua Atlas)

--- DebugText3D is a debug element drawing text as a 3D object in the world with a given rotation (via the engine `renderText3D`), centred by default. Unlike DebugText it has no shadow and is not projected to the screen.
---@class DebugText3D : DebugElement
DebugText3D = {}

--- Creates a 3D text element with centre alignment, middle vertical alignment and size 0.1.
---@param customMt table?
---@return DebugText3D
function DebugText3D.new(customMt) end

--- Renders the text at the stored position and rotation with the element's colour, size and alignments.
function DebugText3D:draw() end

--- Draws text in 3D at a world position with Euler rotation (default white, centred), then resets alignment and colour. Note: the doc comment mentions terrain alignment with nil Y, but the code does not implement it.
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param text string
---@param color table?
---@param size number?
---@param alignment integer?
---@param verticalAlignment integer?
function DebugText3D.renderAtPosition(x, y, z, rx, ry, rz, text, color, size, alignment, verticalAlignment) end

--- Draws 3D text at a node's world position using the node's world rotation.
---@param node integer
---@param text string
---@param color table?
---@param size number?
---@param alignment integer?
---@param verticalAlignment integer?
function DebugText3D.renderAtNode(node, text, color, size, alignment, verticalAlignment) end
