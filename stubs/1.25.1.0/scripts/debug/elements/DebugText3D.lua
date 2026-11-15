---@meta
-- FS25 1.25.1.0 : debug/elements/DebugText3D.lua (stub généré, atlas Lua FS25)

---@class DebugText3D : DebugElement
DebugText3D = {}

---@param customMt table?
---@return DebugText3D
function DebugText3D.new(customMt) end

function DebugText3D:draw() end

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

---@param node integer
---@param text string
---@param color table?
---@param size number?
---@param alignment integer?
---@param verticalAlignment integer?
function DebugText3D.renderAtNode(node, text, color, size, alignment, verticalAlignment) end
