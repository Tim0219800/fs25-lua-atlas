---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerDefaultFruitTypeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that synchronises which default fruit requirement index an extended sprayer uses to compute its application amount.
---@class ExtendedSprayerDefaultFruitTypeEvent : Event
ExtendedSprayerDefaultFruitTypeEvent = {}

--- Creates an empty ExtendedSprayerDefaultFruitTypeEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function ExtendedSprayerDefaultFruitTypeEvent.emptyNew() end

--- Creates the event for a sprayer object and a fruit requirement index.
---@param object table
---@param fruitRequirementIndex integer
function ExtendedSprayerDefaultFruitTypeEvent.new(object, fruitRequirementIndex) end

--- Reads the object and the index (FruitTypeManager.SEND_NUM_BITS bits), then calls run.
---@param streamId integer
---@param connection Connection
function ExtendedSprayerDefaultFruitTypeEvent:readStream(streamId, connection) end

--- Writes the object and the fruit requirement index using FruitTypeManager.SEND_NUM_BITS bits.
---@param streamId integer
---@param connection Connection
function ExtendedSprayerDefaultFruitTypeEvent:writeStream(streamId, connection) end

--- Receiving side. On the server it first re-broadcasts the event to the other clients (not the sender); then, if the target object exists and is synchronized, it applies the change locally without sending a new event. It calls object:setSprayAmountDefaultFruitRequirementIndex(index, true).
---@param connection Connection
function ExtendedSprayerDefaultFruitTypeEvent:run(connection) end

--- Entry point to sync the default fruit requirement index. Server: broadcasts a new ExtendedSprayerDefaultFruitTypeEvent to the clients (bound to the object); client: sends it to the server. Does nothing when noEventSend is true.
---@param object table
---@param fruitRequirementIndex boolean
---@param noEventSend boolean
function ExtendedSprayerDefaultFruitTypeEvent.sendEvent(object, fruitRequirementIndex, noEventSend) end
