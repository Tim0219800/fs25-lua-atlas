# vehicles/specializations/events/SetPipeDischargeToGroundEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetPipeDischargeToGroundEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetPipeDischargeToGroundEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the 'discharge to ground' flag of a pipe (e.g. combine unloading pipe) between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **SetPipeDischargeToGroundEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetPipeDischargeToGroundEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `SetPipeDischargeToGroundEvent.new(object: table, dischargeState: boolean)` | 23 | ✍ Builds the event with the data to send (a node object and a boolean discharge state); stored on the instance for `writeStream`. |
| `SetPipeDischargeToGroundEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads a node object and a boolean discharge state from the stream, then calls `run(connection)`. |
| `SetPipeDischargeToGroundEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes a node object and a boolean discharge state to the stream (same order as `readStream`). |
| `SetPipeDischargeToGroundEvent:run(connection: Connection)` | 52 | ✍ Applies the event on the receiving side: calls `setPipeDischargeToGround(state, true)` on the object if it is synchronized, then the server re-broadcasts to the other clients. |
| `SetPipeDischargeToGroundEvent.sendEvent(object: table, dischargeState: boolean, noEventSend: boolean)` | 67 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
