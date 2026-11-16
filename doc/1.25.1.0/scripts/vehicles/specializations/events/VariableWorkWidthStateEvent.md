# vehicles/specializations/events/VariableWorkWidthStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/VariableWorkWidthStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VariableWorkWidthStateEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes which left and right work width sections of a vehicle are active (VariableWorkWidth specialization). Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **VariableWorkWidthStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VariableWorkWidthStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `VariableWorkWidthStateEvent.new(vehicle: table, leftSide: integer, rightSide: integer)` | 24 | ✍ Builds the event with the data to send (a node object and two section values (left, right) on VariableWorkWidth.SEND_NUM_BITS bits each); stored on the instance for `writeStream`. |
| `VariableWorkWidthStateEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads a node object and two section values (left, right) on VariableWorkWidth.SEND_NUM_BITS bits each from the stream, then calls `run(connection)`. |
| `VariableWorkWidthStateEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes a node object and two section values (left, right) on VariableWorkWidth.SEND_NUM_BITS bits each to the stream (same order as `readStream`). |
| `VariableWorkWidthStateEvent:run(connection: Connection)` | 56 | ✍ Applies the event on the receiving side: calls `setSectionsActive(left, right, true)` on the vehicle if synchronized, then the server re-broadcasts. Note: the re-broadcast passes `self.object`, which is never set (the event uses `self.vehicle`), so that argument is nil. |
| `VariableWorkWidthStateEvent.sendEvent(vehicle: table, leftSide: integer, rightSide: integer, noEventSend: boolean)` | 72 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
