# objects/BunkerSiloOpenEvent.lua

*[Version française](../../fr/scripts/objects/BunkerSiloOpenEvent.md)*

Source: `dataS/scripts/objects/BunkerSiloOpenEvent.lua` — FS25 1.25.1.0

✍ Network event asking the server to open a bunker silo at a given world position. It carries the silo and three floats. The run step calls openSilo with that position.

- **BunkerSiloOpenEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `BunkerSiloOpenEvent.emptyNew() → table` | 13 | ✍ Creates an empty event instance, used by the network layer before reading from a stream. |
| `BunkerSiloOpenEvent.new(bunkerSilo: table, x: number, y: number, z: number) → table` | 25 | ✍ Creates an event for the given bunker silo and the x, y, z opening position. |
| `BunkerSiloOpenEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Reads the silo node object and three float32 coordinates when the connection is not to a server, then runs the event. Note: run is called whatever the connection type. |
| `BunkerSiloOpenEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Writes the silo node object and the three float32 coordinates, only when the connection is to a server (client to server direction). |
| `BunkerSiloOpenEvent:run(connection: Connection)` | 64 | ✍ When the connection is not to a server, calls openSilo on the silo with the stored x, y, z. |
