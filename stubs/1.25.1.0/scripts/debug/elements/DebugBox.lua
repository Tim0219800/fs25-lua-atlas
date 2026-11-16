---@meta
-- FS25 1.25.1.0 : debug/elements/DebugBox.lua (generated stub, FS25 Lua Atlas)

--- DebugBox is a debug element for a wireframe or face-filled box, derived from DebugElement. In this dump only two setters are present; position, orientation and drawing code, including `calculateCornerPositions`, are absent (UNVERIFIED).
---@class DebugBox : DebugElement
DebugBox = {}

--- Updates the box size (nil arguments keep the current value) and recomputes the corner positions through `DebugBox.calculateCornerPositions`, which is not in this dump. Returns self.
---@param sizeX number
---@param sizeY number
---@param sizeZ number
---@return DebugBox
function DebugBox:setSize(sizeX, sizeY, sizeZ) end

--- Sets whether the box faces are drawn in addition to its edges. Returns self.
---@param drawFaces boolean
---@return DebugBox
function DebugBox:setDrawFaces(drawFaces) end
