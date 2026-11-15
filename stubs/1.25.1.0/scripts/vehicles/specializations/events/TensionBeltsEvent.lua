---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TensionBeltsEvent.lua (generated stub, FS25 Lua Atlas)

---@class TensionBeltsEvent : Event
TensionBeltsEvent = {}

---@return table
function TensionBeltsEvent.emptyNew() end

---@param object table
---@param isActive boolean
---@param beltId integer
function TensionBeltsEvent.new(object, isActive, beltId) end

---@param streamId integer
---@param connection Connection
function TensionBeltsEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TensionBeltsEvent:writeStream(streamId, connection) end

---@param connection Connection
function TensionBeltsEvent:run(connection) end

---@param vehicle table
---@param isActive boolean
---@param beltId integer
---@param noEventSend boolean
function TensionBeltsEvent.sendEvent(vehicle, isActive, beltId, noEventSend) end
