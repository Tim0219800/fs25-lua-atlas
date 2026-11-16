---@meta
-- FS25 1.25.1.0 : animals/events/AnimalNameEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event for renaming an animal cluster in a husbandry. A client sends it to the server, which applies the rename and rebroadcasts it to the other clients. The static sendEvent helper picks the right path (broadcast on the server, send to server on a client).
---@class AnimalNameEvent : Event
AnimalNameEvent = {}

--- Creates an empty event instance, used before reading from a stream.
function AnimalNameEvent.emptyNew() end

--- Creates the event for a husbandry, cluster id and new name.
---@param husbandry any
---@param clusterId any
---@param name any
function AnimalNameEvent.new(husbandry, clusterId, name) end

--- Reads the husbandry, cluster id and name string, then runs the event.
---@param streamId any
---@param connection any
function AnimalNameEvent:readStream(streamId, connection) end

--- Writes the husbandry, cluster id and name to the stream.
---@param streamId any
---@param connection any
function AnimalNameEvent:writeStream(streamId, connection) end

--- Calls renameAnimal on the husbandry (without sending a new event). If it came from a client, the server rebroadcasts the event to the other clients. There is no nil check on the husbandry.
---@param connection any
function AnimalNameEvent:run(connection) end

--- Sends the rename unless noEventSend is true: the server broadcasts to clients, a client sends to the server.
---@param husbandry any
---@param clusterId any
---@param name any
---@param noEventSend any
function AnimalNameEvent.sendEvent(husbandry, clusterId, name, noEventSend) end
