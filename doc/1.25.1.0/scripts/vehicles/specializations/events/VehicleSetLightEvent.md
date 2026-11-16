# vehicles/specializations/events/VehicleSetLightEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/VehicleSetLightEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VehicleSetLightEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the lights bit mask of a vehicle. The mask width is sent first on 5 bits, then the mask itself. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **VehicleSetLightEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleSetLightEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `VehicleSetLightEvent.new(object: table, lightsTypesMask: integer, numBits: any)` | 23 | ✍ Builds the event with the data to send (a node object, a bit count (5 bits) and the lights type mask on that many bits); stored on the instance for `writeStream`. |
| `VehicleSetLightEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads a node object, a bit count (5 bits) and the lights type mask on that many bits from the stream, then calls `run(connection)`. |
| `VehicleSetLightEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Writes a node object, a bit count (5 bits) and the lights type mask on that many bits to the stream (same order as `readStream`). |
| `VehicleSetLightEvent:run(connection: Connection)` | 55 | ✍ Applies the event on the receiving side: calls `setLightsTypesMask(mask, true, true)` on the object if synchronized, then the server re-broadcasts to the other clients. |
