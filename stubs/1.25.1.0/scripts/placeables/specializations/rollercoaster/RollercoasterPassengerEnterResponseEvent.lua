---@meta
-- FS25 1.25.1.0 : placeables/specializations/rollercoaster/RollercoasterPassengerEnterResponseEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client event telling clients which user takes which seat of a rollercoaster, so the matching player can enter the ride. It is the answer to RollercoasterPassengerEnterRequestEvent; seat indices are sent with `PlaceableRollercoaster.SEAT_INDEX_NUM_BITS` bits, zero-based on the wire and one-based in Lua.
---@class RollercoasterPassengerEnterResponseEvent : Event
RollercoasterPassengerEnterResponseEvent = {}

--- Creates an empty event with the class metatable and default channel.
---@return table
function RollercoasterPassengerEnterResponseEvent.emptyNew() end

--- Builds the response from the rollercoaster, a user id and the one-based seat index to occupy.
---@param rollercoaster table
---@param userId integer
---@param seatIndex integer
---@return table
function RollercoasterPassengerEnterResponseEvent.new(rollercoaster, userId, seatIndex) end

--- Reads the rollercoaster, the user id and the seat index (adding 1 to the transmitted value), then runs the event.
---@param streamId integer
---@param connection Connection
function RollercoasterPassengerEnterResponseEvent:readStream(streamId, connection) end

--- Writes the rollercoaster, the user id and the seat index minus 1.
---@param streamId integer
---@param connection Connection
function RollercoasterPassengerEnterResponseEvent:writeStream(streamId, connection) end

--- Finds the player whose unique user id matches the user id among `playerSystem.players` and calls `onEnterRollercoaster` with the seat. Note: if no player matches, `player` stays nil and the call errors.
---@param connection Connection
function RollercoasterPassengerEnterResponseEvent:run(connection) end
