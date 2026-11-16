---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/SoilSamplerSendEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) telling a soil sampler vehicle to send its taken samples for analysis. Synchronised between clients and server through the usual re-broadcast pattern.
---@class SoilSamplerSendEvent : Event
SoilSamplerSendEvent = {}

--- Creates an empty SoilSamplerSendEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function SoilSamplerSendEvent.emptyNew() end

--- Creates the event for a soil sampler object.
---@param object table
function SoilSamplerSendEvent.new(object) end

--- Reads the network object reference, then calls run.
---@param streamId integer
---@param connection Connection
function SoilSamplerSendEvent:readStream(streamId, connection) end

--- Writes the network object reference.
---@param streamId integer
---@param connection Connection
function SoilSamplerSendEvent:writeStream(streamId, connection) end

--- Receiving side. On the server it first re-broadcasts the event to the other clients (not the sender); then, if the target object exists and is synchronized, it applies the change locally without sending a new event. It calls object:sendTakenSoilSamples(true).
---@param connection Connection
function SoilSamplerSendEvent:run(connection) end

--- Entry point to sync the sending of taken soil samples. Server: broadcasts a new SoilSamplerSendEvent to the clients (bound to the object); client: sends it to the server. Does nothing when noEventSend is true.
---@param object table
---@param noEventSend boolean
function SoilSamplerSendEvent.sendEvent(object, noEventSend) end
