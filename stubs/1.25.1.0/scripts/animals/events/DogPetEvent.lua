---@meta
-- FS25 1.25.1.0 : animals/events/DogPetEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent by a client to make the server pet a dog. On run it calls Dog:pet when the dog exists.
---@class DogPetEvent : Event
DogPetEvent = {}

--- Creates an empty event instance, used before reading from a stream.
function DogPetEvent.emptyNew() end

--- Creates the event for a dog.
---@param dog any
function DogPetEvent.new(dog) end

--- Reads the dog node object, then runs the event.
---@param streamId any
---@param connection any
function DogPetEvent:readStream(streamId, connection) end

--- Writes the dog node object to the stream.
---@param streamId any
---@param connection any
function DogPetEvent:writeStream(streamId, connection) end

--- If the dog exists, calls pet on it.
---@param connection any
function DogPetEvent:run(connection) end
