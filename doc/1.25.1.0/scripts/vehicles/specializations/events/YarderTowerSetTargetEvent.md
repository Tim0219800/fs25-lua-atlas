# vehicles/specializations/events/YarderTowerSetTargetEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/YarderTowerSetTargetEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/YarderTowerSetTargetEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the target of a yarder tower main rope: an active flag plus, when active, a world position. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **YarderTowerSetTargetEvent** inherits from `Event` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `YarderTowerSetTargetEvent.emptyNew() → table` | 20 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `YarderTowerSetTargetEvent.new(object: table, state: table, x: any, y: any, z: any) → table` | 30 | ✍ Builds the event with the data to send (a node object, a boolean state and, only if true, three float32 coordinates); stored on the instance for `writeStream`. |
| `YarderTowerSetTargetEvent:readStream(streamId: integer, connection: Connection)` | 45 | ✍ Reads a node object, a boolean state and, only if true, three float32 coordinates from the stream, then calls `run(connection)`. |
| `YarderTowerSetTargetEvent:writeStream(streamId: integer, connection: Connection)` | 61 | ✍ Writes a node object, a boolean state and, only if true, three float32 coordinates to the stream (same order as `readStream`). |
| `YarderTowerSetTargetEvent:run(connection: Connection)` | 73 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then stores the coordinates as the main rope target in `spec_yarderTower`, marks it valid and calls `setYarderTargetActive(state, true)`. |
| `YarderTowerSetTargetEvent.sendEvent(vehicle: table, state: boolean, x: boolean, y: any, z: any, noEventSend: boolean)` | 93 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
