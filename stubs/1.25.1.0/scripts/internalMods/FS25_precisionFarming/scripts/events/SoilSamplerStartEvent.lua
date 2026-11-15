---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/SoilSamplerStartEvent.lua (generated stub, FS25 Lua Atlas)

---@class SoilSamplerStartEvent : Event
SoilSamplerStartEvent = {}

---@return table
function SoilSamplerStartEvent.emptyNew() end

---@param object table
function SoilSamplerStartEvent.new(object) end

---@param streamId integer
---@param connection Connection
function SoilSamplerStartEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SoilSamplerStartEvent:writeStream(streamId, connection) end

---@param connection Connection
function SoilSamplerStartEvent:run(connection) end

---@param object table
---@param noEventSend boolean
function SoilSamplerStartEvent.sendEvent(object, noEventSend) end
