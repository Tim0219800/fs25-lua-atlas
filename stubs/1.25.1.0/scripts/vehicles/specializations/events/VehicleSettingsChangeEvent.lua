---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VehicleSettingsChangeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that sends the changed (dirty) vehicle settings as a list of index plus boolean or 8-bit value. `run` is empty: settings are applied while reading. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class VehicleSettingsChangeEvent : Event
VehicleSettingsChangeEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function VehicleSettingsChangeEvent.emptyNew() end

--- Builds the event with the data to send (a node object, a count of dirty settings, then for each one its index, a bool/int type flag and the value); stored on the instance for `writeStream`.
---@param vehicle table
---@param settings boolean
---@param state any
function VehicleSettingsChangeEvent.new(vehicle, settings, state) end

--- Reads a node object, a count of dirty settings, then for each one its index, a bool/int type flag and the value from the stream and applies it directly when the object is synchronized; does not call `run`.
---@param streamId integer
---@param connection Connection
function VehicleSettingsChangeEvent:readStream(streamId, connection) end

--- Writes a node object, a count of dirty settings, then for each one its index, a bool/int type flag and the value to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function VehicleSettingsChangeEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: empty; settings are applied in `readStream` through `setVehicleSettingState(index, state, true)`.
---@param connection Connection
function VehicleSettingsChangeEvent:run(connection) end
