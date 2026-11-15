---@meta
-- FS25 1.25.1.0 : debug/elements/DebugPath.lua (stub généré, atlas Lua FS25)

---@class DebugPath : DebugElement
DebugPath = {}

---@param customMt table?
---@return DebugPath
function DebugPath.new(customMt) end

---@return boolean
function DebugPath:getShouldBeDrawn() end

function DebugPath:draw() end

---@return DebugPath
function DebugPath:clear() end

---@param forcedY number
---@return DebugPath
function DebugPath:setForcedY(forcedY) end
