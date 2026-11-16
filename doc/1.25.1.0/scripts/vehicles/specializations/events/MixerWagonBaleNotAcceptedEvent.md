# vehicles/specializations/events/MixerWagonBaleNotAcceptedEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/MixerWagonBaleNotAcceptedEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MixerWagonBaleNotAcceptedEvent.lua` — FS25 1.25.1.0

✍ Network event class `MixerWagonBaleNotAcceptedEvent` (extends `Event`) that tells a client that a mixer wagon refused a bale. It carries no payload. It belongs to the vehicle specialization events and defines nothing else.

- **MixerWagonBaleNotAcceptedEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `MixerWagonBaleNotAcceptedEvent.emptyNew() → table` | 14 | ✍ Creates an empty `MixerWagonBaleNotAcceptedEvent` instance without data, used when the event is read from a network stream. |
| `MixerWagonBaleNotAcceptedEvent.new()` | 22 | ✍ Creates the event with its data: no payload. |
| `MixerWagonBaleNotAcceptedEvent:readStream(streamId: integer, connection: Connection)` | 31 | ✍ Reads the event data from the network stream (no payload), then calls `run`. |
| `MixerWagonBaleNotAcceptedEvent:writeStream(streamId: integer, connection: Connection)` | 39 | ✍ Writes the event data to the network stream (no payload). |
| `MixerWagonBaleNotAcceptedEvent:run(connection: any)` | 44 | ✍ Executes the event on the receiving side: shows a critical in-game notification with the text key `warning_baleNotSupported`. |
