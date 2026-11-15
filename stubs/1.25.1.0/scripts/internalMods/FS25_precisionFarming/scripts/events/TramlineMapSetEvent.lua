---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.lua (stub généré, atlas Lua FS25)

---@class TramlineMapSetEvent : Event
TramlineMapSetEvent = {}

---@return table
function TramlineMapSetEvent.emptyNew() end

---@param farmlandId table
---@param workingWidth any
---@param workDirection any
---@param spacing any
---@param enabled any
---@param clearFruit any
function TramlineMapSetEvent.new(farmlandId, workingWidth, workDirection, spacing, enabled, clearFruit) end

---@param streamId integer
---@param connection Connection
function TramlineMapSetEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TramlineMapSetEvent:writeStream(streamId, connection) end

---@param connection Connection
function TramlineMapSetEvent:run(connection) end

---@param farmlandId table
---@param workingWidth boolean
---@param workDirection any
---@param spacing any
---@param enabled any
---@param clearFruit any
---@param noEventSend boolean
function TramlineMapSetEvent.sendEvent(farmlandId, workingWidth, workDirection, spacing, enabled, clearFruit, noEventSend) end
