---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetCrabSteeringEvent.lua (generated stub, FS25 Lua Atlas)

---@class SetCrabSteeringEvent : Event
SetCrabSteeringEvent = {}

---@return table
function SetCrabSteeringEvent.emptyNew() end

---@param vehicle table
---@param state integer
function SetCrabSteeringEvent.new(vehicle, state) end

---@param streamId integer
---@param connection Connection
function SetCrabSteeringEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetCrabSteeringEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetCrabSteeringEvent:run(connection) end

---@param vehicle table
---@param state integer
---@param noEventSend boolean
function SetCrabSteeringEvent.sendEvent(vehicle, state, noEventSend) end
