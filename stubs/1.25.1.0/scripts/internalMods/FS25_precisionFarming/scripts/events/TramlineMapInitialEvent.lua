---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/TramlineMapInitialEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that sends all farmland tramline settings (working width, work direction, spacing) from the server to a joining client.
---@class TramlineMapInitialEvent : Event
TramlineMapInitialEvent = {}

--- Creates an empty TramlineMapInitialEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function TramlineMapInitialEvent.emptyNew() end

--- Creates the event with a table of tramline states indexed by farmland id.
---@param farmlandTramlineStates table
function TramlineMapInitialEvent.new(farmlandTramlineStates) end

--- Client side: reads a farmland count, then for each farmland its id and three 32 bit floats (workingWidth, workDirection, spacing); then calls run.
---@param streamId integer
---@param connection Connection
function TramlineMapInitialEvent:readStream(streamId, connection) end

--- Server side: writes the farmland count, then each farmland id with its three float values.
---@param streamId integer
---@param connection Connection
function TramlineMapInitialEvent:writeStream(streamId, connection) end

--- Replaces g_precisionFarming.tramlineMap.farmlandTramlineStates with the received table, if the tramline map exists.
---@param connection Connection
function TramlineMapInitialEvent:run(connection) end
