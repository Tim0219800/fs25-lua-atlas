# objects/WashingStationEvent.lua

*[Version française](../../fr/scripts/objects/WashingStationEvent.md)*

Source: `dataS/scripts/objects/WashingStationEvent.lua` — FS25 1.25.1.0

✍ Network event sent by a client to ask the server to start a wash at a washing station. The server resolves the sender's farm from the connection and calls `startWashing` with that farm id.

- **WashingStationEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `WashingStationEvent.emptyNew() → table` | 13 | ✍ Creates an empty event instance, used when reading from a stream. |
| `WashingStationEvent.new(washingStation: table) → table` | 22 | ✍ Creates an event holding the washing station to start. |
| `WashingStationEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Reads the station node object from the stream when received on the server side (sender is a client), then runs the event. |
| `WashingStationEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Writes the station node object to the stream, only when sending from a client to the server. |
| `WashingStationEvent:run(connection: Connection)` | 52 | ✍ Server side only: finds the user and farm for the connection and calls `startWashing(farmId)` on the station. Does nothing if the user or farm is unknown. |
