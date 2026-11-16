# vehicles/specializations/events/SetWorkModeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetWorkModeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetWorkModeEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the selected work mode of a vehicle between server and clients. The mode index uses WorkMode.WORKMODE_SEND_NUM_BITS bits. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **SetWorkModeEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetWorkModeEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `SetWorkModeEvent.new(vehicle: table, state: integer)` | 23 | ✍ Builds the event with the data to send (a node object and a work mode index (WorkMode.WORKMODE_SEND_NUM_BITS bits)); stored on the instance for `writeStream`. |
| `SetWorkModeEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads a node object and a work mode index (WorkMode.WORKMODE_SEND_NUM_BITS bits) from the stream, then calls `run(connection)`. |
| `SetWorkModeEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes a node object and a work mode index (WorkMode.WORKMODE_SEND_NUM_BITS bits) to the stream (same order as `readStream`). |
| `SetWorkModeEvent:run(connection: Connection)` | 52 | ✍ Applies the event on the receiving side: calls `setWorkMode(state, true)` on the vehicle if synchronized, then the server re-broadcasts. Note: the re-broadcast passes `self.object`, which is never set on this event (it uses `self.vehicle`), so that argument is nil. |
| `SetWorkModeEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 67 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
