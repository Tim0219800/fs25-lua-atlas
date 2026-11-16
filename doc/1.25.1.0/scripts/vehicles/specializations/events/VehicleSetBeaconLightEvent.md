# vehicles/specializations/events/VehicleSetBeaconLightEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/VehicleSetBeaconLightEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VehicleSetBeaconLightEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the beacon light visibility of a vehicle between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **VehicleSetBeaconLightEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleSetBeaconLightEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `VehicleSetBeaconLightEvent.new(object: table, active: boolean)` | 23 | ✍ Builds the event with the data to send (a node object and a boolean active flag); stored on the instance for `writeStream`. |
| `VehicleSetBeaconLightEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads a node object and a boolean active flag from the stream, then calls `run(connection)`. |
| `VehicleSetBeaconLightEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes a node object and a boolean active flag to the stream (same order as `readStream`). |
| `VehicleSetBeaconLightEvent:run(connection: Connection)` | 52 | ✍ Applies the event on the receiving side: calls `setBeaconLightsVisibility(active, true, true)` on the object if synchronized, then the server re-broadcasts to the other clients. |
