---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryCancelCreationEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent from a client to the server when the player cancels the husbandry creation step, so that the server creates the placeable without a meadow. It is client-to-server only; the run method asserts that it is not received from a server connection.
---@class HusbandryCancelCreationEvent : Event
HusbandryCancelCreationEvent = {}

--- Creates an empty event instance for the network layer to fill in `readStream`.
function HusbandryCancelCreationEvent.emptyNew() end

--- Creates the event and stores the given value in `placeableId`, which `writeStream` later sends as a node object id. Note: the caller is expected to pass an id (UNVERIFIED, no caller in this file).
---@param placeableId any
function HusbandryCancelCreationEvent.new(placeableId) end

--- Reads a node object id from the stream into `self.placeable`, then runs the event immediately. Note: it uses `readNodeObjectId`, so whether `self.placeable` is an object or a raw id depends on that function (UNVERIFIED, not in the dump).
---@param streamId any
---@param connection any
function HusbandryCancelCreationEvent:readStream(streamId, connection) end

--- Writes `self.placeableId` to the stream with `NetworkUtil.writeNodeObjectId`.
---@param streamId any
---@param connection any
function HusbandryCancelCreationEvent:writeStream(streamId, connection) end

--- Server side: if the placeable exists and has `createMeadow`, calls `createMeadow(false)` to finish creation without a meadow, as if the meadow dialog had been dismissed. Asserts the event comes from a client.
---@param connection any
function HusbandryCancelCreationEvent:run(connection) end
