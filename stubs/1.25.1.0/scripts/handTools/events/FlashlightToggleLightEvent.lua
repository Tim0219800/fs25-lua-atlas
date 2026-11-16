---@meta
-- FS25 1.25.1.0 : handTools/events/FlashlightToggleLightEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the on/off state of a flashlight hand tool. A client sends it to the server, which rebroadcasts it to the others; a server calls `sendEvent` to broadcast directly.
---@class FlashlightToggleLightEvent : Event
FlashlightToggleLightEvent = {}

--- Creates an empty event instance for the network layer to fill in `readStream`.
---@return table
function FlashlightToggleLightEvent.emptyNew() end

--- Creates the event for a flashlight hand tool and a boolean telling whether it is on.
---@param flashlight HandTool
---@param isActive boolean
---@return table
function FlashlightToggleLightEvent.new(flashlight, isActive) end

--- Reads the flashlight (node object) and the active flag from the stream, then runs the event.
---@param streamId integer
---@param connection table
function FlashlightToggleLightEvent:readStream(streamId, connection) end

--- Writes the flashlight as a node object and the active flag to the stream.
---@param streamId integer
---@param connection table
function FlashlightToggleLightEvent:writeStream(streamId, connection) end

--- If received by the server, rebroadcasts it to the other clients. When the flashlight exists and is synchronized, calls `setFlashlightIsActive(isActive, true)`.
---@param connection table
function FlashlightToggleLightEvent:run(connection) end

--- Helper unless `noEventSend` is true: a server broadcasts the event to all clients, a client sends it to the server.
---@param flashlight any
---@param isActive any
---@param noEventSend any
function FlashlightToggleLightEvent.sendEvent(flashlight, isActive, noEventSend) end
