---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerAmountEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that synchronises the application amount of an extended sprayer: automatic mode on or off and, in manual mode, a value whose width is NitrogenMap.NUM_BITS.
---@class ExtendedSprayerAmountEvent : Event
ExtendedSprayerAmountEvent = {}

--- Creates an empty ExtendedSprayerAmountEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function ExtendedSprayerAmountEvent.emptyNew() end

--- Creates the event for a sprayer object, an automatic mode flag and a manual amount value.
---@param object table
---@param automaticMode boolean
---@param manualValue integer
function ExtendedSprayerAmountEvent.new(object, automaticMode, manualValue) end

--- Reads the object, the automatic flag and, only if automatic is off, the manual value (NitrogenMap.NUM_BITS bits); then calls run.
---@param streamId integer
---@param connection Connection
function ExtendedSprayerAmountEvent:readStream(streamId, connection) end

--- Writes the object and the automatic flag, then the manual value only when automatic mode is off.
---@param streamId integer
---@param connection Connection
function ExtendedSprayerAmountEvent:writeStream(streamId, connection) end

--- Receiving side. On the server it first re-broadcasts the event to the other clients (not the sender); then, if the target object exists and is synchronized, it applies the change locally without sending a new event. It calls object:setSprayAmountAutoMode and, in manual mode, object:setSprayAmountManualValue.
---@param connection Connection
function ExtendedSprayerAmountEvent:run(connection) end

--- Entry point to sync the spray amount. Server: broadcasts a new ExtendedSprayerAmountEvent to the clients (bound to the object); client: sends it to the server. Does nothing when noEventSend is true.
---@param object table
---@param automaticMode boolean
---@param manualValue any
---@param noEventSend boolean
function ExtendedSprayerAmountEvent.sendEvent(object, automaticMode, manualValue, noEventSend) end
