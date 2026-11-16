# vehicles/specializations/events/InlineWrapperPushOffEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/InlineWrapperPushOffEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/InlineWrapperPushOffEvent.lua` — FS25 1.25.1.0

✍ Network event class `InlineWrapperPushOffEvent` (extends `Event`) that is a client request to push the bale off an inline wrapper. It carries the wrapper vehicle, written only when the stream goes to the server. It belongs to the vehicle specialization events and defines nothing else.

- **InlineWrapperPushOffEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `InlineWrapperPushOffEvent.emptyNew() → table` | 13 | ✍ Creates an empty `InlineWrapperPushOffEvent` instance without data, used when the event is read from a network stream. |
| `InlineWrapperPushOffEvent.new(inlineWrapper: table) → table` | 22 | ✍ Creates the event with its data: the wrapper vehicle, written only when the stream goes to the server. |
| `InlineWrapperPushOffEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Reads the event data from the network stream (the wrapper vehicle, written only when the stream goes to the server), then calls `run`. |
| `InlineWrapperPushOffEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Writes the event data to the network stream (the wrapper vehicle, written only when the stream goes to the server). |
| `InlineWrapperPushOffEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: on the server only, calls `pushOffInlineBale()` on the wrapper. |
