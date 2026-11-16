---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that synchronises the on/off state of a crop sensor on a vehicle between clients and server. A client sends it to the server, which re-broadcasts it.
---@class CropSensorStateEvent : Event
CropSensorStateEvent = {}

--- Creates an empty CropSensorStateEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function CropSensorStateEvent.emptyNew() end

--- Creates the event for a vehicle object and a boolean sensor state.
---@param object table
---@param state boolean
function CropSensorStateEvent.new(object, state) end

--- Reads the network object reference and the boolean state, then calls run.
---@param streamId integer
---@param connection Connection
function CropSensorStateEvent:readStream(streamId, connection) end

--- Writes the network object reference and the boolean state.
---@param streamId integer
---@param connection Connection
function CropSensorStateEvent:writeStream(streamId, connection) end

--- Receiving side. On the server it first re-broadcasts the event to the other clients (not the sender); then, if the target object exists and is synchronized, it applies the change locally without sending a new event. The change is applied with object:setCropSensorActive(state, true).
---@param connection Connection
function CropSensorStateEvent:run(connection) end

--- Entry point to sync the crop sensor state. Server: broadcasts a new CropSensorStateEvent to the clients (bound to the object); client: sends it to the server. Does nothing when noEventSend is true.
---@param object table
---@param state boolean
---@param noEventSend boolean
function CropSensorStateEvent.sendEvent(object, state, noEventSend) end
