---@meta
-- FS25 1.25.1.0 : objects/WashingStationEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent by a client to ask the server to start a wash at a washing station. The server resolves the sender's farm from the connection and calls `startWashing` with that farm id.
---@class WashingStationEvent : Event
WashingStationEvent = {}

--- Creates an empty event instance, used when reading from a stream.
---@return table
function WashingStationEvent.emptyNew() end

--- Creates an event holding the washing station to start.
---@param washingStation table
---@return table
function WashingStationEvent.new(washingStation) end

--- Reads the station node object from the stream when received on the server side (sender is a client), then runs the event.
---@param streamId integer
---@param connection Connection
function WashingStationEvent:readStream(streamId, connection) end

--- Writes the station node object to the stream, only when sending from a client to the server.
---@param streamId integer
---@param connection Connection
function WashingStationEvent:writeStream(streamId, connection) end

--- Server side only: finds the user and farm for the connection and calls `startWashing(farmId)` on the station. Does nothing if the user or farm is unknown.
---@param connection Connection
function WashingStationEvent:run(connection) end
