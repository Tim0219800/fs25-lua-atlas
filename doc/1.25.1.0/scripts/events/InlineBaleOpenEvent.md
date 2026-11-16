# events/InlineBaleOpenEvent.lua

*[Version française](../../fr/scripts/events/InlineBaleOpenEvent.md)*

Source: `dataS/scripts/events/InlineBaleOpenEvent.lua` — FS25 1.25.1.0

✍ Network event asking the server to open an inline bale (a bale in a wrapped chain) at a world position. Sent by a client, applied on the server through `openBaleAtPosition`, whose behaviour is UNVERIFIED (InlineBale class not in this file).

- **InlineBaleOpenEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `InlineBaleOpenEvent.emptyNew() → table` | 13 | ✍ Creates an empty event, used when reading from a stream. |
| `InlineBaleOpenEvent.new(inlineBale: table, x: number, y: number, z: number) → table` | 25 | ✍ Creates the event for an inline bale and an opening position (x, y, z, world coordinates). |
| `InlineBaleOpenEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Server side: reads the inline bale node object and three Float32 coordinates, then calls `run`. |
| `InlineBaleOpenEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Client side: writes the inline bale node object and the x, y, z floats; nothing when sent by the server. |
| `InlineBaleOpenEvent:run(connection: Connection)` | 64 | ✍ Server only: calls `openBaleAtPosition(x, y, z)` on the inline bale. |
