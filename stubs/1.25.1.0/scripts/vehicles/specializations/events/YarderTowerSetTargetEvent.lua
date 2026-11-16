---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/YarderTowerSetTargetEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the target of a yarder tower main rope: an active flag plus, when active, a world position. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class YarderTowerSetTargetEvent : Event
YarderTowerSetTargetEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function YarderTowerSetTargetEvent.emptyNew() end

--- Builds the event with the data to send (a node object, a boolean state and, only if true, three float32 coordinates); stored on the instance for `writeStream`.
---@param object table
---@param state table
---@param x any
---@param y any
---@param z any
---@return table
function YarderTowerSetTargetEvent.new(object, state, x, y, z) end

--- Reads a node object, a boolean state and, only if true, three float32 coordinates from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function YarderTowerSetTargetEvent:readStream(streamId, connection) end

--- Writes a node object, a boolean state and, only if true, three float32 coordinates to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function YarderTowerSetTargetEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then stores the coordinates as the main rope target in `spec_yarderTower`, marks it valid and calls `setYarderTargetActive(state, true)`.
---@param connection Connection
function YarderTowerSetTargetEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param state boolean
---@param x boolean
---@param y any
---@param z any
---@param noEventSend boolean
function YarderTowerSetTargetEvent.sendEvent(vehicle, state, x, y, z, noEventSend) end
