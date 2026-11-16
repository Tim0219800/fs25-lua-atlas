# vehicles/specializations/events/YarderTowerFollowModeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/YarderTowerFollowModeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/YarderTowerFollowModeEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the carriage follow mode of a yarder tower (2-bit value). Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **YarderTowerFollowModeEvent** inherits from `Event` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `YarderTowerFollowModeEvent.emptyNew() → table` | 20 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `YarderTowerFollowModeEvent.new(object: table, state: table) → table` | 30 | ✍ Builds the event with the data to send (a node object and a 2-bit follow mode); stored on the instance for `writeStream`. |
| `YarderTowerFollowModeEvent:readStream(streamId: integer, connection: Connection)` | 42 | ✍ Reads a node object and a 2-bit follow mode from the stream, then calls `run(connection)`. |
| `YarderTowerFollowModeEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Writes a node object and a 2-bit follow mode to the stream (same order as `readStream`). |
| `YarderTowerFollowModeEvent:run(connection: Connection)` | 60 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setYarderCarriageFollowMode(state, connection, true)` on the object if synchronized. |
| `YarderTowerFollowModeEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 75 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
