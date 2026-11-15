---@meta
-- FS25 1.25.1.0 : debug/elements/DebugText.lua (stub généré, atlas Lua FS25)

---@class DebugText : DebugElement
DebugText = {}

---@param customMt table?
---@return DebugText
function DebugText.new(customMt) end

function DebugText:draw() end

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

---@param x number
---@param y number
---@param text string
---@param color table?
---@param size number?
---@param yOffset number?
---@param alignment integer?
---@param verticalAlignment integer?
function DebugText.renderAtScreenPosition(x, y, text, color, size, yOffset, alignment, verticalAlignment) end

---@param node integer
---@param text string
---@param color table?
---@param size number?
---@param alignment integer?
---@param verticalAlignment integer?
function DebugText.renderAtNode(node, text, color, size, alignment, verticalAlignment) end
