---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/RequestFieldBuyInfoEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) sent by a client to ask the server for the extra buy information of a farmland. The server answers with an AdditionalFieldBuyInfoEvent to that connection only.
---@class RequestFieldBuyInfoEvent : Event
RequestFieldBuyInfoEvent = {}

--- Creates an empty RequestFieldBuyInfoEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function RequestFieldBuyInfoEvent.emptyNew() end

--- Creates the request for a farmland id.
---@param farmlandId table
function RequestFieldBuyInfoEvent.new(farmlandId) end

--- Server side: reads the farmland id, then calls run.
---@param streamId integer
---@param connection Connection
function RequestFieldBuyInfoEvent:readStream(streamId, connection) end

--- Client side: writes the farmland id.
---@param streamId integer
---@param connection Connection
function RequestFieldBuyInfoEvent:writeStream(streamId, connection) end

--- Executes only on the server: replies with an AdditionalFieldBuyInfoEvent for that farmland to the requesting connection alone. Note: the server check is written twice in a nested way, which is redundant.
---@param connection Connection
function RequestFieldBuyInfoEvent:run(connection) end
