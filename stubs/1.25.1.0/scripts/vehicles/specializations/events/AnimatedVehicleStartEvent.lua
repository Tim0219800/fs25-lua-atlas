---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AnimatedVehicleStartEvent.lua (stub généré, atlas Lua FS25)

---@class AnimatedVehicleStartEvent : Event
AnimatedVehicleStartEvent = {}

---@return table
function AnimatedVehicleStartEvent.emptyNew() end

---@param object table
---@param name string
---@param speed number
---@param animTime number
function AnimatedVehicleStartEvent.new(object, name, speed, animTime) end

---@param streamId integer
---@param connection Connection
function AnimatedVehicleStartEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AnimatedVehicleStartEvent:writeStream(streamId, connection) end

---@param connection any
function AnimatedVehicleStartEvent:run(connection) end
