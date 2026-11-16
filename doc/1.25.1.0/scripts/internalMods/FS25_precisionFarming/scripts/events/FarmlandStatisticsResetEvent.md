# internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsResetEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsResetEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsResetEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that tells a client to reset the statistics of one farmland. Its payload is only the farmland id.

- **FarmlandStatisticsResetEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `FarmlandStatisticsResetEvent.emptyNew() → table` | 14 | ✍ Creates an empty FarmlandStatisticsResetEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `FarmlandStatisticsResetEvent.new(farmlandId: table)` | 22 | ✍ Creates the event for a farmland id. |
| `FarmlandStatisticsResetEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Client side: reads the farmland id and calls g_precisionFarming.farmlandStatistics:resetStatistic on it, if the object exists. It does not call run. |
| `FarmlandStatisticsResetEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes only the farmland id. |
