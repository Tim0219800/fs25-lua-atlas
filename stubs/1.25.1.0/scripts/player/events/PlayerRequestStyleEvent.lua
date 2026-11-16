---@meta
-- FS25 1.25.1.0 : player/events/PlayerRequestStyleEvent.lua (generated stub, FS25 Lua Atlas)

--- Client-to-server request asking for the current appearance (style) of a given player. The server answers with a `PlayerSetStyleEvent` sent only to the requesting connection.
---@class PlayerRequestStyleEvent : Event
PlayerRequestStyleEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlayerRequestStyleEvent.emptyNew() end

--- Builds the request from the network object id of the player whose style is wanted.
---@param playerObjectId any
function PlayerRequestStyleEvent.new(playerObjectId) end

--- Writes the player's network object id to the stream.
---@param streamId integer
---@param connection table
function PlayerRequestStyleEvent:writeStream(streamId, connection) end

--- Reads the player object id, resolves it to the player object with `NetworkUtil.getObject`, then runs the event.
---@param streamId integer
---@param connection table
function PlayerRequestStyleEvent:readStream(streamId, connection) end

--- Server side only: reads the player's style from `graphicsComponent` and replies to the sender with a `PlayerSetStyleEvent`. If the player is unknown (already left), only an info log is written.
---@param connection table
function PlayerRequestStyleEvent:run(connection) end
