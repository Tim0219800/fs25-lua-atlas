---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetDischargeStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class SetDischargeStateEvent : Event
SetDischargeStateEvent = {}

---@return table
function SetDischargeStateEvent.emptyNew() end

---@param vehicle table
---@param state integer
function SetDischargeStateEvent.new(vehicle, state) end

---@param streamId integer
---@param connection Connection
function SetDischargeStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetDischargeStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetDischargeStateEvent:run(connection) end

---@param vehicle table
---@param state integer
---@param noEventSend boolean
function SetDischargeStateEvent.sendEvent(vehicle, state, noEventSend) end
