---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodContainerWrongLengthEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client notification that a log of the wrong length was delivered to a wood container. Only the owning farm, within 40 m of the camera, sees a critical in-game notification. The constructor's extra arguments (state, x, y, z) are ignored. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class WoodContainerWrongLengthEvent : Event
WoodContainerWrongLengthEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function WoodContainerWrongLengthEvent.emptyNew() end

--- Builds the event with the data to send (only the node object); stored on the instance for `writeStream`.
---@param object table
---@param state table
---@param x any
---@param y any
---@param z any
---@return table
function WoodContainerWrongLengthEvent.new(object, state, x, y, z) end

--- Reads only the node object from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection integer
function WoodContainerWrongLengthEvent:readStream(streamId, connection) end

--- Writes only the node object to the stream (same order as `readStream`).
---@param streamId integer
---@param connection integer
function WoodContainerWrongLengthEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: if the local farm owns the object and the camera is closer than 40 m, adds a critical in-game notification showing the target length from `spec_woodContainer`.
---@param connection integer
function WoodContainerWrongLengthEvent:run(connection) end
