---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreePlanterLoadPalletEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes loading a sapling pallet onto a tree planter, identifying the pallet by its network object id. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TreePlanterLoadPalletEvent : Event
TreePlanterLoadPalletEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TreePlanterLoadPalletEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a pallet network object id); stored on the instance for `writeStream`.
---@param object table
---@param palletObjectId integer
function TreePlanterLoadPalletEvent.new(object, palletObjectId) end

--- Reads a node object and a pallet network object id from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TreePlanterLoadPalletEvent:readStream(streamId, connection) end

--- Writes a node object and a pallet network object id to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TreePlanterLoadPalletEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `loadPallet(palletObjectId, true)` on the object if synchronized.
---@param connection Connection
function TreePlanterLoadPalletEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param object table
---@param palletObjectId integer
---@param noEventSend boolean
function TreePlanterLoadPalletEvent.sendEvent(object, palletObjectId, noEventSend) end
