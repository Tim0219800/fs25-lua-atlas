---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/SoilSamplerSendEvent.lua (stub généré, atlas Lua FS25)

---@class SoilSamplerSendEvent : Event
SoilSamplerSendEvent = {}

---@return table
function SoilSamplerSendEvent.emptyNew() end

---@param object table
function SoilSamplerSendEvent.new(object) end

---@param streamId integer
---@param connection Connection
function SoilSamplerSendEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SoilSamplerSendEvent:writeStream(streamId, connection) end

---@param connection Connection
function SoilSamplerSendEvent:run(connection) end

---@param object table
---@param noEventSend boolean
function SoilSamplerSendEvent.sendEvent(object, noEventSend) end
