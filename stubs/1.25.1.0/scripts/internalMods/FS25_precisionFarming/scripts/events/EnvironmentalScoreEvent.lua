---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/EnvironmentalScoreEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that sends the environmental score data of one farm from server to a client, in reply to RequestEnvironmentalScoreEvent.
---@class EnvironmentalScoreEvent : Event
EnvironmentalScoreEvent = {}

--- Creates an empty EnvironmentalScoreEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function EnvironmentalScoreEvent.emptyNew() end

--- Creates the event for a farm id.
---@param farmId table
function EnvironmentalScoreEvent.new(farmId) end

--- Client side: reads the farm id, then passes the stream to g_precisionFarming.environmentalScore:readStream, if it exists.
---@param streamId integer
---@param connection Connection
function EnvironmentalScoreEvent:readStream(streamId, connection) end

--- Server side: writes the farm id, then lets g_precisionFarming.environmentalScore:writeStream write that farm's score data.
---@param streamId integer
---@param connection Connection
function EnvironmentalScoreEvent:writeStream(streamId, connection) end
