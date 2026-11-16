---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/PurchaseSoilMapsEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) sent by a client to buy the soil maps of a farmland. The server performs the purchase through the soilMap object of g_precisionFarming.
---@class PurchaseSoilMapsEvent : Event
PurchaseSoilMapsEvent = {}

--- Creates an empty PurchaseSoilMapsEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function PurchaseSoilMapsEvent.emptyNew() end

--- Creates the event for a farmland id.
---@param farmlandId table
function PurchaseSoilMapsEvent.new(farmlandId) end

--- Server side: reads the farmland id, then calls run.
---@param streamId integer
---@param connection Connection
function PurchaseSoilMapsEvent:readStream(streamId, connection) end

--- Client side: writes the farmland id.
---@param streamId integer
---@param connection Connection
function PurchaseSoilMapsEvent:writeStream(streamId, connection) end

--- Executes only on the server: calls g_precisionFarming.soilMap:purchaseSoilMaps for the farmland, then updatePrecisionFarmingOverlays. Nothing is broadcast here.
---@param connection Connection
function PurchaseSoilMapsEvent:run(connection) end
