---@meta
-- FS25 1.25.1.0 : vehicles/VehicleSetIsReconfiguratingEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent to a joining client so that a vehicle is flagged as reconfiguring. It only carries the vehicle reference; the receiver sets `isReconfigurating` to true on that vehicle once it is synchronized. It extends `Event`.
---@class VehicleSetIsReconfiguratingEvent : Event
VehicleSetIsReconfiguratingEvent = {}

--- Creates an empty event instance, used by the network layer before reading a stream.
---@return table
function VehicleSetIsReconfiguratingEvent.emptyNew() end

--- Creates the event for the given vehicle object. Note: the doc comment mentions a `state` parameter that the function does not have.
---@param object table
function VehicleSetIsReconfiguratingEvent.new(object) end

--- Reads the vehicle node object from the stream and, if it exists and is already synchronized, sets its `isReconfigurating` flag to true.
---@param streamId integer
---@param connection Connection
function VehicleSetIsReconfiguratingEvent:readStream(streamId, connection) end

--- Writes the vehicle node object reference to the stream.
---@param streamId integer
---@param connection Connection
function VehicleSetIsReconfiguratingEvent:writeStream(streamId, connection) end
