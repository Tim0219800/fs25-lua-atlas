---@meta
-- FS25 1.25.1.0 : vehicles/VehicleAttachRequestEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event a client sends to the server to request attaching an implement. It carries the attacher vehicle, the attachable and the joint description indices of both. The server then runs `attachImplementFromInfo`; the actual attach is announced to clients by `VehicleAttachEvent`.
---@class VehicleAttachRequestEvent : Event
VehicleAttachRequestEvent = {}

--- Creates an empty event instance for stream deserialization.
---@return table
function VehicleAttachRequestEvent.emptyNew() end

--- Builds the request from an info table (`attacherVehicle`, `attachable`, `attacherVehicleJointDescIndex`, `attachableJointDescIndex`).
---@param info table
---@return table
function VehicleAttachRequestEvent.new(info) end

--- Reads both node objects and both 7-bit joint description indices, then calls `run`.
---@param streamId integer
---@param connection Connection
function VehicleAttachRequestEvent:readStream(streamId, connection) end

--- Writes both node objects and both joint description indices (7 bits each) to the stream.
---@param streamId integer
---@param connection Connection
function VehicleAttachRequestEvent:writeStream(streamId, connection) end

--- Server only: if the attacher vehicle is synchronized, calls `attachImplementFromInfo` with this event as info. Ignored on clients.
---@param connection Connection
function VehicleAttachRequestEvent:run(connection) end
