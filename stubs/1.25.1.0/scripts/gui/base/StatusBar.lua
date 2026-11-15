---@meta
-- FS25 1.25.1.0 : gui/base/StatusBar.lua (generated stub, FS25 Lua Atlas)

---@class StatusBar
StatusBar = {}

---@param x any
---@param y any
---@param width any
---@param height any
---@param bgColor any
---@param valueColor any
---@param markerSize any
---@param custom_mt any
function StatusBar.new(x, y, width, height, bgColor, valueColor, markerSize, custom_mt) end

function StatusBar:delete() end

---@param isDisabled any
function StatusBar:setDisabled(isDisabled) end

---@param x any
---@param y any
function StatusBar:setPosition(x, y) end

---@param r any
---@param g any
---@param b any
---@param a any
function StatusBar:setColor(r, g, b, a) end

---@param newValue any
function StatusBar:setValue(newValue) end

function StatusBar:render() end
