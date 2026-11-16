---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/RideableStableNotificationEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `RideableStableNotificationEvent` (extends `Event`) that tells a client whether a horse is in its stable. It carries an isInStable boolean and the horse name. It belongs to the vehicle specialization events and defines nothing else.
---@class RideableStableNotificationEvent : Event
RideableStableNotificationEvent = {}

--- Creates an empty `RideableStableNotificationEvent` instance without data, used when the event is read from a network stream.
---@return table
function RideableStableNotificationEvent.emptyNew() end

--- Creates the event with its data: an isInStable boolean and the horse name.
---@param isInStable table
---@param name integer
function RideableStableNotificationEvent.new(isInStable, name) end

--- Reads the event data from the network stream (an isInStable boolean and the horse name), then calls `run`.
---@param streamId integer
---@param connection Connection
function RideableStableNotificationEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (an isInStable boolean and the horse name).
---@param streamId integer
---@param connection Connection
function RideableStableNotificationEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: shows an in-game notification (OK or critical) formatted with the horse name.
---@param connection Connection
function RideableStableNotificationEvent:run(connection) end
