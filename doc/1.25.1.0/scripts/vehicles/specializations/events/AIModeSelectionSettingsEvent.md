# vehicles/specializations/events/AIModeSelectionSettingsEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AIModeSelectionSettingsEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIModeSelectionSettingsEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronises the AI mode field course settings (`FieldCourseSettings`) of a vehicle. Clients send it to the server, which applies it and relays it to the others. Use `sendEvent` to emit it.

- **AIModeSelectionSettingsEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIModeSelectionSettingsEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it. |
| `AIModeSelectionSettingsEvent.new(vehicle: table, fieldCourseSettings: integer)` | 23 | ✍ Creates the event for a vehicle with the `FieldCourseSettings` object to sync. |
| `AIModeSelectionSettingsEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads the vehicle and the settings attributes, rebuilds a `FieldCourseSettings` for it and calls `run`. |
| `AIModeSelectionSettingsEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Writes the vehicle and the field course settings. |
| `AIModeSelectionSettingsEvent:run(connection: Connection)` | 59 | ✍ Calls `setAIModeFieldCourseSettings` on a synchronized vehicle; on the server it rebroadcasts to the other clients, excluding the sender. |
| `AIModeSelectionSettingsEvent.sendEvent(vehicle: table, fieldCourseSettings: integer, noEventSend: boolean)` | 74 | ✍ Sends the event unless `noEventSend` is true: the server broadcasts it, a client sends it to the server. |
