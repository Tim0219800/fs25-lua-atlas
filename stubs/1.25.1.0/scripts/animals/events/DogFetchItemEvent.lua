---@meta
-- FS25 1.25.1.0 : animals/events/DogFetchItemEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent by a client asking the server to make a dog fetch an item (a ball) thrown by a player. On run it calls Dog:fetchItem if the dog, player and item all resolved.
---@class DogFetchItemEvent : Event
DogFetchItemEvent = {}

--- Creates an empty event instance, used before reading from a stream.
function DogFetchItemEvent.emptyNew() end

--- Creates the event for a dog, the throwing player and the item.
---@param dog any
---@param player any
---@param item any
function DogFetchItemEvent.new(dog, player, item) end

--- Reads the dog, player and item node objects, then runs the event.
---@param streamId any
---@param connection any
function DogFetchItemEvent:readStream(streamId, connection) end

--- Writes the dog, player and item node objects to the stream.
---@param streamId any
---@param connection any
function DogFetchItemEvent:writeStream(streamId, connection) end

--- If dog, player and item are all non-nil, calls fetchItem on the dog.
---@param connection any
function DogFetchItemEvent:run(connection) end
