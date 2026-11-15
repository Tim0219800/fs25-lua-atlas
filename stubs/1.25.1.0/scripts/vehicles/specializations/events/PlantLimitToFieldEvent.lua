---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PlantLimitToFieldEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlantLimitToFieldEvent : Event
PlantLimitToFieldEvent = {}

---@return table
function PlantLimitToFieldEvent.emptyNew() end

---@param object table
---@param plantLimitToField boolean
function PlantLimitToFieldEvent.new(object, plantLimitToField) end

---@param streamId integer
---@param connection Connection
function PlantLimitToFieldEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlantLimitToFieldEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlantLimitToFieldEvent:run(connection) end

---@param vehicle table
---@param plantLimitToField boolean
---@param noEventSend boolean
function PlantLimitToFieldEvent.sendEvent(vehicle, plantLimitToField, noEventSend) end
