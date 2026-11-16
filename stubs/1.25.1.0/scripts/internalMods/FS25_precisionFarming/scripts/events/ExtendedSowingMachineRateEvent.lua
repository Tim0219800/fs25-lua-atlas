---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/ExtendedSowingMachineRateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that synchronises the seed rate setting of an extended sowing machine: automatic mode on or off and, in manual mode, a 2 bit rate value.
---@class ExtendedSowingMachineRateEvent : Event
ExtendedSowingMachineRateEvent = {}

--- Creates an empty ExtendedSowingMachineRateEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function ExtendedSowingMachineRateEvent.emptyNew() end

--- Creates the event for a machine object, an automatic mode flag and a manual rate value.
---@param object table
---@param automaticMode boolean
---@param manualValue integer
function ExtendedSowingMachineRateEvent.new(object, automaticMode, manualValue) end

--- Reads the object, the automatic flag and, only if automatic is off, the 2 bit manual value; then calls run.
---@param streamId integer
---@param connection Connection
function ExtendedSowingMachineRateEvent:readStream(streamId, connection) end

--- Writes the object and the automatic flag, followed by the 2 bit manual value only when automatic mode is off.
---@param streamId integer
---@param connection Connection
function ExtendedSowingMachineRateEvent:writeStream(streamId, connection) end

--- Receiving side. On the server it first re-broadcasts the event to the other clients (not the sender); then, if the target object exists and is synchronized, it applies the change locally without sending a new event. It calls object:setSeedRateAutoMode and, in manual mode, object:setManualSeedRate.
---@param connection Connection
function ExtendedSowingMachineRateEvent:run(connection) end

--- Entry point to sync the seed rate. Server: broadcasts a new ExtendedSowingMachineRateEvent to the clients (bound to the object); client: sends it to the server. Does nothing when noEventSend is true.
---@param object table
---@param automaticMode boolean
---@param manualValue any
---@param noEventSend boolean
function ExtendedSowingMachineRateEvent.sendEvent(object, automaticMode, manualValue, noEventSend) end
