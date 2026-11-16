# internalMods/FS25_precisionFarming/scripts/events/RequestEnvironmentalScoreEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/RequestEnvironmentalScoreEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/RequestEnvironmentalScoreEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) sent by a client to ask the server for the environmental score data of its farm. The server answers with an EnvironmentalScoreEvent to that connection only.

- **RequestEnvironmentalScoreEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `RequestEnvironmentalScoreEvent.emptyNew() → table` | 14 | ✍ Creates an empty RequestEnvironmentalScoreEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `RequestEnvironmentalScoreEvent.new(farmId: table)` | 22 | ✍ Creates the request for a farm id. |
| `RequestEnvironmentalScoreEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Server side: reads the farm id (FarmManager.FARM_ID_SEND_NUM_BITS bits), then calls run. |
| `RequestEnvironmentalScoreEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Client side: writes the farm id using FarmManager.FARM_ID_SEND_NUM_BITS bits. |
| `RequestEnvironmentalScoreEvent:run(connection: Connection)` | 48 | ✍ Executes only on the server: sends an EnvironmentalScoreEvent for the requested farm back to the requesting connection alone. |
