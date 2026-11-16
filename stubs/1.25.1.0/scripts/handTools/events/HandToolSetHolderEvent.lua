---@meta
-- FS25 1.25.1.0 : handTools/events/HandToolSetHolderEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that changes the holder of a hand tool (a player or a `HandToolHolder`), or clears it. A client sends it to the server, which rebroadcasts it; after applying it, it publishes the event class on the message center.
---@class HandToolSetHolderEvent : Event
HandToolSetHolderEvent = {}

--- Creates an empty event instance for the network layer to fill in `readStream`.
---@return table
function HandToolSetHolderEvent.emptyNew() end

--- Creates the event for a hand tool and a holder (may be nil to clear it); `hasHolder` is true when a holder is given.
---@param handTool any
---@param holder any
function HandToolSetHolderEvent.new(handTool, holder) end

--- Reads the hand tool, a bool telling whether there is a holder, and the holder when present, then runs the event.
---@param streamId integer
---@param connection Connection
function HandToolSetHolderEvent:readStream(streamId, connection) end

--- Writes the hand tool, a presence bool and, if a holder exists, the holder as node objects.
---@param streamId integer
---@param connection Connection
function HandToolSetHolderEvent:writeStream(streamId, connection) end

--- If received by the server, rebroadcasts it. When the tool is synchronized and the holder could be resolved (or none was sent), calls `setHolder(holder, true)`. Always publishes `HandToolSetHolderEvent` on `g_messageCenter`.
---@param connection Connection
function HandToolSetHolderEvent:run(connection) end

--- Helper unless `noEventSend` is true: a server broadcasts the event to all clients, a client sends it to the server.
---@param handTool table
---@param holder table
---@param noEventSend boolean
function HandToolSetHolderEvent.sendEvent(handTool, holder, noEventSend) end
