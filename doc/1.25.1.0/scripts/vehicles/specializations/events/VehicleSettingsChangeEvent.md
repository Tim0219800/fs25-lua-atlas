# vehicles/specializations/events/VehicleSettingsChangeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/VehicleSettingsChangeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VehicleSettingsChangeEvent.lua` — FS25 1.25.1.0

✍ Network event that sends the changed (dirty) vehicle settings as a list of index plus boolean or 8-bit value. `run` is empty: settings are applied while reading. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **VehicleSettingsChangeEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleSettingsChangeEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `VehicleSettingsChangeEvent.new(vehicle: table, settings: boolean, state: any)` | 23 | ✍ Builds the event with the data to send (a node object, a count of dirty settings, then for each one its index, a bool/int type flag and the value); stored on the instance for `writeStream`. |
| `VehicleSettingsChangeEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads a node object, a count of dirty settings, then for each one its index, a bool/int type flag and the value from the stream and applies it directly when the object is synchronized; does not call `run`. |
| `VehicleSettingsChangeEvent:writeStream(streamId: integer, connection: Connection)` | 61 | ✍ Writes a node object, a count of dirty settings, then for each one its index, a bool/int type flag and the value to the stream (same order as `readStream`). |
| `VehicleSettingsChangeEvent:run(connection: Connection)` | 92 | ✍ Applies the event on the receiving side: empty; settings are applied in `readStream` through `setVehicleSettingState(index, state, true)`. |
