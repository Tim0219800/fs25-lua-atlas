# vehicles/specializations/events/AIAutomaticSteeringRequestEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AIAutomaticSteeringRequestEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIAutomaticSteeringRequestEvent.lua` — FS25 1.25.1.0

✍ Network event asking for an automatic-steering field course to be generated for a vehicle at a field position with given settings. Handling directly calls the vehicle's `generateSteeringFieldCourse`.

- **AIAutomaticSteeringRequestEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIAutomaticSteeringRequestEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it. |
| `AIAutomaticSteeringRequestEvent.new(vehicle: table, x: integer, z: any, fieldCourseSettings: any)` | 23 | ✍ Creates a request for a vehicle with a field position (x, z) and the field course settings to use. |
| `AIAutomaticSteeringRequestEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads the vehicle, a terrain detail pixel position through `g_fieldCourseManager` and the `FieldCourseSettings` attributes, builds the settings object, then calls `run`. |
| `AIAutomaticSteeringRequestEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Writes the vehicle, the terrain pixel position and the field course settings. |
| `AIAutomaticSteeringRequestEvent:run(connection: Connection)` | 62 | ✍ If the vehicle is synchronized, calls `generateSteeringFieldCourse(x, z, settings)` on it. Intended for the receiving side (presumably the server; UNVERIFIED, no side check here). |
