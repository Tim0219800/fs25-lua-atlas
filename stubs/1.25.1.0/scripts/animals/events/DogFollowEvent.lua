---@meta
-- FS25 1.25.1.0 : animals/events/DogFollowEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent by a client to make a dog follow a player, or to send it back to its spawn when no player is given. The stream carries a follow flag and, if set, the player. On run it calls Dog:followEntity or Dog:goToSpawn.
---@class DogFollowEvent : Event
DogFollowEvent = {}

--- Creates an empty event instance, used before reading from a stream.
function DogFollowEvent.emptyNew() end

--- Creates the event for a dog and an optional player; the follow flag is true when a player is given.
---@param dog any
---@param player any
function DogFollowEvent.new(dog, player) end

--- Reads the dog and the follow flag, then the player if following, and runs the event.
---@param streamId any
---@param connection any
function DogFollowEvent:readStream(streamId, connection) end

--- Writes the dog, the follow flag and, when following, the player.
---@param streamId any
---@param connection any
function DogFollowEvent:writeStream(streamId, connection) end

--- If the dog exists: with the follow flag, calls followEntity when the player resolved (it may not exist on this side); without it, calls goToSpawn.
---@param connection any
function DogFollowEvent:run(connection) end
