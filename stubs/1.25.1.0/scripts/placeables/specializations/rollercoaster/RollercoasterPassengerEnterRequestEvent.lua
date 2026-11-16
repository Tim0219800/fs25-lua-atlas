---@meta
-- FS25 1.25.1.0 : placeables/specializations/rollercoaster/RollercoasterPassengerEnterRequestEvent.lua (generated stub, FS25 Lua Atlas)

--- Client-to-server event asking to board a rollercoaster, carrying the rollercoaster and the requesting player. The server handles it with `tryEnterRide`; the answer is a RollercoasterPassengerEnterResponseEvent (sent by code outside this file).
---@class RollercoasterPassengerEnterRequestEvent : Event
RollercoasterPassengerEnterRequestEvent = {}

--- Creates an empty event with the class metatable and default channel.
---@return table
function RollercoasterPassengerEnterRequestEvent.emptyNew() end

--- Builds the request from the rollercoaster object and the player making it.
---@param rollercoaster table
---@param player table
---@return table
function RollercoasterPassengerEnterRequestEvent.new(rollercoaster, player) end

--- Reads the rollercoaster and the player as network objects, then runs the event.
---@param streamId integer
---@param connection Connection
function RollercoasterPassengerEnterRequestEvent:readStream(streamId, connection) end

--- Writes the rollercoaster and the player as network objects.
---@param streamId integer
---@param connection Connection
function RollercoasterPassengerEnterRequestEvent:writeStream(streamId, connection) end

--- If the rollercoaster is synchronized, calls `tryEnterRide` with the connection and the player. The player is not nil-checked here.
---@param connection Connection
function RollercoasterPassengerEnterRequestEvent:run(connection) end
