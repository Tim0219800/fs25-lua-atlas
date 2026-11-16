# vehicles/specializations/events/VehicleSetTurnLightEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/VehicleSetTurnLightEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VehicleSetTurnLightEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the turn signal state (off, left, right, hazard) of a vehicle. The constructor asserts the state is between 0 and Lights.TURNLIGHT_HAZARD. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **VehicleSetTurnLightEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleSetTurnLightEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `VehicleSetTurnLightEvent.new(object: table, state: integer)` | 23 | ✍ Builds the event with the data to send (a node object and a turn light state (Lights.turnLightSendNumBits bits)); stored on the instance for `writeStream`. |
| `VehicleSetTurnLightEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads a node object and a turn light state (Lights.turnLightSendNumBits bits) from the stream, then calls `run(connection)`. |
| `VehicleSetTurnLightEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Writes a node object and a turn light state (Lights.turnLightSendNumBits bits) to the stream (same order as `readStream`). |
| `VehicleSetTurnLightEvent:run(connection: Connection)` | 53 | ✍ Applies the event on the receiving side: calls `setTurnLightState(state, true, true)` on the object if synchronized, then the server re-broadcasts to the other clients. |
