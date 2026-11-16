# internalMods/FS25_precisionFarming/scripts/events/RequestFieldBuyInfoEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/RequestFieldBuyInfoEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/RequestFieldBuyInfoEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) sent by a client to ask the server for the extra buy information of a farmland. The server answers with an AdditionalFieldBuyInfoEvent to that connection only.

- **RequestFieldBuyInfoEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `RequestFieldBuyInfoEvent.emptyNew() → table` | 14 | ✍ Creates an empty RequestFieldBuyInfoEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `RequestFieldBuyInfoEvent.new(farmlandId: table)` | 22 | ✍ Creates the request for a farmland id. |
| `RequestFieldBuyInfoEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Server side: reads the farmland id, then calls run. |
| `RequestFieldBuyInfoEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Client side: writes the farmland id. |
| `RequestFieldBuyInfoEvent:run(connection: Connection)` | 48 | ✍ Executes only on the server: replies with an AdditionalFieldBuyInfoEvent for that farmland to the requesting connection alone. Note: the server check is written twice in a nested way, which is redundant. |
