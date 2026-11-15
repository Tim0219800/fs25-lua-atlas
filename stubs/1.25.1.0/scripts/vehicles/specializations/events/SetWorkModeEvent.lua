---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetWorkModeEvent.lua (generated stub, FS25 Lua Atlas)

---@class SetWorkModeEvent : Event
SetWorkModeEvent = {}

---@return table
function SetWorkModeEvent.emptyNew() end

---@param vehicle table
---@param state integer
function SetWorkModeEvent.new(vehicle, state) end

---@param streamId integer
---@param connection Connection
function SetWorkModeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetWorkModeEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetWorkModeEvent:run(connection) end

---@param vehicle table
---@param state integer
---@param noEventSend boolean
function SetWorkModeEvent.sendEvent(vehicle, state, noEventSend) end
