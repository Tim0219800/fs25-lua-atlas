---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/ResetYieldMapEvent.lua (generated stub, FS25 Lua Atlas)

---@class ResetYieldMapEvent : Event
ResetYieldMapEvent = {}

---@return table
function ResetYieldMapEvent.emptyNew() end

---@param farmlandId table
function ResetYieldMapEvent.new(farmlandId) end

---@param streamId integer
---@param connection Connection
function ResetYieldMapEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function ResetYieldMapEvent:writeStream(streamId, connection) end

---@param connection Connection
function ResetYieldMapEvent:run(connection) end
