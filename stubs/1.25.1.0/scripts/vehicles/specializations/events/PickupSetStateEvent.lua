---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PickupSetStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class PickupSetStateEvent : Event
PickupSetStateEvent = {}

---@return table
function PickupSetStateEvent.emptyNew() end

---@param object table
---@param isPickupLowered boolean
function PickupSetStateEvent.new(object, isPickupLowered) end

---@param streamId integer
---@param connection Connection
function PickupSetStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PickupSetStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function PickupSetStateEvent:run(connection) end

---@param vehicle table
---@param isPickupLowered boolean
---@param noEventSend boolean
function PickupSetStateEvent.sendEvent(vehicle, isPickupLowered, noEventSend) end
