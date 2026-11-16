# internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that sends the statistics of one farmland from server to a client, in reply to RequestFarmlandStatisticsEvent.

- **FarmlandStatisticsEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `FarmlandStatisticsEvent.emptyNew() → table` | 14 | ✍ Creates an empty FarmlandStatisticsEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `FarmlandStatisticsEvent.new(farmlandId: table)` | 22 | ✍ Creates the event for a farmland id. |
| `FarmlandStatisticsEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Client side: reads the farmland id, then g_precisionFarming.farmlandStatistics:readStatisticFromStream reads the statistics, if the object exists. |
| `FarmlandStatisticsEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Server side: writes the farmland id, then g_precisionFarming.farmlandStatistics:writeStatisticToStream writes the statistics, if the object exists. |
