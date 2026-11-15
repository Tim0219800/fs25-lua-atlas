---@meta
-- FS25 1.25.1.0 : debug/elements/DebugElement.lua (stub généré, atlas Lua FS25)

---@class DebugElement
DebugElement = {}

---@param customMt table?
---@return table
function DebugElement.new(customMt) end

---@return boolean
function DebugElement:getShouldBeDrawn() end

function DebugElement:draw() end

---@param groupId string?
---@param lifetime number?
---@param maxCount integer?
---@return DebugElement
function DebugElement:addToManager(groupId, lifetime, maxCount) end

---@param r number
---@param g number
---@param b number
---@param a number?
---@return DebugElement
function DebugElement:setColorRGBA(r, g, b, a) end

---@param isVisible boolean
---@return DebugElement
function DebugElement:setIsVisible(isVisible) end

---@param isVisible boolean
---@return DebugElement
function DebugElement:setVisbileWhenGUIOpen(isVisible) end

---@param clipDistance number?
---@return DebugElement
function DebugElement:setClipDistance(clipDistance) end
