# objects/BunkerSiloCloseEvent.lua

*[Version française](../../fr/scripts/objects/BunkerSiloCloseEvent.md)*

Source: `dataS/scripts/objects/BunkerSiloCloseEvent.lua` — FS25 1.25.1.0

✍ Network event asking the server to close a bunker silo. It carries only the silo object. The run step sets the silo state to closed.

- **BunkerSiloCloseEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `BunkerSiloCloseEvent.emptyNew() → table` | 13 | ✍ Creates an empty event instance, used by the network layer before reading from a stream. |
| `BunkerSiloCloseEvent.new(bunkerSilo: table) → table` | 22 | ✍ Creates an event for the given bunker silo. |
| `BunkerSiloCloseEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Reads the silo node object from the stream when the connection is not to a server, then runs the event. Note: run is called whatever the connection type. |
| `BunkerSiloCloseEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Writes the silo node object to the stream, only when the connection is to a server (client to server direction). |
| `BunkerSiloCloseEvent:run(connection: Connection)` | 52 | ✍ When the connection is not to a server, sets the silo state to BunkerSilo.STATE_CLOSED. |
