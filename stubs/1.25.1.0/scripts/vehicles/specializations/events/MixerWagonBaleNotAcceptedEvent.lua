---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MixerWagonBaleNotAcceptedEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `MixerWagonBaleNotAcceptedEvent` (extends `Event`) that tells a client that a mixer wagon refused a bale. It carries no payload. It belongs to the vehicle specialization events and defines nothing else.
---@class MixerWagonBaleNotAcceptedEvent : Event
MixerWagonBaleNotAcceptedEvent = {}

--- Creates an empty `MixerWagonBaleNotAcceptedEvent` instance without data, used when the event is read from a network stream.
---@return table
function MixerWagonBaleNotAcceptedEvent.emptyNew() end

--- Creates the event with its data: no payload.
function MixerWagonBaleNotAcceptedEvent.new() end

--- Reads the event data from the network stream (no payload), then calls `run`.
---@param streamId integer
---@param connection Connection
function MixerWagonBaleNotAcceptedEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (no payload).
---@param streamId integer
---@param connection Connection
function MixerWagonBaleNotAcceptedEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: shows a critical in-game notification with the text key `warning_baleNotSupported`.
---@param connection any
function MixerWagonBaleNotAcceptedEvent:run(connection) end
