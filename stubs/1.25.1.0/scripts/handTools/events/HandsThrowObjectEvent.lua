---@meta
-- FS25 1.25.1.0 : handTools/events/HandsThrowObjectEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that tells peers a player's hands released the held object, either simply dropped or thrown with a direction and a force. The client of the owning player sends it to the server, which re-broadcasts it to the other clients. The effect is applied through the HandToolHands specialization of the referenced hands object.
---@class HandsThrowObjectEvent : Event
HandsThrowObjectEvent = {}

--- Creates an empty event instance, used by the network layer before `readStream` fills it.
---@return table
function HandsThrowObjectEvent.emptyNew() end

--- Reads the hands object, then a flag telling whether this is a throw. If so it reads a compressed direction (3 components in -1..1) and a force scalar (0..1), then calls `run`.
---@param streamId integer
---@param connection table
function HandsThrowObjectEvent:readStream(streamId, connection) end

--- Writes the hands object and the throw flag; direction and force scalar are only written when the flag is set. Compression bit counts come from constants of the class defined elsewhere.
---@param streamId integer
---@param connection table
function HandsThrowObjectEvent:writeStream(streamId, connection) end

--- Applies the event. On the server it first rebroadcasts to other clients. A non-throw calls `dropHeldItem(true)`; a throw calls `throwHeldItemWithForceVector` with noEventSend set, so no new event is sent.
---@param connection table
function HandsThrowObjectEvent:run(connection) end
