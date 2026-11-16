---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/AdditionalFieldBuyInfoEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that carries the extra field buy information (Precision Farming data shown when buying a farmland) from server to a requesting client. It is sent in reply to RequestFieldBuyInfoEvent.
---@class AdditionalFieldBuyInfoEvent : Event
AdditionalFieldBuyInfoEvent = {}

--- Creates an empty AdditionalFieldBuyInfoEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function AdditionalFieldBuyInfoEvent.emptyNew() end

--- Creates the event for a farmland id.
---@param farmlandId table
function AdditionalFieldBuyInfoEvent.new(farmlandId) end

--- Client side: reads the farmland id, then lets g_precisionFarming.additionalFieldBuyInfo read the data with readInfoFromStream, if that object exists.
---@param streamId integer
---@param connection Connection
function AdditionalFieldBuyInfoEvent:readStream(streamId, connection) end

--- Server side: writes the farmland id, then lets g_precisionFarming.additionalFieldBuyInfo write the data with writeInfoToStream, if that object exists.
---@param streamId integer
---@param connection Connection
function AdditionalFieldBuyInfoEvent:writeStream(streamId, connection) end
