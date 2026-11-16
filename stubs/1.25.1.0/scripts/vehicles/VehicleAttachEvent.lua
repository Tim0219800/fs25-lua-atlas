---@meta
-- FS25 1.25.1.0 : vehicles/VehicleAttachEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent by the server to tell clients that an implement was attached to a vehicle. It carries the two node objects, the two joint indices (7 bits each) and whether the implement starts lowered. Subclass of `Event`; on receipt it calls `attachImplement` with noEventSend set.
---@class VehicleAttachEvent : Event
VehicleAttachEvent = {}

--- Creates an empty event instance, used when the event is rebuilt from a network stream.
---@return table
function VehicleAttachEvent.emptyNew() end

--- Builds the event from vehicle, implement, both joint indices and the start-lowered flag. Asserts that `jointIndex` lies in 0..126, since it is sent on 7 bits.
---@param vehicle table
---@param implement table
---@param inputJointIndex integer
---@param jointIndex integer
---@param startLowered boolean
---@return table
function VehicleAttachEvent.new(vehicle, implement, inputJointIndex, jointIndex, startLowered) end

--- Reads vehicle, implement, joint indices and the lowered flag from the stream, then immediately calls `run`.
---@param streamId integer
---@param connection Connection
function VehicleAttachEvent:readStream(streamId, connection) end

--- Writes the vehicle and implement node objects, the two 7-bit joint indices and the lowered flag to the stream.
---@param streamId integer
---@param connection Connection
function VehicleAttachEvent:writeStream(streamId, connection) end

--- If the vehicle is synchronized, attaches the implement locally (without re-sending an event); logs an error if the implement is unknown. When received by the server, it rebroadcasts the event to the other clients.
---@param connection Connection
function VehicleAttachEvent:run(connection) end
