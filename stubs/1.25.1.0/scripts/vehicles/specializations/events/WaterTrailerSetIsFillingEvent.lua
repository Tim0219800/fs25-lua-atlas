---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WaterTrailerSetIsFillingEvent.lua (generated stub, FS25 Lua Atlas)

---@class WaterTrailerSetIsFillingEvent : Event
WaterTrailerSetIsFillingEvent = {}

---@return table
function WaterTrailerSetIsFillingEvent.emptyNew() end

---@param vehicle table
---@param isFilling boolean
function WaterTrailerSetIsFillingEvent.new(vehicle, isFilling) end

---@param streamId integer
---@param connection Connection
function WaterTrailerSetIsFillingEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WaterTrailerSetIsFillingEvent:writeStream(streamId, connection) end

---@param connection Connection
function WaterTrailerSetIsFillingEvent:run(connection) end

---@param vehicle table
---@param isFilling boolean
---@param noEventSend boolean
function WaterTrailerSetIsFillingEvent.sendEvent(vehicle, isFilling, noEventSend) end
