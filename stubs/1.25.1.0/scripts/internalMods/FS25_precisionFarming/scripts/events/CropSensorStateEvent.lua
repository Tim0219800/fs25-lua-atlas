---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.lua (stub généré, atlas Lua FS25)

---@class CropSensorStateEvent : Event
CropSensorStateEvent = {}

---@return table
function CropSensorStateEvent.emptyNew() end

---@param object table
---@param state boolean
function CropSensorStateEvent.new(object, state) end

---@param streamId integer
---@param connection Connection
function CropSensorStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function CropSensorStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function CropSensorStateEvent:run(connection) end

---@param object table
---@param state boolean
---@param noEventSend boolean
function CropSensorStateEvent.sendEvent(object, state, noEventSend) end
