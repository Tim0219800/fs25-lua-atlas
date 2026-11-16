# internalMods/FS25_precisionFarming/scripts/events/RequestFarmlandStatisticsEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/RequestFarmlandStatisticsEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/RequestFarmlandStatisticsEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) sent by a client to ask the server for the statistics of one farmland. The server answers with a FarmlandStatisticsEvent to that connection only.

- **RequestFarmlandStatisticsEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `RequestFarmlandStatisticsEvent.emptyNew() → table` | 14 | ✍ Creates an empty RequestFarmlandStatisticsEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `RequestFarmlandStatisticsEvent.new(farmlandId: table)` | 22 | ✍ Creates the request for a farmland id. |
| `RequestFarmlandStatisticsEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Server side: reads the farmland id, then calls run. |
| `RequestFarmlandStatisticsEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Client side: writes the farmland id. |
| `RequestFarmlandStatisticsEvent:run(connection: Connection)` | 48 | ✍ Executes only on the server: replies with a FarmlandStatisticsEvent for that farmland to the requesting connection alone. |
