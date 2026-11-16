---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/ResetYieldMapEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) sent by a client to reset the yield map data of a farmland. The server applies it through the yieldMap object of g_precisionFarming.
---@class ResetYieldMapEvent : Event
ResetYieldMapEvent = {}

--- Creates an empty ResetYieldMapEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function ResetYieldMapEvent.emptyNew() end

--- Creates the event for a farmland id.
---@param farmlandId table
function ResetYieldMapEvent.new(farmlandId) end

--- Server side: reads the farmland id, then calls run.
---@param streamId integer
---@param connection Connection
function ResetYieldMapEvent:readStream(streamId, connection) end

--- Client side: writes the farmland id.
---@param streamId integer
---@param connection Connection
function ResetYieldMapEvent:writeStream(streamId, connection) end

--- Executes only on the server: calls g_precisionFarming.yieldMap:resetFarmlandYieldArea for the farmland, then updatePrecisionFarmingOverlays.
---@param connection Connection
function ResetYieldMapEvent:run(connection) end
