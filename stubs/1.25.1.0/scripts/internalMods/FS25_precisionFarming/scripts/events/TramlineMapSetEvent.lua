---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that synchronises a tramline change on one farmland: working width, direction, spacing, an enabled flag and whether to clear the fruit. Clients send it to the server, which re-broadcasts it.
---@class TramlineMapSetEvent : Event
TramlineMapSetEvent = {}

--- Creates an empty TramlineMapSetEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function TramlineMapSetEvent.emptyNew() end

--- Creates the event with the farmland id, working width, work direction, spacing, enabled flag and clearFruit flag.
---@param farmlandId table
---@param workingWidth any
---@param workDirection any
---@param spacing any
---@param enabled any
---@param clearFruit any
function TramlineMapSetEvent.new(farmlandId, workingWidth, workDirection, spacing, enabled, clearFruit) end

--- Reads the farmland id, three 32 bit floats and two booleans (enabled, clearFruit), then calls run.
---@param streamId integer
---@param connection Connection
function TramlineMapSetEvent:readStream(streamId, connection) end

--- Writes the same fields in the same order as readStream.
---@param streamId integer
---@param connection Connection
function TramlineMapSetEvent:writeStream(streamId, connection) end

--- Receiving side. The server re-broadcasts to the other clients, then every side calls tramlineMap:setFarmlandTramlines(...) with noEventSend set, if the tramline map exists.
---@param connection Connection
function TramlineMapSetEvent:run(connection) end

--- Entry point to sync a tramline change. Server: broadcasts a new TramlineMapSetEvent to all clients; client: sends it to the server. Does nothing when noEventSend is true.
---@param farmlandId table
---@param workingWidth boolean
---@param workDirection any
---@param spacing any
---@param enabled any
---@param clearFruit any
---@param noEventSend boolean
function TramlineMapSetEvent.sendEvent(farmlandId, workingWidth, workDirection, spacing, enabled, clearFruit, noEventSend) end
