---@meta
-- FS25 1.25.1.0 : gui/base/RoundStatusBar.lua (stub généré, atlas Lua FS25)

---@class RoundStatusBar
RoundStatusBar = {}

---@param frontSliceId any
---@param valueSliceId any
---@param markerSliceId any
---@param x any
---@param y any
---@param width any
---@param height any
---@param valueWidth any
---@param valueHeight any
---@param radius any
---@param color any
---@param bgColor any
---@param valueColor any
---@param markerSize any
---@param custom_mt any
function RoundStatusBar.new(frontSliceId, valueSliceId, markerSliceId, x, y, width, height, valueWidth, valueHeight, radius, color, bgColor, valueColor, markerSize, custom_mt) end

function RoundStatusBar:delete() end

---@param x any
---@param y any
function RoundStatusBar:setPosition(x, y) end

---@param newValue any
function RoundStatusBar:setValue(newValue) end

function RoundStatusBar:render() end
