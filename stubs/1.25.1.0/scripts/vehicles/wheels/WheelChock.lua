---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelChock.lua (generated stub, FS25 Lua Atlas)

---@class WheelChock
WheelChock = {}

---@param wheel any
---@param customMt any
function WheelChock.new(wheel, customMt) end

function WheelChock:delete() end

---@param xmlObject any
---@param key any
function WheelChock:loadFromXML(xmlObject, key) end

---@param i3dNode integer
---@param failedReason table
---@param args table
function WheelChock:onI3DLoaded(i3dNode, failedReason, args) end

---@param isInParkingPosition any
function WheelChock:update(isInParkingPosition) end

---@param schema any
---@param key any
function WheelChock.registerXMLPaths(schema, key) end
