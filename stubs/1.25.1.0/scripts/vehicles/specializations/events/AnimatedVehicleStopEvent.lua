---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AnimatedVehicleStopEvent.lua (stub généré, atlas Lua FS25)

---@class AnimatedVehicleStopEvent : Event
AnimatedVehicleStopEvent = {}

---@return table
function AnimatedVehicleStopEvent.emptyNew() end

---@param object table
---@param name string
function AnimatedVehicleStopEvent.new(object, name) end

---@param streamId integer
---@param connection Connection
function AnimatedVehicleStopEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AnimatedVehicleStopEvent:writeStream(streamId, connection) end

---@param connection Connection
function AnimatedVehicleStopEvent:run(connection) end
