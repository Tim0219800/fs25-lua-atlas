# vehicles/specializations/events/TrailerToggleManualTipEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/TrailerToggleManualTipEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TrailerToggleManualTipEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the start or stop of manual tipping on a trailer between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **TrailerToggleManualTipEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `TrailerToggleManualTipEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `TrailerToggleManualTipEvent.new(object: table, state: boolean) → TrailerToggleManualTipEvent` | 24 | ✍ Builds the event with the data to send (a node object and a boolean tipping state); stored on the instance for `writeStream`. |
| `TrailerToggleManualTipEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads a node object and a boolean tipping state from the stream, then calls `run(connection)`. |
| `TrailerToggleManualTipEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Writes a node object and a boolean tipping state to the stream (same order as `readStream`). |
| `TrailerToggleManualTipEvent:run(connection: Connection)` | 54 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then calls `startTipping(nil, true)` when the state is true, else `stopTipping(true)`. |
| `TrailerToggleManualTipEvent.sendEvent(vehicle: table, state: boolean, noEventSend: boolean?)` | 73 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
