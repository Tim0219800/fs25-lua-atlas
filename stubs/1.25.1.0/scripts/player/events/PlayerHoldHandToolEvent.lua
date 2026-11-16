---@meta
-- FS25 1.25.1.0 : player/events/PlayerHoldHandToolEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that keeps the hand tool held by a player in sync across the server and clients. It is sent on the main channel; a client sends it to the server, which re-broadcasts it to the other clients.
---@class PlayerHoldHandToolEvent : Event
PlayerHoldHandToolEvent = {}

--- Creates an empty event on the main network channel, used when the event is read from a stream.
---@return table
function PlayerHoldHandToolEvent.emptyNew() end

--- Builds the event for a player and a hand tool object id. The `isHolding` argument is accepted but never stored or used. A nil `handToolId` means the hand tool is put away.
---@param player any
---@param handToolId any
---@param isHolding any
function PlayerHoldHandToolEvent.new(player, handToolId, isHolding) end

--- Reads the player node object, then an optional hand tool object id (presence flag first), and immediately runs the event.
---@param streamId integer
---@param connection Connection
function PlayerHoldHandToolEvent:readStream(streamId, connection) end

--- Writes the player node object and, if set, the hand tool object id, preceded by a boolean presence flag.
---@param streamId integer
---@param connection Connection
function PlayerHoldHandToolEvent:writeStream(streamId, connection) end

--- On the server, re-broadcasts the event to the other clients. Then resolves the hand tool and calls `setCurrentHandTool` on the player, only if the tool exists and is synchronized, or with nil to clear it.
---@param connection Connection
function PlayerHoldHandToolEvent:run(connection) end

--- Sends the event unless `noEventSend` is true: the server broadcasts it to all clients, a client sends it to the server.
---@param player table
---@param handToolId integer
---@param noEventSend boolean
function PlayerHoldHandToolEvent.sendEvent(player, handToolId, noEventSend) end
