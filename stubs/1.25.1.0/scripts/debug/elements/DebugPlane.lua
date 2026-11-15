---@meta
-- FS25 1.25.1.0 : debug/elements/DebugPlane.lua (stub généré, atlas Lua FS25)

---@class DebugPlane : DebugElement
DebugPlane = {}

function DebugPlane:draw() end

---@param startNode integer
---@param widthNode integer
---@param heightNode integer
---@return DebugPlane
function DebugPlane:createWithNodes(startNode, widthNode, heightNode) end

---@param node integer
---@param sizeX number
---@param sizeZ number
---@return DebugPlane
function DebugPlane:createWithNode(node, sizeX, sizeZ) end
