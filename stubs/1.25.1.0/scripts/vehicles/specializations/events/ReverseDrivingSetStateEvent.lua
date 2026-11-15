---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/ReverseDrivingSetStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class ReverseDrivingSetStateEvent : Event
ReverseDrivingSetStateEvent = {}

---@return table
function ReverseDrivingSetStateEvent.emptyNew() end

---@param vehicle table
---@param isReverseDriving boolean
function ReverseDrivingSetStateEvent.new(vehicle, isReverseDriving) end

---@param streamId integer
---@param connection Connection
function ReverseDrivingSetStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function ReverseDrivingSetStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function ReverseDrivingSetStateEvent:run(connection) end

---@param vehicle table
---@param isReverseDriving boolean
---@param noEventSend boolean
function ReverseDrivingSetStateEvent.sendEvent(vehicle, isReverseDriving, noEventSend) end
