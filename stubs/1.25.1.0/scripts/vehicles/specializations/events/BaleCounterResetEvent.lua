---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BaleCounterResetEvent.lua (stub généré, atlas Lua FS25)

---@class BaleCounterResetEvent : Event
BaleCounterResetEvent = {}

---@return table
function BaleCounterResetEvent.emptyNew() end

---@param object table
---@return table
function BaleCounterResetEvent.new(object) end

---@param streamId integer
---@param connection Connection
function BaleCounterResetEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BaleCounterResetEvent:writeStream(streamId, connection) end

---@param connection Connection
function BaleCounterResetEvent:run(connection) end

---@param vehicle table
---@param noEventSend boolean
function BaleCounterResetEvent.sendEvent(vehicle, noEventSend) end
