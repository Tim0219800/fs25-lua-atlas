---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/ConsumableRefillEvent.lua (generated stub, FS25 Lua Atlas)

---@class ConsumableRefillEvent : Event
ConsumableRefillEvent = {}

---@return table
function ConsumableRefillEvent.emptyNew() end

---@param object table
---@param typeIndex table
---@param variationIndex any
---@return table
function ConsumableRefillEvent.new(object, typeIndex, variationIndex) end

---@param streamId integer
---@param connection Connection
function ConsumableRefillEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function ConsumableRefillEvent:writeStream(streamId, connection) end

---@param connection Connection
function ConsumableRefillEvent:run(connection) end

---@param vehicle table
---@param typeIndex integer
---@param variationIndex integer
function ConsumableRefillEvent.sendEvent(vehicle, typeIndex, variationIndex) end
