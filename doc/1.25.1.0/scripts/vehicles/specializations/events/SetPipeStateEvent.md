# vehicles/specializations/events/SetPipeStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetPipeStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetPipeStateEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the open/close state index of a vehicle pipe between server and clients. The state is sent on 3 bits (values 0 to 7). Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **SetPipeStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetPipeStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `SetPipeStateEvent.new(object: table, pipeState: integer)` | 23 | ✍ Builds the event with the data to send (a node object and a pipe state on 3 bits); stored on the instance for `writeStream`. |
| `SetPipeStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads a node object and a pipe state on 3 bits from the stream, then calls `run(connection)`. |
| `SetPipeStateEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Writes a node object and a pipe state on 3 bits to the stream (same order as `readStream`). |
| `SetPipeStateEvent:run(connection: Connection)` | 53 | ✍ Applies the event on the receiving side: calls `setPipeState(state, true)` on the object if synchronized, then the server re-broadcasts to the other clients. |
