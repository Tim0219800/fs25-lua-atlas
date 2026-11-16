---@meta
-- FS25 1.25.1.0 : debug/elements/DebugPlane.lua (generated stub, FS25 Lua Atlas)

--- DebugPlane is a debug element drawing a quadrilateral from four corner positions, optionally terrain-aligned, filled, double-sided or solid. The renderer `DebugPlane.renderWithPositions` and `createWithPositions` are absent from this dump (UNVERIFIED).
---@class DebugPlane : DebugElement
DebugPlane = {}

--- Calls `DebugPlane.renderWithPositions` with the stored corner positions and display options (the explicit coordinate arguments are passed as nil).
function DebugPlane:draw() end

--- Builds the plane from the world positions of a start node and a width and a height node by delegating to `createWithPositions` (not in this dump). Returns self.
---@param startNode integer
---@param widthNode integer
---@param heightNode integer
---@return DebugPlane
function DebugPlane:createWithNodes(startNode, widthNode, heightNode) end

--- Builds a horizontal rectangle of the given X and Z size centred on a node, storing its four corners in world space (computed once, not updated if the node moves). Returns self.
---@param node integer
---@param sizeX number
---@param sizeZ number
---@return DebugPlane
function DebugPlane:createWithNode(node, sizeX, sizeZ) end
