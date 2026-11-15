---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/YarderTowerSetTargetEvent.lua (generated stub, FS25 Lua Atlas)

---@class YarderTowerSetTargetEvent : Event
YarderTowerSetTargetEvent = {}

---@return table
function YarderTowerSetTargetEvent.emptyNew() end

---@param object table
---@param state table
---@param x any
---@param y any
---@param z any
---@return table
function YarderTowerSetTargetEvent.new(object, state, x, y, z) end

---@param streamId integer
---@param connection Connection
function YarderTowerSetTargetEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function YarderTowerSetTargetEvent:writeStream(streamId, connection) end

---@param connection Connection
function YarderTowerSetTargetEvent:run(connection) end

---@param vehicle table
---@param state boolean
---@param x boolean
---@param y any
---@param z any
---@param noEventSend boolean
function YarderTowerSetTargetEvent.sendEvent(vehicle, state, x, y, z, noEventSend) end
