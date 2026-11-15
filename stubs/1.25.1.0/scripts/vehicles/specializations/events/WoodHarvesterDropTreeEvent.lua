---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterDropTreeEvent.lua (generated stub, FS25 Lua Atlas)

---@class WoodHarvesterDropTreeEvent : Event
WoodHarvesterDropTreeEvent = {}

---@return table
function WoodHarvesterDropTreeEvent.emptyNew() end

---@param object table
function WoodHarvesterDropTreeEvent.new(object) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterDropTreeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterDropTreeEvent:writeStream(streamId, connection) end

---@param connection Connection
function WoodHarvesterDropTreeEvent:run(connection) end

---@param object table
---@param noEventSend boolean
function WoodHarvesterDropTreeEvent.sendEvent(object, noEventSend) end
