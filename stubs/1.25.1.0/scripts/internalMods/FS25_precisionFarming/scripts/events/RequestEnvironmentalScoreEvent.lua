---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/RequestEnvironmentalScoreEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) sent by a client to ask the server for the environmental score data of its farm. The server answers with an EnvironmentalScoreEvent to that connection only.
---@class RequestEnvironmentalScoreEvent : Event
RequestEnvironmentalScoreEvent = {}

--- Creates an empty RequestEnvironmentalScoreEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function RequestEnvironmentalScoreEvent.emptyNew() end

--- Creates the request for a farm id.
---@param farmId table
function RequestEnvironmentalScoreEvent.new(farmId) end

--- Server side: reads the farm id (FarmManager.FARM_ID_SEND_NUM_BITS bits), then calls run.
---@param streamId integer
---@param connection Connection
function RequestEnvironmentalScoreEvent:readStream(streamId, connection) end

--- Client side: writes the farm id using FarmManager.FARM_ID_SEND_NUM_BITS bits.
---@param streamId integer
---@param connection Connection
function RequestEnvironmentalScoreEvent:writeStream(streamId, connection) end

--- Executes only on the server: sends an EnvironmentalScoreEvent for the requested farm back to the requesting connection alone.
---@param connection Connection
function RequestEnvironmentalScoreEvent:run(connection) end
