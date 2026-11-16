---@meta
-- FS25 1.25.1.0 : player/events/PlayerSetStyleEvent.lua (generated stub, FS25 Lua Atlas)

--- Event that synchronizes a player's appearance (`PlayerStyle`). It is used both for a client announcing its style to the server, which relays it to the others, and for the server answering a `PlayerRequestStyleEvent`.
---@class PlayerSetStyleEvent : Event
PlayerSetStyleEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlayerSetStyleEvent.emptyNew() end

--- Builds the event with a player, a style object and optionally the player's network object id (used instead of the player when set).
---@param player any
---@param style any
---@param playerObjectId any
function PlayerSetStyleEvent.new(player, style, playerObjectId) end

--- Writes the player's network object id (the stored id if given, else the player node object) and then the style through its own `writeStream`.
---@param streamId integer
---@param connection table
function PlayerSetStyleEvent:writeStream(streamId, connection) end

--- Reads the player object id, resolves the player, builds a new `PlayerStyle` and reads it from the stream, then runs the event.
---@param streamId integer
---@param connection table
function PlayerSetStyleEvent:readStream(streamId, connection) end

--- On the server, re-broadcasts to the other clients. Then applies the style with `player:setStyleAsync`, with the event-send flag off. Crashes if the player object could not be resolved (no nil check).
---@param connection table
function PlayerSetStyleEvent:run(connection) end

--- Unless `noEventSend` is true, the server broadcasts the event (excluding the player's own connection) and a client sends it to the server.
---@param player Player
---@param style PlayerStyle
---@param playerObjectId integer?
---@param noEventSend boolean?
function PlayerSetStyleEvent.sendEvent(player, style, playerObjectId, noEventSend) end
