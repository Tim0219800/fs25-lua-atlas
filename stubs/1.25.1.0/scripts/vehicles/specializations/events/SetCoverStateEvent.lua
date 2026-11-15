---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetCoverStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class SetCoverStateEvent : Event
SetCoverStateEvent = {}

---@return table
function SetCoverStateEvent.emptyNew() end

---@param vehicle table
---@param state integer
function SetCoverStateEvent.new(vehicle, state) end

---@param streamId integer
---@param connection Connection
function SetCoverStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetCoverStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetCoverStateEvent:run(connection) end

---@param vehicle table
---@param state integer
---@param noEventSend boolean
function SetCoverStateEvent.sendEvent(vehicle, state, noEventSend) end
