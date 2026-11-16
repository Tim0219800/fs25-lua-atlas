---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TensionBeltsEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the tension belts of a vehicle: activating or releasing either one belt (by id) or all of them (belt id nil). Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TensionBeltsEvent : Event
TensionBeltsEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TensionBeltsEvent.emptyNew() end

--- Builds the event with the data to send (a node object, a flag telling whether the belt id is absent, the optional belt id (sent as id-1 on TensionBelts.NUM_SEND_BITS bits) and the active flag); stored on the instance for `writeStream`.
---@param object table
---@param isActive boolean
---@param beltId integer
function TensionBeltsEvent.new(object, isActive, beltId) end

--- Reads a node object, a flag telling whether the belt id is absent, the optional belt id (sent as id-1 on TensionBelts.NUM_SEND_BITS bits) and the active flag from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TensionBeltsEvent:readStream(streamId, connection) end

--- Writes a node object, a flag telling whether the belt id is absent, the optional belt id (sent as id-1 on TensionBelts.NUM_SEND_BITS bits) and the active flag to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TensionBeltsEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setTensionBeltsActive(active, beltId, true)` on the object if synchronized.
---@param connection Connection
function TensionBeltsEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param isActive boolean
---@param beltId integer
---@param noEventSend boolean
function TensionBeltsEvent.sendEvent(vehicle, isActive, beltId, noEventSend) end
