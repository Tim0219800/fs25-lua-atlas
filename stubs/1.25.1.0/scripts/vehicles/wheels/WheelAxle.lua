---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelAxle.lua (generated stub, FS25 Lua Atlas)

---@class WheelAxle
WheelAxle = {}

---@param vehicle any
---@param customMt any
function WheelAxle.new(vehicle, customMt) end

function WheelAxle:delete() end

---@param xmlFile any
---@param key any
function WheelAxle:loadFromXML(xmlFile, key) end

---@param dt any
function WheelAxle:update(dt) end

function WheelAxle.getDebugValueHeader() end

---@param debugTable any
function WheelAxle:fillDebugValues(debugTable) end

---@param schema any
---@param key any
function WheelAxle.registerXMLPaths(schema, key) end
